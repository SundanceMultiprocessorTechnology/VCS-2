----------------------------------------------------------------------------------
-- Company: Sundance Multiprocessor Technology LTD
-- Engineer: Timoteo Garcia Bertoa
-- 
-- Design Name: EMC2-V2_FM191-RU
-- Module Name: FM192_SPI_Buffering
-- Project Name: FC
-- Target Devices: EMC2-ZU3EG (xczu3cg-sfvc784-1-e)
-- Tool Versions: Vivado 2018.3
--
-- Additional Comments:
--
-- This design follows the description in Figure 17-8 of the TRM of Zynq-7000 by Xilinx 
-- http://www.cl.cam.ac.uk/research/srg/han/ACS-P35/zynq/Zynq-7000-TRM.pdf (page 541)
-- Names of the signals based on  
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--LIBRARIES
----------------------------------------------------------------------------------------
library IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.NUMERIC_STD.ALL;
library UNISIM;
    use UNISIM.VCOMPONENTS.ALL;
----------------------------------------------------------------------------------------
--ENTITY
----------------------------------------------------------------------------------------
entity FM192_SPI_Buffering is
    Port( 
        --SPI0 from PS-EMIO
        emio_spi0_m_i       : out std_logic;
        emio_spi0_m_o       : in std_logic;    
        emio_spi0_mo_t      : in std_logic;
        emio_spi0_s_i       : out std_logic;
        emio_spi0_s_o       : in std_logic;
        emio_spi0_so_t      : in std_logic;
        emio_spi0_sclk_i    : out std_logic;
        emio_spi0_sclk_o    : in std_logic;
        emio_spi0_sclk_t    : in std_logic;
        emio_spi0_ss_i_n    : out std_logic;
        emio_spi0_ss_o_n    : in std_logic;
        emio_spi0_ss1_o_n   : in std_logic;
        emio_spi0_ss_n_t    : in std_logic;
        --SPI1 from PS-EMIO
        emio_spi1_m_i       : out std_logic;
        emio_spi1_m_o       : in std_logic;    
        emio_spi1_mo_t      : in std_logic;
        emio_spi1_s_i       : out std_logic;
        emio_spi1_s_o       : in std_logic;
        emio_spi1_so_t      : in std_logic;
        emio_spi1_sclk_i    : out std_logic;
        emio_spi1_sclk_o    : in std_logic;
        emio_spi1_sclk_t    : in std_logic;
        emio_spi1_ss_i_n    : out std_logic;
        emio_spi1_ss_o_n    : in std_logic;
        emio_spi1_ss1_o_n   : in std_logic;
        emio_spi1_ss2_o_n   : in std_logic;
        emio_spi1_ss_n_t    : in std_logic;
        --AXI GPIO Flag
        flag                : in std_logic_vector(0 downto 0);
        --SPI0 PL
        SPI0_CLK     : out std_logic;
        SPI0_MOSI    : out std_logic;    
        SPI0_MISO    : in std_logic;
        SPI0_CS0     : out std_logic;
        SPI0_CS1     : out std_logic;
        --SPI1 PL
        SPI1_CLK     : out std_logic;
        SPI1_MOSI    : out std_logic;    
        SPI1_MISO    : in std_logic;
        SPI1_CS0     : out std_logic;
        SPI1_CS1     : out std_logic;
        SPI1_CS2     : out std_logic;
        SPI1_CS3     : out std_logic
    );
end FM192_SPI_Buffering;

----------------------------------------------------------------------------------------
--ARCHITECTURE
----------------------------------------------------------------------------------------
architecture RTL of FM192_SPI_Buffering is 

    signal emio_spi0_sclk_tn : std_logic;
    signal emio_spi0_mo_tn   : std_logic;
    signal emio_spi0_ss_n_tn : std_logic;
    signal iemio_spi0_m_i    : std_logic;
    signal emio_spi1_sclk_tn : std_logic;
    signal emio_spi1_mo_tn   : std_logic;
    signal emio_spi1_ss_n_tn : std_logic;
    signal iemio_spi1_m_i    : std_logic;
    signal output_ss2        : std_logic;   
    signal output_ss3        : std_logic;   

