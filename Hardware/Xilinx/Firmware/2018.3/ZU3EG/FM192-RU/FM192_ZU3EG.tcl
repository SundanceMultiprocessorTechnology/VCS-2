################################################################################################
# Company:        Sundance Multiprocessor Technology LTD
# Engineer:       Timoteo Garcia Bertoa
# Design Name:    FM192_ZU3EG
# Tool Versions:  Vivado 18.3
################################################################################################

#Use script's path as project's path
set script_path [file dirname [file normalize [info script]]]

#Create project for FM192_ZU3EG
create_project FM192_ZU3EG $script_path/FM192_ZU3EG -part xczu3eg-sfvc784-1-e

#Board part selection (1.0 = 1GB RAM, 2.0 = 2GB RAM)
#set_property board_part sundance.com:emc2-dp_te0820_3eg_1e:part0:1.0 [current_project]
set_property board_part sundance.com:emc2-dp_te0820_3eg_1e:part0:2.0 [current_project]
set_property board_connections {fmc_lpc_connector sundance:fm192-ru:fmc_lpc_connector:1.0} [current_project]

#Add repositories at IP Catalog
set_property  ip_repo_paths  $script_path/../../IP_Repo_ZU [current_project]
update_ip_catalog

#Set target to VHDL
set_property target_language VHDL [current_project]

#Create block design in IP Integrator
create_bd_design "design_1"

#Add Zynq IP. Enable interrupts. Set SPI0 clk to 20MHz
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.2 zynq_ultra_ps_e_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]

#Enable IRQ, SPI and SATA. Set I2C0 to 38..39. Enable RPI GPIO SPI interface.
set_property -dict [list CONFIG.PSU__USE__IRQ0 {1} CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__FREQMHZ {20} CONFIG.PSU__SPI1__PERIPHERAL__ENABLE {1} CONFIG.PSU__SPI1__PERIPHERAL__IO {EMIO} \
CONFIG.PSU__SATA__PERIPHERAL__ENABLE {1} CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 38 .. 39} CONFIG.PSU__SPI0__GRP_SS1__ENABLE {1} CONFIG.PSU__SPI1__GRP_SS1__ENABLE {1} CONFIG.PSU__SPI1__GRP_SS2__ENABLE {1}] [get_bd_cells zynq_ultra_ps_e_0]

#Add CAN bus support
startgroup
set_property -dict [list CONFIG.PSU__CAN0__PERIPHERAL__ENABLE {1} CONFIG.PSU__CAN0__PERIPHERAL__IO {EMIO} CONFIG.PSU__CAN0__GRP_CLK__ENABLE {0} CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {1} \
CONFIG.PSU__CAN1__PERIPHERAL__IO {EMIO}] [get_bd_cells zynq_ultra_ps_e_0]
endgroup
startgroup
make_bd_intf_pins_external  [get_bd_intf_pins zynq_ultra_ps_e_0/CAN_0]
endgroup
startgroup
make_bd_intf_pins_external  [get_bd_intf_pins zynq_ultra_ps_e_0/CAN_1]
endgroup
set_property name CAN0 [get_bd_intf_ports CAN_0_0]
set_property name CAN1 [get_bd_intf_ports CAN_1_0]

#Add Ethernet LEDs
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0
endgroup
set_property -dict [list CONFIG.C_SIZE {2} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells util_vector_logic_0]
startgroup
make_bd_pins_external  [get_bd_pins util_vector_logic_0/Op1]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins util_vector_logic_0/Res]
endgroup
set_property name PHY_LED_TE [get_bd_ports Op1_0]
set_property name PHY_LED [get_bd_ports Res_0]
set_property name Ethernet_LEDs [get_bd_cells util_vector_logic_0]

#Add GPIOs interface
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_onboardgpios" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
set_property name GPIOs [get_bd_intf_ports fmc_lpc_connector_onboardgpios]
set_property name AXI_GPIOs [get_bd_cells axi_gpio_0]

