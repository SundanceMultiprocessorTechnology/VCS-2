//////////////////////////////////////////////////////////////
// Company: Sundance Multiprocessor Technology LTD
// Engineer: Timoteo Garcia Bertoa
//
// Design Name: EMC2-DP + FM192-RU 
// Module Name: Test
// Project Name: Standalone_test
// Target Devices: xczu4ev-sfvc784-1-e
// Tool Versions: Xilinx SDK 18.3
//
// Additional Comments: Test 
//
//////////////////////////////////////////////////////////////

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xspips.h"
#include "xuartlite.h"
#include "xiic.h"
//#include "eeprom.h"
//#include <math.h>

#define LED_CHANNEL 1
#define CLEDs_DEVICE_ID XPAR_C_LEDS_DEVICE_ID
#define MLEDs_DEVICE_ID	XPAR_M_LEDS_DEVICE_ID
#define ADC0_DEVICE_ID	XPAR_UARTLITE_0_DEVICE_ID
#define ADC1_DEVICE_ID	XPAR_UARTLITE_1_DEVICE_ID
#define ADC2_DEVICE_ID	XPAR_UARTLITE_2_DEVICE_ID
#define GPIOs_DEVICE_ID	XPAR_AXI_GPIOS_DEVICE_ID
#define IIC_DEVICE_ID XPAR_FMC_I2C_DEVICE_ID
#define TEMP_SENSOR_ADDRESS	0x41

/*#define DAC_SPI_SELECT	0x00
#define DIOs_DEVICE_ID	XPAR_IOS_DEVICE_ID

#define SPI_DEVICE_ID 	XPAR_PSU_SPI_0_DEVICE_ID
#define MAX 4294967295*/

XSpiPs_Config *SpiConfig;
static XSpiPs SpiInstance;
volatile u8 ReceiveComplete;	/* Flag to check completion of Reception */

XUartLite UartLite;
u8 SendBuffer[3];
u8 RecvBuffer[3];

XGpio GpioOutput;
XGpio GpioInput;

XIic IicInstance;	/* The instance of the IIC device. */
u8 ReadBuffer[2];	/* Read buffer for reading a page. */

int ledsmask, diosmask, gpiosmask;

int clean_stdin()
{
    while (getchar()!='\r');
    return 1;
}

