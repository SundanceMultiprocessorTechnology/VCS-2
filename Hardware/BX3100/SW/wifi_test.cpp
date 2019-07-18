#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h> 
#include <string.h>
#include <termios.h>
#include <unistd.h>
#include <iostream>
#include <cstdlib>
#include <ctime>


///////////////////////////////////////////////////////////////////////////////////
// setInterfaceAttribs:
//  configure the serial interface
//
// Parameters:
//  speed: baud rate
//  parity: 0: disable 1:enable
//
// Return:
//  0 if success, <0 if error
///////////////////////////////////////////////////////////////////////////////////	
int setInterfaceAttribs(int uart, int speed, int parity)
{
	struct termios tty;
	
	memset (&tty, 0, sizeof tty);
	if (tcgetattr (uart, &tty) != 0) {
		printf("error %d from tcgetattr", errno);
		return -1;
	}
	
	/* Set Baud Rate */
	cfsetospeed (&tty, speed);
	cfsetispeed (&tty, speed);
	
	/* other settings */
	tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars disable IGNBRK for mismatched speed tests; otherwise receive break as \000 chars
	tty.c_iflag &= ~IGNBRK;         								// disable break processing
	tty.c_lflag = 0;                								// no signaling chars, no echo, no canonical processing
	tty.c_oflag = 0;                								// no remapping, no delays
	tty.c_cc[VMIN]  = 0;            								// read doesn't block // 1??
	tty.c_cc[VTIME] = 5;            								// 0.5 seconds read timeout
	tty.c_iflag &= ~(IXON | IXOFF | IXANY); 				// shut off xon/xoff ctrl
	tty.c_cflag |= (CLOCAL | CREAD);								// ignore modem controls,enable reading
	tty.c_cflag &= ~(PARENB | PARODD);      				// shut off parity
	tty.c_cflag |= parity;
	tty.c_cflag &= ~CSTOPB;
	tty.c_cflag &= ~CRTSCTS;												// no flow control
	
	/* apply attributes */
	if (tcsetattr (uart, TCSANOW, &tty) != 0) {
		printf("error %d from tcsetattr", errno);
		return -2;
	}
	return 0;
}

///////////////////////////////////////////////////////////////////////////////////
// setBlocking:
//  set VMIn to block or non-block the serial read
//
// Parameters:
//  should_block: 0:non-block read 1: block read
//
// Return:
//  0 if success, <0 if error
///////////////////////////////////////////////////////////////////////////////////	
int setBlocking (int uart, int should_block)
{
	struct termios tty;
	
	memset (&tty, 0, sizeof tty);
	
	if (tcgetattr (uart, &tty) != 0) {
		printf("error %d from tggetattr", errno);
		return -1;
	}
	
	tty.c_cc[VMIN]  = should_block ? 1 : 0;
	tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout
	
	if (tcsetattr (uart, TCSANOW, &tty) != 0) {
		printf("error %d setting term attributes", errno);
		return -2;
	}
	
	return 0;
}

void sendCmd(int uart, const char *cmd, const char *msg)
{
	printf("%s \(%s\)\n", cmd, msg);
	int n = write(uart, cmd, 256);

	char rd[256]="";
//	n = read(uart, rd, 256);
//	if (n) printf("%s %d\n", rd,n);

	char buf = '\0';
	int spot = 0;
	n = 1;
	do {
    		n = read(uart, &buf, 1 );
    		sprintf(rd+spot, "%c", buf );
    		spot += n;
	} while(n > 0);

	printf("%s", rd);
}

void read(int uart, int seconds)
{
	char buf = '\0';
	int n = 1;
	std::time_t t1=0, t2=0;
	time(&t1);
	while (t2<seconds) {
    		n = read(uart, &buf, 1 );
		if (n) printf("%c", buf);
		time(&t2);
		t2 = t2-t1;
	}
}

