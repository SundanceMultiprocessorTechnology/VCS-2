##############################################################################################      ##                     #
## FM192_ZU4CG Constraints file                                                                      ##   S U N D A N C E  #
##############################################################################################         ###                 #
# Company:        Sundance Multiprocessor Technology LTD                                                  ####             #
# Engineer:       Timoteo Garcia Bertoa                                                                      ####          #
# Design Name:    FM192_ZU4CG                                                                                    #####     #
# Tool Versions:  Vivado 18.3                                                                                         ######
##############################################################################################                                                                                                         
                                                                                                                                          
##############################################################################################               
# SPI (BMX055 + DAC)
#Pins
set_property PACKAGE_PIN C2 [get_ports BMX_DAC_SPI_spi1_clk]
set_property PACKAGE_PIN E9 [get_ports BMX_DAC_SPI_spi1_mosi]
set_property PACKAGE_PIN E5 [get_ports BMX_DAC_SPI_spi1_miso]
# Accelerometer 
set_property PACKAGE_PIN D5 [get_ports BMX_DAC_SPI_spi1_cs0]  
# DAC      
set_property PACKAGE_PIN C3 [get_ports BMX_DAC_SPI_spi1_cs1]   
# Geomagnetic 
set_property PACKAGE_PIN D6 [get_ports BMX_DAC_SPI_spi1_cs2]            
# Gyroscope   
set_property PACKAGE_PIN D7 [get_ports BMX_DAC_SPI_spi1_cs3]                  
#IO Standards
set_property IOSTANDARD LVCMOS18 [get_ports BMX_DAC_SPI_*]
##############################################################################################

##############################################################################################               
# SPI (GPIO)
#Pins
set_property PACKAGE_PIN C1 [get_ports GPIO_SPI_spi0_clk]
set_property PACKAGE_PIN AB2 [get_ports GPIO_SPI_spi0_mosi]
set_property PACKAGE_PIN AC2 [get_ports GPIO_SPI_spi0_miso]
set_property PACKAGE_PIN B1 [get_ports GPIO_SPI_spi0_cs0]
set_property PACKAGE_PIN C6 [get_ports GPIO_SPI_spi0_cs1]
#IO Standards
set_property IOSTANDARD LVCMOS18 [get_ports GPIO_SPI_*]
##############################################################################################

##############################################################################################               
# Ethernet LEDs
#Pins
set_property PACKAGE_PIN K8 [get_ports {PHY_LED_TE[0]}]
set_property SLEW FAST [get_ports {PHY_LED_TE[0]}]
set_property PACKAGE_PIN J1 [get_ports {PHY_LED_TE[1]}]
set_property SLEW FAST [get_ports {PHY_LED_TE[1]}]
set_property PACKAGE_PIN A2 [get_ports {PHY_LED[0]}]
set_property SLEW FAST [get_ports {PHY_LED[0]}]
set_property PACKAGE_PIN A1 [get_ports {PHY_LED[1]}]
set_property SLEW FAST [get_ports {PHY_LED[1]}]
#IO Standards
set_property IOSTANDARD LVCMOS18 [get_ports PHY_*]
##############################################################################################

##############################################################################################               
# CAN Bus
#Pins
set_property PACKAGE_PIN A6 [get_ports CAN0_rx]
set_property PACKAGE_PIN A7 [get_ports CAN0_tx]
set_property PACKAGE_PIN A3 [get_ports CAN1_rx]
set_property PACKAGE_PIN A12 [get_ports CAN1_tx]
#IO Standards
set_property IOSTANDARD LVCMOS18 [get_ports CAN*]
##############################################################################################

##############################################################################################
# HDMI INTERFACE

#ADV7511
set_property PACKAGE_PIN K3 [get_ports hdmi_out_vsync]
set_property SLEW FAST [get_ports hdmi_out_vsync]
#set_property DRIVE 16 [get_ports hdmi_out_vsync]

set_property PACKAGE_PIN K4 [get_ports hdmi_out_hsync]
set_property SLEW FAST [get_ports hdmi_out_hsync]
#set_property DRIVE 16 [get_ports hdmi_out_hsync]

set_property PACKAGE_PIN L6 [get_ports hdmi_out_clk]
set_property SLEW FAST [get_ports hdmi_out_clk]
#set_property DRIVE 16 [get_ports hdmi_out_clk]

set_property PACKAGE_PIN L7 [get_ports hdmi_out_de]
set_property SLEW FAST [get_ports hdmi_out_de]
#set_property DRIVE 16 [get_ports hdmi_out_de]

set_property PACKAGE_PIN M8 [get_ports {cec_clk[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {cec_clk[0]}]

##TPD12S016
set_property PACKAGE_PIN L2 [get_ports {ct_hpd[0]}]
set_property PACKAGE_PIN L8 [get_ports {ls_oe[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports {ct_hpd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ls_oe[0]}]

#DATA
set_property PACKAGE_PIN T6 [get_ports {hdmi_out_data[0]}]
set_property PACKAGE_PIN R6 [get_ports {hdmi_out_data[1]}]
set_property PACKAGE_PIN V9 [get_ports {hdmi_out_data[2]}]
set_property PACKAGE_PIN U9 [get_ports {hdmi_out_data[3]}]
set_property PACKAGE_PIN T7 [get_ports {hdmi_out_data[4]}]
set_property PACKAGE_PIN N8 [get_ports {hdmi_out_data[5]}]
set_property PACKAGE_PIN R7 [get_ports {hdmi_out_data[6]}]
set_property PACKAGE_PIN N9 [get_ports {hdmi_out_data[7]}]
set_property PACKAGE_PIN Y8 [get_ports {hdmi_out_data[8]}]
set_property PACKAGE_PIN V8 [get_ports {hdmi_out_data[9]}]
set_property PACKAGE_PIN W8 [get_ports {hdmi_out_data[10]}]
set_property PACKAGE_PIN U8 [get_ports {hdmi_out_data[11]}]

set_property SLEW FAST [get_ports {hdmi_out_data[11]}]
set_property SLEW FAST [get_ports {hdmi_out_data[10]}]
set_property SLEW FAST [get_ports {hdmi_out_data[9]}]
set_property SLEW FAST [get_ports {hdmi_out_data[8]}]
set_property SLEW FAST [get_ports {hdmi_out_data[7]}]
set_property SLEW FAST [get_ports {hdmi_out_data[6]}]
set_property SLEW FAST [get_ports {hdmi_out_data[5]}]
set_property SLEW FAST [get_ports {hdmi_out_data[4]}]
set_property SLEW FAST [get_ports {hdmi_out_data[3]}]
set_property SLEW FAST [get_ports {hdmi_out_data[2]}]
set_property SLEW FAST [get_ports {hdmi_out_data[1]}]
set_property SLEW FAST [get_ports {hdmi_out_data[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports hdmi_*]

#set_property DRIVE 16 [get_ports {hdmi_out_data[11]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[10]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[9]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[8]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[7]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[6]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[5]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[4]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[3]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[2]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[1]}]
#set_property DRIVE 16 [get_ports {hdmi_out_data[0]}]
##############################################################################################