int blinkleds()
{
	int Status;

	//Turn on
	Status = XGpio_Initialize(&GpioOutput, MLEDs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_SetDataDirection(&GpioOutput, 1, 0x0);
	XGpio_DiscreteWrite(&GpioOutput, 1, 0xF);

	Status = XGpio_Initialize(&GpioOutput, CLEDs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_SetDataDirection(&GpioOutput, 1, 0x0);
	XGpio_DiscreteWrite(&GpioOutput, 1, 0xF);

	sleep(1);

	//Turn off
	Status = XGpio_Initialize(&GpioOutput, CLEDs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_DiscreteWrite(&GpioOutput, 1, 0x0);

	Status = XGpio_Initialize(&GpioOutput, MLEDs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_DiscreteWrite(&GpioOutput, 1, 0x0);

	sleep(1);

	return XST_SUCCESS;
}

int adcsreset()
{
	int Status;
	unsigned int SentCount;

	//ADC0
	Status = XUartLite_Initialize(&UartLite, ADC0_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x06;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 2);
	if (SentCount != 2) {
		return XST_FAILURE;
	}
	//ADC1
	Status = XUartLite_Initialize(&UartLite, ADC1_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x06;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 2);
	if (SentCount != 2) {
		return XST_FAILURE;
	}
	//ADC2
	Status = XUartLite_Initialize(&UartLite, ADC2_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x06;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 2);
	if (SentCount != 2) {
		return XST_FAILURE;
	}

	return 0;
}

int adcread(int num)
{
	int Status, reg, counter;
	unsigned int SentCount, ReceivedCount = 0;
	int value;
	u16 device = 0;

	//SELECT CHANNEL
	unsigned int mux = ((num%4) + 1) & 0x3;
	unsigned int gain = 1;
	unsigned int pgaBypass = 0x1;
	reg = 0x80 | ((mux&0x3)<<4) | (gain&0x6) | pgaBypass;

	if(num>=0 && num<4) {
		device = ADC0_DEVICE_ID;
	} else if(num>=4 && num<8) {
		device = ADC1_DEVICE_ID;
	} else if(num>=8 && num<12) {
		device = ADC2_DEVICE_ID;
	}

	Status = XUartLite_Initialize(&UartLite, device);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//CONFIGURE REG 0, SELECTING CHANNEL
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x40;
	SendBuffer[2] = reg;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 3);
	if (SentCount != 3) {
		return XST_FAILURE;
	}

	//SELECT CONTINUOUS MODE
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x42;
	SendBuffer[2] = 0x0c; //0x4;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 3);
	if (SentCount != 3) {
		return XST_FAILURE;
	}

	//SELECT AUTOMATIC MODE
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x46;
	SendBuffer[2] = 0x01;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 3);
	if (SentCount != 3) {
		return XST_FAILURE;
	}

	//START
	SendBuffer[0] = 0x55;
	SendBuffer[1] = 0x08;
	SentCount = XUartLite_Send(&UartLite, SendBuffer, 2);
	if (SentCount != 2) {
		return XST_FAILURE;
	}

	//READ
	RecvBuffer[0] = 0;
	RecvBuffer[1] = 0;
	RecvBuffer[2] = 0;

	counter = 0;
	//for(counter=0; counter==8000; counter++)
	for(counter=0; counter<=8000; counter++)
	{
		ReceivedCount += XUartLite_Recv(&UartLite, RecvBuffer, 3);
		value = RecvBuffer[0];
		value = value << 8;
		value = value + RecvBuffer[1];
		value = value << 8;
		value = value + RecvBuffer[2];
		printf("Value: %#08x\n\r", value);
	}

	return XST_SUCCESS;
}

int writegpios()
{
	int Status;

	//Turn on
	Status = XGpio_Initialize(&GpioOutput, GPIOs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_SetDataDirection(&GpioOutput, 1, 0x0);
	XGpio_DiscreteWrite(&GpioOutput, 1, 0xFFFF);

	sleep(1);

	//Turn off
	Status = XGpio_Initialize(&GpioOutput, GPIOs_DEVICE_ID);
	if (Status != XST_SUCCESS)  {
		return XST_FAILURE;
	}
	XGpio_DiscreteWrite(&GpioOutput, 1, 0x0);

	sleep(1);

	return XST_SUCCESS;
}

int main()
{
	int selection;
	int i, temp_value;
	int lednum, dionum, gpionum, dacnum, adcnum;
	int onoff, value;
	int Status;
	int scan = 0;
	XIic_Config *ConfigPtr;	/* Pointer to configuration data */

    init_platform();

    ledsmask = 0x0;
    diosmask = 0x0;
	gpiosmask = 0x0;

    printf("\n\r****------------------------------------------------****\n\r");
    printf(" ***Sundance Multiprocessor Technology Ltd. (c) 2018*** \n\r");
    printf("  **------------------------------------------------**  \n\r");
    printf("    Vivado 18.3\n\r");
    printf("    Timoteo Garcia Bertoa  -timoteo.gb@sundance.com-\n\n\r");
    printf("    FM192 Test\n\n\r");

    //MENU
    while(1){
    	selection = 0;
		printf("Test menu: \n\r");
		printf("    1. LEDs \n\r");
		printf("    2. Test ADCs. Read values from inputs \n\r");
		printf("    3. Write to GPIOs \n\r");
		printf("    4. Read temperature \n\r");
		printf("Please, select which test you want to run: ");
		scan = scanf("%i", &selection);
		if (scan!=1) {selection=0;clean_stdin();}

		switch(selection){
			case 1 : //WRITE TO LED
				for(i=0;i<3;i++){
					blinkleds();
				}
				break;
			case 2 : //TEST ADCs
				adcsreset();
				adcnum = 0;
				printf("\n\rWhich Input? (0..11): ");
				scan = scanf("%i", &adcnum);
				if (scan!=1) {adcnum=12;clean_stdin();}
				if((adcnum < 0) | (adcnum > 11)){ printf("\n\rError\n\r"); break; }
				adcread(adcnum);
				break;
			case 3 : //WRITE TO GPIO
				for(i=0;i<3;i++){
					writegpios();
				}
				break;
			case 4 : //READ TEMPERATURE
				/*
				 * Initialize the IIC driver so that it is ready to use.
				 */
				ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
				if (ConfigPtr == NULL) {
					return XST_FAILURE;
				}

				Status = XIic_CfgInitialize(&IicInstance, ConfigPtr,
						ConfigPtr->BaseAddress);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}
				/*
				 * Initialize the data to write and the read buffer.
				 */
					ReadBuffer[0] = 0;
				/*
				 * Set the Slave address.
				 */
				Status = XIic_SetAddress(&IicInstance, 1,
						TEMP_SENSOR_ADDRESS);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}
				/*
				 * Start the IIC device.
				 */
				Status = XIic_Start(&IicInstance);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}
				/*
				 * Receive the Data.
				 */
				Status = XIic_MasterRecv(&IicInstance, ReadBuffer, 2);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}
				/*
				 * Wait till all the data is received.
				 */
				while ((ReceiveComplete) || (XIic_IsIicBusy(&IicInstance) == TRUE)) {

				}
				/*
				 * Stop the IIC device.
				 */
				Status = XIic_Stop(&IicInstance);
				if (Status != XST_SUCCESS) {
					return XST_FAILURE;
				}

				temp_value = ReadBuffer[1] << 8;
				temp_value = temp_value + ReadBuffer[0];
				temp_value = (temp_value / (2^16))*165 - 40;

				printf("Temperature: %#08x\n\r", temp_value);

				break;

			default : //INVALID
				printf("Invalid number\n\r");
		}
	}
    return 0;
}