int main ()
{
	int uart = open("/dev/ttyUSB1", O_RDWR | O_NOCTTY | O_SYNC);
	if (!uart) {
 		printf("Cannot open the uart connection. The program will terminate\n");
		return -1;
	}

	setInterfaceAttribs(uart, B115200, 0);
	setBlocking(uart, 0);

	printf("Select the test to run\n1- Wifi\n2- BLE\n3- BT\n");
	int sel = 0;
	scanf("%d", &sel);

if (sel==1) {
	// Test Wifi
	sendCmd(uart, "AT+SRWCFG=3,3", "Configure the device as a station and access point in europe");
	sendCmd(uart, "AT+SRWAPCFG=\"BX31-00411\",\"eulerxyz\",3,1,0,100", "Configure local device's wifi access point");
	sendCmd(uart, "AT+SRWSTACFG=\"SMT_WLAN\", \"8ed84af811\",1", "Configure WiFI station connection");
	sendCmd(uart, "AT+SRWSTACFG?", "Display wifi station info");
	sendCmd(uart, "AT+SRWSTACON=1", "Connect to the current AP");
	sendCmd(uart, "AT+SRWSTACON?", "Display IP address");
	sendCmd(uart, "AT+SRWSTANETCFG?", "display local device wifi station IP address");

	sendCmd(uart, "AT+KTCPCFG=,1,,5005", "Configure a TCP server on port 5005");
	sendCmd(uart, "AT+KTCPCNX=1", "Start TCP connection");
	printf("Open a telnet session on port 5005\n");
	read(uart, 40);
	sendCmd(uart, "AT+KTCPSND=2,\"We are sendind data over TPC\n\r\"", "Send data over TCP connection");
	sendCmd(uart, "AT+KTCPSND=2,\"End of data\"", "Send data over TCP connection");
	sleep(10);
	sendCmd(uart, "AT+KTCPCLOSE=1,1", "Close TCP connection");
	sendCmd(uart, "AT+KTCPCLOSE=2,1", "Close TCP connection");
	sendCmd(uart, "AT+KTCPDEL=1", "Delete TCP session");
	sendCmd(uart, "AT+KTCPDEL=2", "Delete TCP session");

} else if (sel==2) {
	// Test BLE
	sendCmd(uart, "AT+SRBTNAME?", "Read local device's bluetooth Name");
	sendCmd(uart, "AT+SRBTADDR?", "Readlocal bluetooth address");
	sendCmd(uart, "AT+SRBLE?", "Read BLE configuration");
	sendCmd(uart, "AT+SRBLESECCLEAR", "Remove bonded device");
	sendCmd(uart, "AT+SRBLEADDSERV=180D", "Add BLE service in this case heart monitor");
	sendCmd(uart, "AT+SRBLEADDCHARDESCR=50, \"2902\", 17", "Add BLE service characteristic descriptor");
	sendCmd(uart, "AT+SRBLEADDCHAR=50, \"2A37\", 26, 17", "Add BLE service characteristic");
	sendCmd(uart, "AT+SRBLEADV=1", "Start BLE advertising");
	printf("Please connect to the BX31000 from your device using a BLE scanner\n");
	sleep(10);
	sendCmd(uart, "AT+SRBLECFG?", "Print BLE session");
	sendCmd(uart, "AT+SRBLEDISCSERV=1", "Discover BLE session's services");
	sendCmd(uart, "AT+SRBLEDISCINCSERV=1", "Discover BLE session's included services");
	sendCmd(uart, "AT+SRBLESECBOND?", "Display addresses of bonded device");
	printf("You have now 20 seconds to send data to the BX31000\n");
	read(uart, 20);
	printf("Now send data to your device\n");
	sendCmd(uart, "AT+SRBCSMARTSEND=1,0,\"Hell0\"", "Send data to BC smart client");
//	sendCmd(uart, "AT+SRBCSMARTSTART=1,0", "Put BC SMART connection into data mode");

} else if (sel==3) {
	// test BT with audio out
	sendCmd(uart, "AT+SRBTSTATE=1,2", "Write BT device state");
	printf("Please pair the BX31000 to your device\n");
	sleep(10);
	sendCmd(uart, "AT+SRBTPAIR?", "List paired devices");
	sendCmd(uart, "AT+SRSPPCFG?", "List SPP connections");
	sendCmd(uart, "AT+KI2SCFG=0,1", "Configure I2S Master Tx parameters");
	sendCmd(uart, "AT+SRA2DPSTATE=1,1", "Enable BTC A2DP profile");
	printf("You should be able to have your device audio output on the BX3100 development board\n");

} 

//	sendCmd(uart, "AT+SRBLECFG=cc:93:4a:00:41:12", "Create BLE session");
//	sendCmd(uart, "AT+SRBLESECBOND=1,1", "Send bonding request");
//	sendCmd(uart, "AT+SRBLESCAN=5,0", "Configure and start BLE scanning");
//	sleep(2);
//	sendCmd(uart, "AT+SRBTSTATE?", "Read BT device state");

	if (uart>0) close(uart);

	return 0;
}