#Add SPI Interfaces
startgroup
create_bd_cell -type ip -vlnv sundance.com:user:FM192_SPI_Buffering:1.0 FM192_SPI_Buffering_0
endgroup
connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e_0/SPI_0] [get_bd_intf_pins FM192_SPI_Buffering_0/S_SPI0]
connect_bd_intf_net [get_bd_intf_pins zynq_ultra_ps_e_0/SPI_1] [get_bd_intf_pins FM192_SPI_Buffering_0/S_SPI1]
startgroup
make_bd_intf_pins_external  [get_bd_intf_pins FM192_SPI_Buffering_0/SPI0]
endgroup
startgroup
make_bd_intf_pins_external  [get_bd_intf_pins FM192_SPI_Buffering_0/SPI1]
endgroup
set_property name GPIO_SPI [get_bd_intf_ports SPI0_0]
set_property name BMX_DAC_SPI [get_bd_intf_ports SPI1_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
endgroup
set_property -dict [list CONFIG.C_GPIO_WIDTH {1} CONFIG.C_ALL_OUTPUTS {1}] [get_bd_cells axi_gpio_0]
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_o] [get_bd_pins FM192_SPI_Buffering_0/flag]
set_property name SPI_flag [get_bd_cells axi_gpio_0]

#Add UART Controller for UART0 interface in 40-pin GPIO header
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_gpio_uart0" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name GPIO_UART0 [get_bd_intf_ports fmc_lpc_connector_gpio_uart0]
set_property name AXI_GPIO_UART0 [get_bd_cells axi_uartlite_0]

#Add UART Controller for UART1 interface in 40-pin GPIO header
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_gpio_uart1" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name GPIO_UART1 [get_bd_intf_ports fmc_lpc_connector_gpio_uart1]
set_property name AXI_GPIO_UART1 [get_bd_cells axi_uartlite_0]

#Add I2C Controller for I2C 0 interface in 40-pin GPIO header
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0
apply_board_connection -board_interface "fmc_lpc_connector_gpio_i2c0" -ip_intf "axi_iic_0/IIC" -diagram "design_1" 
endgroup
set_property name GPIO_I2C0 [get_bd_intf_ports fmc_lpc_connector_gpio_i2c0]
set_property name AXI_GPIO_I2C0 [get_bd_cells axi_iic_0]
set_property -dict [list CONFIG.C_GPO_WIDTH {1} CONFIG.IIC_FREQ_KHZ {400}] [get_bd_cells AXI_GPIO_I2C0]

#Add I2C Controller for I2C 1 interface in 40-pin GPIO header
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0
apply_board_connection -board_interface "fmc_lpc_connector_gpio_i2c1" -ip_intf "axi_iic_0/IIC" -diagram "design_1" 
endgroup
set_property name GPIO_I2C1 [get_bd_intf_ports fmc_lpc_connector_gpio_i2c1]
set_property name AXI_GPIO_I2C1 [get_bd_cells axi_iic_0]
set_property -dict [list CONFIG.C_GPO_WIDTH {1} CONFIG.IIC_FREQ_KHZ {400}] [get_bd_cells AXI_GPIO_I2C1]

#Add GPIO Controller for M_LEDs
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_onboardleds" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
set_property name M_Board_LEDs [get_bd_intf_ports fmc_lpc_connector_onboardleds]
set_property name M_LEDs [get_bd_cells axi_gpio_0]

#Add GPIO Controller for C_LEDs
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "onboardleds" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
set_property name C_Board_LEDs [get_bd_intf_ports onboardleds]
set_property name C_LEDs [get_bd_cells axi_gpio_0]