begin

emio_spi0_sclk_i <= '0';
emio_spi0_sclk_tn <= emio_spi0_sclk_t;
emio_spi0_mo_tn <= emio_spi0_mo_t;
emio_spi0_ss_i_n <= '0';
emio_spi0_ss_n_tn <= not(emio_spi0_ss_n_t);
emio_spi1_sclk_i <= '0';
emio_spi1_sclk_tn <= emio_spi1_sclk_t;
emio_spi1_mo_tn <= emio_spi1_mo_t;
emio_spi1_ss_i_n <= '0';
emio_spi1_ss_n_tn <= not(emio_spi1_ss_n_t);

    --SPI0
    
    SPI0_SCLK_inst : OBUFT
        port map (
            O => SPI0_CLK, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi0_sclk_o, -- 1-bit input: Buffer input
            T => emio_spi0_sclk_tn  -- 1-bit input: 3-state enable input
        );
   
    SPI0_MOSI_inst : OBUFT
        port map (
            O => SPI0_MOSI, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi0_m_o, -- 1-bit input: Buffer input
            T => emio_spi0_mo_tn  -- 1-bit input: 3-state enable input
        );

    SPI0_MISO_inst : IBUF
        port map (
            O => emio_spi0_m_i, -- 1-bit output: Buffer output
            I => SPI0_MISO  -- 1-bit input: Buffer input
        );
    
    SPI0_SS_inst : OBUFT
        port map (
            O => SPI0_CS0, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi0_ss_o_n, -- 1-bit input: Buffer input
            T => emio_spi0_ss_n_tn  -- 1-bit input: 3-state enable input
        );   
    
    SPI0_SS1_inst : OBUFT
        port map (
            O => SPI0_CS1, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi0_ss1_o_n, -- 1-bit input: Buffer input
            T => emio_spi0_ss_n_tn  -- 1-bit input: 3-state enable input
        );             
    
    --SPI1
    
    SPI1_SCLK_inst : OBUFT
        port map (
            O => SPI1_CLK, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi1_sclk_o, -- 1-bit input: Buffer input
            T => emio_spi1_sclk_tn  -- 1-bit input: 3-state enable input
        );
   
    SPI1_MOSI_inst : OBUFT
        port map (
            O => SPI1_MOSI, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi1_m_o, -- 1-bit input: Buffer input
            T => emio_spi1_mo_tn  -- 1-bit input: 3-state enable input
        );

    SPI1_MISO_inst : IBUF
        port map (
            O => emio_spi1_m_i, -- 1-bit output: Buffer output
            I => SPI1_MISO  -- 1-bit input: Buffer input
        );
    
    SPI1_SS_inst : OBUFT
        port map (
            O => SPI1_CS0, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi1_ss_o_n, -- 1-bit input: Buffer input
            T => emio_spi1_ss_n_tn  -- 1-bit input: 3-state enable input
        );   
    
    SPI1_SS1_inst : OBUFT
        port map (
            O => SPI1_CS1, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => emio_spi1_ss1_o_n, -- 1-bit input: Buffer input
            T => emio_spi1_ss_n_tn  -- 1-bit input: 3-state enable input
        );             
       
    SPI1_SS2_inst : OBUFT
        port map (
            O => SPI1_CS2, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => output_ss2, -- 1-bit input: Buffer input
            T => emio_spi1_ss_n_tn  -- 1-bit input: 3-state enable input
        );   
           
    SPI1_SS3_inst : OBUFT
        port map (
            O => SPI1_CS3, -- 1-bit output: Buffer output (connect directly to top-level port)
            I => output_ss3, -- 1-bit input: Buffer input
            T => emio_spi1_ss_n_tn  -- 1-bit input: 3-state enable input
        );       
          
output_ss2 <= emio_spi1_ss2_o_n when (flag(0)='0') else '1';
output_ss3 <= emio_spi1_ss2_o_n when (flag(0)='1') else '1';
      
end RTL;
