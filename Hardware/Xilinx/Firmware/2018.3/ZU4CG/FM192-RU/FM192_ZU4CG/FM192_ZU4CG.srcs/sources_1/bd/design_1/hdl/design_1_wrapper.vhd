--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
--Date        : Thu May 23 12:00:35 2019
--Host        : timinPC running 64-bit Ubuntu 18.04.2 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    BMX_DAC_SPI_spi1_clk : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs0 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs1 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs2 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs3 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_miso : in STD_LOGIC;
    BMX_DAC_SPI_spi1_mosi : out STD_LOGIC;
    BX3100_UART_CTS_tri_i : in STD_LOGIC;
    BX3100_UART_RTS_tri_o : out STD_LOGIC;
    BX3100_UART_rxd : in STD_LOGIC;
    BX3100_UART_txd : out STD_LOGIC;
    CAN0_rx : in STD_LOGIC;
    CAN0_tx : out STD_LOGIC;
    CAN1_rx : in STD_LOGIC;
    CAN1_tx : out STD_LOGIC;
    C_Board_LEDs_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Control_signals_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_I2C0_scl_io : inout STD_LOGIC;
    GPIO_I2C0_sda_io : inout STD_LOGIC;
    GPIO_I2C1_scl_io : inout STD_LOGIC;
    GPIO_I2C1_sda_io : inout STD_LOGIC;
    GPIO_SPI_spi0_clk : out STD_LOGIC;
    GPIO_SPI_spi0_cs0 : out STD_LOGIC;
    GPIO_SPI_spi0_cs1 : out STD_LOGIC;
    GPIO_SPI_spi0_miso : in STD_LOGIC;
    GPIO_SPI_spi0_mosi : out STD_LOGIC;
    GPIO_UART0_rxd : in STD_LOGIC;
    GPIO_UART0_txd : out STD_LOGIC;
    GPIO_UART1_rxd : in STD_LOGIC;
    GPIO_UART1_txd : out STD_LOGIC;
    GPIOs_tri_io : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    HL7800_UART1_rxd : in STD_LOGIC;
    HL7800_UART1_txd : out STD_LOGIC;
    HL7800_UART2_rxd : in STD_LOGIC;
    HL7800_UART2_txd : out STD_LOGIC;
    HL7800_UART_CTS_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HL7800_UART_RTS_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    I2C2_scl_io : inout STD_LOGIC;
    I2C2_sda_io : inout STD_LOGIC;
    M_Board_LEDs_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    PHY_LED : out STD_LOGIC_VECTOR ( 1 downto 0 );
    PHY_LED_TE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UART_1_rxd : in STD_LOGIC;
    UART_1_txd : out STD_LOGIC;
    UART_2_rxd : in STD_LOGIC;
    UART_2_txd : out STD_LOGIC;
    UART_3_rxd : in STD_LOGIC;
    UART_3_txd : out STD_LOGIC;
    UART_RQ_tri_i : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    CAN0_tx : out STD_LOGIC;
    CAN0_rx : in STD_LOGIC;
    CAN1_tx : out STD_LOGIC;
    CAN1_rx : in STD_LOGIC;
    PHY_LED_TE : in STD_LOGIC_VECTOR ( 1 downto 0 );
    PHY_LED : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GPIOs_tri_i : in STD_LOGIC_VECTOR ( 14 downto 0 );
    GPIOs_tri_o : out STD_LOGIC_VECTOR ( 14 downto 0 );
    GPIOs_tri_t : out STD_LOGIC_VECTOR ( 14 downto 0 );
    GPIO_SPI_spi0_clk : out STD_LOGIC;
    GPIO_SPI_spi0_mosi : out STD_LOGIC;
    GPIO_SPI_spi0_miso : in STD_LOGIC;
    GPIO_SPI_spi0_cs0 : out STD_LOGIC;
    GPIO_SPI_spi0_cs1 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_clk : out STD_LOGIC;
    BMX_DAC_SPI_spi1_mosi : out STD_LOGIC;
    BMX_DAC_SPI_spi1_miso : in STD_LOGIC;
    BMX_DAC_SPI_spi1_cs0 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs1 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs2 : out STD_LOGIC;
    BMX_DAC_SPI_spi1_cs3 : out STD_LOGIC;
    GPIO_UART0_rxd : in STD_LOGIC;
    GPIO_UART0_txd : out STD_LOGIC;
    GPIO_UART1_rxd : in STD_LOGIC;
    GPIO_UART1_txd : out STD_LOGIC;
    GPIO_I2C0_scl_i : in STD_LOGIC;
    GPIO_I2C0_scl_o : out STD_LOGIC;
    GPIO_I2C0_scl_t : out STD_LOGIC;
    GPIO_I2C0_sda_i : in STD_LOGIC;
    GPIO_I2C0_sda_o : out STD_LOGIC;
    GPIO_I2C0_sda_t : out STD_LOGIC;
    GPIO_I2C1_scl_i : in STD_LOGIC;
    GPIO_I2C1_scl_o : out STD_LOGIC;
    GPIO_I2C1_scl_t : out STD_LOGIC;
    GPIO_I2C1_sda_i : in STD_LOGIC;
    GPIO_I2C1_sda_o : out STD_LOGIC;
    GPIO_I2C1_sda_t : out STD_LOGIC;
    M_Board_LEDs_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    C_Board_LEDs_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    BX3100_UART_CTS_tri_i : in STD_LOGIC;
    BX3100_UART_RTS_tri_o : out STD_LOGIC;
    BX3100_UART_rxd : in STD_LOGIC;
    BX3100_UART_txd : out STD_LOGIC;
    HL7800_UART_CTS_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HL7800_UART_RTS_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    HL7800_UART1_rxd : in STD_LOGIC;
    HL7800_UART1_txd : out STD_LOGIC;
    HL7800_UART2_rxd : in STD_LOGIC;
    HL7800_UART2_txd : out STD_LOGIC;
    Control_signals_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    UART_RQ_tri_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    UART_1_rxd : in STD_LOGIC;
    UART_1_txd : out STD_LOGIC;
    UART_2_rxd : in STD_LOGIC;
    UART_2_txd : out STD_LOGIC;
    UART_3_rxd : in STD_LOGIC;
    UART_3_txd : out STD_LOGIC;
    I2C2_scl_i : in STD_LOGIC;
    I2C2_scl_o : out STD_LOGIC;
    I2C2_scl_t : out STD_LOGIC;
    I2C2_sda_i : in STD_LOGIC;
    I2C2_sda_o : out STD_LOGIC;
    I2C2_sda_t : out STD_LOGIC
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal GPIO_I2C0_scl_i : STD_LOGIC;
  signal GPIO_I2C0_scl_o : STD_LOGIC;
  signal GPIO_I2C0_scl_t : STD_LOGIC;
  signal GPIO_I2C0_sda_i : STD_LOGIC;
  signal GPIO_I2C0_sda_o : STD_LOGIC;
  signal GPIO_I2C0_sda_t : STD_LOGIC;
  signal GPIO_I2C1_scl_i : STD_LOGIC;
  signal GPIO_I2C1_scl_o : STD_LOGIC;
  signal GPIO_I2C1_scl_t : STD_LOGIC;
  signal GPIO_I2C1_sda_i : STD_LOGIC;
  signal GPIO_I2C1_sda_o : STD_LOGIC;
  signal GPIO_I2C1_sda_t : STD_LOGIC;
  signal GPIOs_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIOs_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIOs_tri_i_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal GPIOs_tri_i_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal GPIOs_tri_i_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal GPIOs_tri_i_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal GPIOs_tri_i_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal GPIOs_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIOs_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIOs_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIOs_tri_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal GPIOs_tri_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal GPIOs_tri_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal GPIOs_tri_i_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal GPIOs_tri_i_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal GPIOs_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIOs_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIOs_tri_io_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal GPIOs_tri_io_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal GPIOs_tri_io_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal GPIOs_tri_io_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal GPIOs_tri_io_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal GPIOs_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIOs_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIOs_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIOs_tri_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal GPIOs_tri_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal GPIOs_tri_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal GPIOs_tri_io_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal GPIOs_tri_io_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal GPIOs_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIOs_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIOs_tri_o_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal GPIOs_tri_o_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal GPIOs_tri_o_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal GPIOs_tri_o_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal GPIOs_tri_o_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal GPIOs_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIOs_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIOs_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIOs_tri_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal GPIOs_tri_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal GPIOs_tri_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal GPIOs_tri_o_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal GPIOs_tri_o_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal GPIOs_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIOs_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIOs_tri_t_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal GPIOs_tri_t_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal GPIOs_tri_t_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal GPIOs_tri_t_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal GPIOs_tri_t_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal GPIOs_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIOs_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIOs_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIOs_tri_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal GPIOs_tri_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal GPIOs_tri_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal GPIOs_tri_t_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal GPIOs_tri_t_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal I2C2_scl_i : STD_LOGIC;
  signal I2C2_scl_o : STD_LOGIC;
  signal I2C2_scl_t : STD_LOGIC;
  signal I2C2_sda_i : STD_LOGIC;
  signal I2C2_sda_o : STD_LOGIC;
  signal I2C2_sda_t : STD_LOGIC;