#Add BX3100 UART Interface
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_bx3100_uart_cts" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
apply_board_connection -board_interface "fmc_lpc_connector_bx3100_uart_rts" -ip_intf "/axi_gpio_0/GPIO2" -diagram "design_1" 
set_property name BX3100_UART_CTS [get_bd_intf_ports fmc_lpc_connector_bx3100_uart_cts]
set_property name BX3100_UART_RTS [get_bd_intf_ports fmc_lpc_connector_bx3100_uart_rts]
set_property name BX3100_UART_CTS_RTS [get_bd_cells axi_gpio_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_bx3100_uart" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name BX3100_UART [get_bd_intf_ports fmc_lpc_connector_bx3100_uart]
set_property name AXI_BX3100_UART [get_bd_cells axi_uartlite_0]

#Add HL7800 UART Interface
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_hl7800_uart_cts" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
apply_board_connection -board_interface "fmc_lpc_connector_hl7800_uart_rts" -ip_intf "/axi_gpio_0/GPIO2" -diagram "design_1" 
set_property name HL7800_UART_CTS [get_bd_intf_ports fmc_lpc_connector_hl7800_uart_cts]
set_property name HL7800_UART_RTS [get_bd_intf_ports fmc_lpc_connector_hl7800_uart_rts]
set_property name HL7800_UART_CTS_RTS [get_bd_cells axi_gpio_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_hl7800_uart1" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name HL7800_UART1 [get_bd_intf_ports fmc_lpc_connector_hl7800_uart1]
set_property name AXI_HL7800_UART1 [get_bd_cells axi_uartlite_0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_hl7800_uart2" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name HL7800_UART2 [get_bd_intf_ports fmc_lpc_connector_hl7800_uart2]
set_property name AXI_HL7800_UART2 [get_bd_cells axi_uartlite_0]

#Add HL7800/BX3100 Control Signals
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_control_signals" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
set_property name Control_signals [get_bd_intf_ports fmc_lpc_connector_control_signals]
set_property name HL7800_BX3100_Control [get_bd_cells axi_gpio_0]

#Add GPIO Controller for ADC_UART_RQs
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
apply_board_connection -board_interface "fmc_lpc_connector_adc_uart_rq" -ip_intf "axi_gpio_0/GPIO" -diagram "design_1" 
endgroup
set_property name UART_RQ [get_bd_intf_ports fmc_lpc_connector_adc_uart_rq]
set_property name ADC_UART_RQs [get_bd_cells axi_gpio_0]

#Add UART Controller for ADC_UART_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_adc_uart_1" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name UART_1 [get_bd_intf_ports fmc_lpc_connector_adc_uart_1]
set_property name ADC_UART_1 [get_bd_cells axi_uartlite_0]

#Add UART Controller for ADC_UART_2
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_adc_uart_2" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name UART_2 [get_bd_intf_ports fmc_lpc_connector_adc_uart_2]
set_property name ADC_UART_2 [get_bd_cells axi_uartlite_0]

#Add UART Controller for ADC_UART_3
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
apply_board_connection -board_interface "fmc_lpc_connector_adc_uart_3" -ip_intf "axi_uartlite_0/UART" -diagram "design_1" 
endgroup
set_property name UART_3 [get_bd_intf_ports fmc_lpc_connector_adc_uart_3]
set_property name ADC_UART_3 [get_bd_cells axi_uartlite_0]

#Add I2C Controller for FMC I2C bus
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0
apply_board_connection -board_interface "fmc_lpc_connector_i2c_fmcbus" -ip_intf "axi_iic_0/IIC" -diagram "design_1" 
endgroup
set_property name I2C2 [get_bd_intf_ports fmc_lpc_connector_i2c_fmcbus]
set_property name FMC_I2C [get_bd_cells axi_iic_0]
set_property -dict [list CONFIG.C_GPO_WIDTH {1} CONFIG.IIC_FREQ_KHZ {400}] [get_bd_cells FMC_I2C]

#Connect interrupts to PS
startgroup
set_property -dict [list CONFIG.PSU__USE__IRQ1 {1}] [get_bd_cells zynq_ultra_ps_e_0]
endgroup
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup
set_property name PLPS_INT1 [get_bd_cells xlconcat_0]
set_property -dict [list CONFIG.IN0_WIDTH.VALUE_SRC USER CONFIG.IN2_WIDTH.VALUE_SRC USER CONFIG.IN1_WIDTH.VALUE_SRC USER] [get_bd_cells PLPS_INT1]
set_property -dict [list CONFIG.NUM_PORTS {8}] [get_bd_cells PLPS_INT1]
connect_bd_net [get_bd_pins ADC_UART_1/interrupt] [get_bd_pins PLPS_INT1/In0]
connect_bd_net [get_bd_pins ADC_UART_2/interrupt] [get_bd_pins PLPS_INT1/In1]
connect_bd_net [get_bd_pins ADC_UART_3/interrupt] [get_bd_pins PLPS_INT1/In2]
connect_bd_net [get_bd_pins AXI_GPIO_UART0/interrupt] [get_bd_pins PLPS_INT1/In3]
connect_bd_net [get_bd_pins AXI_GPIO_UART1/interrupt] [get_bd_pins PLPS_INT1/In4]
connect_bd_net [get_bd_pins FMC_I2C/iic2intc_irpt] [get_bd_pins PLPS_INT1/In5]
connect_bd_net [get_bd_pins AXI_GPIO_I2C0/iic2intc_irpt] [get_bd_pins PLPS_INT1/In6]
connect_bd_net [get_bd_pins AXI_GPIO_I2C1/iic2intc_irpt] [get_bd_pins PLPS_INT1/In7]
connect_bd_net [get_bd_pins PLPS_INT1/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup
set_property name PLPS_INT2 [get_bd_cells xlconcat_0]
set_property -dict [list CONFIG.IN0_WIDTH.VALUE_SRC USER CONFIG.IN2_WIDTH.VALUE_SRC USER CONFIG.IN1_WIDTH.VALUE_SRC USER] [get_bd_cells PLPS_INT2]
set_property -dict [list CONFIG.NUM_PORTS {3}] [get_bd_cells PLPS_INT2]
connect_bd_net [get_bd_pins AXI_BX3100_UART/interrupt] [get_bd_pins PLPS_INT2/In0]
connect_bd_net [get_bd_pins AXI_HL7800_UART1/interrupt] [get_bd_pins PLPS_INT2/In1]
connect_bd_net [get_bd_pins AXI_HL7800_UART2/interrupt] [get_bd_pins PLPS_INT2/In2]
connect_bd_net [get_bd_pins PLPS_INT2/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq1]

#Apply AXI connections
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_GPIOs/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_GPIOs/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_GPIO_UART0/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_GPIO_UART0/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_GPIO_UART1/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_GPIO_UART1/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_GPIO_I2C0/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_GPIO_I2C0/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_GPIO_I2C1/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_GPIO_I2C1/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/M_LEDs/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins M_LEDs/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/C_LEDs/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins C_LEDs/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/BX3100_UART_CTS_RTS/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins BX3100_UART_CTS_RTS/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_BX3100_UART/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_BX3100_UART/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/HL7800_UART_CTS_RTS/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins HL7800_UART_CTS_RTS/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_HL7800_UART1/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_HL7800_UART1/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/AXI_HL7800_UART2/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins AXI_HL7800_UART2/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/HL7800_BX3100_Control/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins HL7800_BX3100_Control/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/ADC_UART_RQs/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins ADC_UART_RQs/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/ADC_UART_1/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins ADC_UART_1/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/ADC_UART_2/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins ADC_UART_2/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/ADC_UART_3/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins ADC_UART_3/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/FMC_I2C/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins FMC_I2C/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/zynq_ultra_ps_e_0/M_AXI_HPM0_LPD} Slave {/SPI_flag/S_AXI} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins SPI_flag/S_AXI]
endgroup

#Regenerate layout
regenerate_bd_layout
regenerate_bd_layout -routing

#Create VHDL wrapper
make_wrapper -files [get_files $script_path/FM192_ZU3EG/FM192_ZU3EG.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse $script_path/FM192_ZU3EG/FM192_ZU3EG.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd

#Add constraints file
add_files -fileset constrs_1 -norecurse $script_path/FM192_ZU3EG.xdc

#Build project and generate bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1

#Export .hdf and .bit
file mkdir $script_path/FM192_ZU3EG/FM192_ZU3EG.sdk
file copy -force $script_path/FM192_ZU3EG/FM192_ZU3EG.runs/impl_1/design_1_wrapper.sysdef $script_path/FM192_ZU3EG/FM192_ZU3EG.sdk/design_1_wrapper.hdf