begin
GPIO_I2C0_scl_iobuf: component IOBUF
     port map (
      I => GPIO_I2C0_scl_o,
      IO => GPIO_I2C0_scl_io,
      O => GPIO_I2C0_scl_i,
      T => GPIO_I2C0_scl_t
    );
GPIO_I2C0_sda_iobuf: component IOBUF
     port map (
      I => GPIO_I2C0_sda_o,
      IO => GPIO_I2C0_sda_io,
      O => GPIO_I2C0_sda_i,
      T => GPIO_I2C0_sda_t
    );
GPIO_I2C1_scl_iobuf: component IOBUF
     port map (
      I => GPIO_I2C1_scl_o,
      IO => GPIO_I2C1_scl_io,
      O => GPIO_I2C1_scl_i,
      T => GPIO_I2C1_scl_t
    );
GPIO_I2C1_sda_iobuf: component IOBUF
     port map (
      I => GPIO_I2C1_sda_o,
      IO => GPIO_I2C1_sda_io,
      O => GPIO_I2C1_sda_i,
      T => GPIO_I2C1_sda_t
    );
GPIOs_tri_iobuf_0: component IOBUF
     port map (
      I => GPIOs_tri_o_0(0),
      IO => GPIOs_tri_io(0),
      O => GPIOs_tri_i_0(0),
      T => GPIOs_tri_t_0(0)
    );
GPIOs_tri_iobuf_1: component IOBUF
     port map (
      I => GPIOs_tri_o_1(1),
      IO => GPIOs_tri_io(1),
      O => GPIOs_tri_i_1(1),
      T => GPIOs_tri_t_1(1)
    );
GPIOs_tri_iobuf_10: component IOBUF
     port map (
      I => GPIOs_tri_o_10(10),
      IO => GPIOs_tri_io(10),
      O => GPIOs_tri_i_10(10),
      T => GPIOs_tri_t_10(10)
    );
GPIOs_tri_iobuf_11: component IOBUF
     port map (
      I => GPIOs_tri_o_11(11),
      IO => GPIOs_tri_io(11),
      O => GPIOs_tri_i_11(11),
      T => GPIOs_tri_t_11(11)
    );
GPIOs_tri_iobuf_12: component IOBUF
     port map (
      I => GPIOs_tri_o_12(12),
      IO => GPIOs_tri_io(12),
      O => GPIOs_tri_i_12(12),
      T => GPIOs_tri_t_12(12)
    );
GPIOs_tri_iobuf_13: component IOBUF
     port map (
      I => GPIOs_tri_o_13(13),
      IO => GPIOs_tri_io(13),
      O => GPIOs_tri_i_13(13),
      T => GPIOs_tri_t_13(13)
    );
GPIOs_tri_iobuf_14: component IOBUF
     port map (
      I => GPIOs_tri_o_14(14),
      IO => GPIOs_tri_io(14),
      O => GPIOs_tri_i_14(14),
      T => GPIOs_tri_t_14(14)
    );
GPIOs_tri_iobuf_2: component IOBUF
     port map (
      I => GPIOs_tri_o_2(2),
      IO => GPIOs_tri_io(2),
      O => GPIOs_tri_i_2(2),
      T => GPIOs_tri_t_2(2)
    );
GPIOs_tri_iobuf_3: component IOBUF
     port map (
      I => GPIOs_tri_o_3(3),
      IO => GPIOs_tri_io(3),
      O => GPIOs_tri_i_3(3),
      T => GPIOs_tri_t_3(3)
    );
GPIOs_tri_iobuf_4: component IOBUF
     port map (
      I => GPIOs_tri_o_4(4),
      IO => GPIOs_tri_io(4),
      O => GPIOs_tri_i_4(4),
      T => GPIOs_tri_t_4(4)
    );
GPIOs_tri_iobuf_5: component IOBUF
     port map (
      I => GPIOs_tri_o_5(5),
      IO => GPIOs_tri_io(5),
      O => GPIOs_tri_i_5(5),
      T => GPIOs_tri_t_5(5)
    );
GPIOs_tri_iobuf_6: component IOBUF
     port map (
      I => GPIOs_tri_o_6(6),
      IO => GPIOs_tri_io(6),
      O => GPIOs_tri_i_6(6),
      T => GPIOs_tri_t_6(6)
    );
GPIOs_tri_iobuf_7: component IOBUF
     port map (
      I => GPIOs_tri_o_7(7),
      IO => GPIOs_tri_io(7),
      O => GPIOs_tri_i_7(7),
      T => GPIOs_tri_t_7(7)
    );
GPIOs_tri_iobuf_8: component IOBUF
     port map (
      I => GPIOs_tri_o_8(8),
      IO => GPIOs_tri_io(8),
      O => GPIOs_tri_i_8(8),
      T => GPIOs_tri_t_8(8)
    );
GPIOs_tri_iobuf_9: component IOBUF
     port map (
      I => GPIOs_tri_o_9(9),
      IO => GPIOs_tri_io(9),
      O => GPIOs_tri_i_9(9),
      T => GPIOs_tri_t_9(9)
    );
I2C2_scl_iobuf: component IOBUF
     port map (
      I => I2C2_scl_o,
      IO => I2C2_scl_io,
      O => I2C2_scl_i,
      T => I2C2_scl_t
    );
I2C2_sda_iobuf: component IOBUF
     port map (
      I => I2C2_sda_o,
      IO => I2C2_sda_io,
      O => I2C2_sda_i,
      T => I2C2_sda_t
    );
design_1_i: component design_1
     port map (
      BMX_DAC_SPI_spi1_clk => BMX_DAC_SPI_spi1_clk,
      BMX_DAC_SPI_spi1_cs0 => BMX_DAC_SPI_spi1_cs0,
      BMX_DAC_SPI_spi1_cs1 => BMX_DAC_SPI_spi1_cs1,
      BMX_DAC_SPI_spi1_cs2 => BMX_DAC_SPI_spi1_cs2,
      BMX_DAC_SPI_spi1_cs3 => BMX_DAC_SPI_spi1_cs3,
      BMX_DAC_SPI_spi1_miso => BMX_DAC_SPI_spi1_miso,
      BMX_DAC_SPI_spi1_mosi => BMX_DAC_SPI_spi1_mosi,
      BX3100_UART_CTS_tri_i => BX3100_UART_CTS_tri_i,
      BX3100_UART_RTS_tri_o => BX3100_UART_RTS_tri_o,
      BX3100_UART_rxd => BX3100_UART_rxd,
      BX3100_UART_txd => BX3100_UART_txd,
      CAN0_rx => CAN0_rx,
      CAN0_tx => CAN0_tx,
      CAN1_rx => CAN1_rx,
      CAN1_tx => CAN1_tx,
      C_Board_LEDs_tri_o(1 downto 0) => C_Board_LEDs_tri_o(1 downto 0),
      Control_signals_tri_o(4 downto 0) => Control_signals_tri_o(4 downto 0),
      GPIO_I2C0_scl_i => GPIO_I2C0_scl_i,
      GPIO_I2C0_scl_o => GPIO_I2C0_scl_o,
      GPIO_I2C0_scl_t => GPIO_I2C0_scl_t,
      GPIO_I2C0_sda_i => GPIO_I2C0_sda_i,
      GPIO_I2C0_sda_o => GPIO_I2C0_sda_o,
      GPIO_I2C0_sda_t => GPIO_I2C0_sda_t,
      GPIO_I2C1_scl_i => GPIO_I2C1_scl_i,
      GPIO_I2C1_scl_o => GPIO_I2C1_scl_o,
      GPIO_I2C1_scl_t => GPIO_I2C1_scl_t,
      GPIO_I2C1_sda_i => GPIO_I2C1_sda_i,
      GPIO_I2C1_sda_o => GPIO_I2C1_sda_o,
      GPIO_I2C1_sda_t => GPIO_I2C1_sda_t,
      GPIO_SPI_spi0_clk => GPIO_SPI_spi0_clk,
      GPIO_SPI_spi0_cs0 => GPIO_SPI_spi0_cs0,
      GPIO_SPI_spi0_cs1 => GPIO_SPI_spi0_cs1,
      GPIO_SPI_spi0_miso => GPIO_SPI_spi0_miso,
      GPIO_SPI_spi0_mosi => GPIO_SPI_spi0_mosi,
      GPIO_UART0_rxd => GPIO_UART0_rxd,
      GPIO_UART0_txd => GPIO_UART0_txd,
      GPIO_UART1_rxd => GPIO_UART1_rxd,
      GPIO_UART1_txd => GPIO_UART1_txd,
      GPIOs_tri_i(14) => GPIOs_tri_i_14(14),
      GPIOs_tri_i(13) => GPIOs_tri_i_13(13),
      GPIOs_tri_i(12) => GPIOs_tri_i_12(12),
      GPIOs_tri_i(11) => GPIOs_tri_i_11(11),
      GPIOs_tri_i(10) => GPIOs_tri_i_10(10),
      GPIOs_tri_i(9) => GPIOs_tri_i_9(9),
      GPIOs_tri_i(8) => GPIOs_tri_i_8(8),
      GPIOs_tri_i(7) => GPIOs_tri_i_7(7),
      GPIOs_tri_i(6) => GPIOs_tri_i_6(6),
      GPIOs_tri_i(5) => GPIOs_tri_i_5(5),
      GPIOs_tri_i(4) => GPIOs_tri_i_4(4),
      GPIOs_tri_i(3) => GPIOs_tri_i_3(3),
      GPIOs_tri_i(2) => GPIOs_tri_i_2(2),
      GPIOs_tri_i(1) => GPIOs_tri_i_1(1),
      GPIOs_tri_i(0) => GPIOs_tri_i_0(0),
      GPIOs_tri_o(14) => GPIOs_tri_o_14(14),
      GPIOs_tri_o(13) => GPIOs_tri_o_13(13),
      GPIOs_tri_o(12) => GPIOs_tri_o_12(12),
      GPIOs_tri_o(11) => GPIOs_tri_o_11(11),
      GPIOs_tri_o(10) => GPIOs_tri_o_10(10),
      GPIOs_tri_o(9) => GPIOs_tri_o_9(9),
      GPIOs_tri_o(8) => GPIOs_tri_o_8(8),
      GPIOs_tri_o(7) => GPIOs_tri_o_7(7),
      GPIOs_tri_o(6) => GPIOs_tri_o_6(6),
      GPIOs_tri_o(5) => GPIOs_tri_o_5(5),
      GPIOs_tri_o(4) => GPIOs_tri_o_4(4),
      GPIOs_tri_o(3) => GPIOs_tri_o_3(3),
      GPIOs_tri_o(2) => GPIOs_tri_o_2(2),
      GPIOs_tri_o(1) => GPIOs_tri_o_1(1),
      GPIOs_tri_o(0) => GPIOs_tri_o_0(0),
      GPIOs_tri_t(14) => GPIOs_tri_t_14(14),
      GPIOs_tri_t(13) => GPIOs_tri_t_13(13),
      GPIOs_tri_t(12) => GPIOs_tri_t_12(12),
      GPIOs_tri_t(11) => GPIOs_tri_t_11(11),
      GPIOs_tri_t(10) => GPIOs_tri_t_10(10),
      GPIOs_tri_t(9) => GPIOs_tri_t_9(9),
      GPIOs_tri_t(8) => GPIOs_tri_t_8(8),
      GPIOs_tri_t(7) => GPIOs_tri_t_7(7),
      GPIOs_tri_t(6) => GPIOs_tri_t_6(6),
      GPIOs_tri_t(5) => GPIOs_tri_t_5(5),
      GPIOs_tri_t(4) => GPIOs_tri_t_4(4),
      GPIOs_tri_t(3) => GPIOs_tri_t_3(3),
      GPIOs_tri_t(2) => GPIOs_tri_t_2(2),
      GPIOs_tri_t(1) => GPIOs_tri_t_1(1),
      GPIOs_tri_t(0) => GPIOs_tri_t_0(0),
      HL7800_UART1_rxd => HL7800_UART1_rxd,
      HL7800_UART1_txd => HL7800_UART1_txd,
      HL7800_UART2_rxd => HL7800_UART2_rxd,
      HL7800_UART2_txd => HL7800_UART2_txd,
      HL7800_UART_CTS_tri_i(1 downto 0) => HL7800_UART_CTS_tri_i(1 downto 0),
      HL7800_UART_RTS_tri_o(1 downto 0) => HL7800_UART_RTS_tri_o(1 downto 0),
      I2C2_scl_i => I2C2_scl_i,
      I2C2_scl_o => I2C2_scl_o,
      I2C2_scl_t => I2C2_scl_t,
      I2C2_sda_i => I2C2_sda_i,
      I2C2_sda_o => I2C2_sda_o,
      I2C2_sda_t => I2C2_sda_t,
      M_Board_LEDs_tri_o(3 downto 0) => M_Board_LEDs_tri_o(3 downto 0),
      PHY_LED(1 downto 0) => PHY_LED(1 downto 0),
      PHY_LED_TE(1 downto 0) => PHY_LED_TE(1 downto 0),
      UART_1_rxd => UART_1_rxd,
      UART_1_txd => UART_1_txd,
      UART_2_rxd => UART_2_rxd,
      UART_2_txd => UART_2_txd,
      UART_3_rxd => UART_3_rxd,
      UART_3_txd => UART_3_txd,
      UART_RQ_tri_i(2 downto 0) => UART_RQ_tri_i(2 downto 0)
    );
end STRUCTURE;
