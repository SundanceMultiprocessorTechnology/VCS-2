# Directory Structure
```
../VCS-2
├── directorySctructure.md
├── Documents
│   ├── EMC2-DP Design Specification (QCF51) v3-4.pdf
│   ├── EMC2-DP Starter's Guide v3.1 (QCF32).pdf
│   ├── README.md
│   └── TRM-TE0820-03.pdf
├── Hardware
│   ├── README.md
│   ├── SD_BOOT
│   │   └── README.md
│   └── Xilinx
│       ├── BoardFiles
│       │   ├── EMC2-DP_TE0820_3EG_1E
│       │   │   ├── 1.0
│       │   │   │   ├── board.xml
│       │   │   │   ├── EMC2_DP_TE0820_3EG_1E.png
│       │   │   │   ├── part0_pins.xml
│       │   │   │   └── preset.xml
│       │   │   └── 2.0
│       │   │       ├── board.xml
│       │   │       ├── EMC2_DP_TE0820_3EG_1E.png
│       │   │       ├── part0_pins.xml
│       │   │       └── preset.xml
│       │   ├── EMC2-DP_TE0820_4CG_1EA
│       │   │   ├── 1.0
│       │   │   │   ├── board.xml
│       │   │   │   ├── EMC2_DP_TE0820_4CG_1EA.png
│       │   │   │   ├── part0_pins.xml
│       │   │   │   └── preset.xml
│       │   │   └── 2.0
│       │   │       ├── board.xml
│       │   │       ├── EMC2_DP_TE0820_4CG_1EA.png
│       │   │       ├── part0_pins.xml
│       │   │       └── preset.xml
│       │   ├── EMC2-DP_TE0820_4EV_1E
│       │   │   ├── 1.0
│       │   │   │   ├── board.xml
│       │   │   │   ├── EMC2-DP_TE0820_4EV_1E.png
│       │   │   │   ├── part0_pins.xml
│       │   │   │   └── preset.xml
│       │   │   └── 2.0
│       │   │       ├── board.xml
│       │   │       ├── EMC2-DP_TE0820_4EV_1E.png
│       │   │       ├── part0_pins.xml
│       │   │       └── preset.xml
│       │   ├── FM192-RU
│       │   │   └── 1.0
│       │   │       ├── board.xml
│       │   │       └── preset.xml
│       │   └── README.md
│       ├── Firmware
│       │   ├── 2018.3
│       │   │   ├── IP_Repo_ZU
│       │   │   │   ├── Interfaces
│       │   │   │   │   └── spi_custom
│       │   │   │   │       ├── Dual_SPI_rtl.xml
│       │   │   │   │       ├── Dual_SPI.xml
│       │   │   │   │       ├── Quad_SPI_rtl.xml
│       │   │   │   │       ├── Quad_SPI.xml
│       │   │   │   │       ├── SPI_rtl.xml
│       │   │   │   │       └── SPI.xml
│       │   │   │   └── ip
│       │   │   │       ├── axis_fb_conv_1.0
│       │   │   │       │   ├── bd
│       │   │   │       │   │   └── bd.tcl
│       │   │   │       │   ├── component.xml
│       │   │   │       │   ├── src
│       │   │   │       │   │   └── axis_fb_conv_v1_0.vhd
│       │   │   │       │   └── xgui
│       │   │   │       │       └── axis_fb_conv_v1_0.tcl
│       │   │   │       ├── dpu_ip
│       │   │   │       │   └── dpu
│       │   │   │       │       ├── bd
│       │   │   │       │       │   └── bd.tcl
│       │   │   │       │       ├── component.xml
│       │   │   │       │       ├── doc
│       │   │   │       │       │   └── dpu_eu_v0_0_53_changelog.txt
│       │   │   │       │       ├── gui
│       │   │   │       │       │   └── dpu_eu_v0_0_53.gtcl
│       │   │   │       │       ├── hdl
│       │   │   │       │       │   └── dpu_eu_v0_0_53_vl_rfs.v
│       │   │   │       │       ├── inc
│       │   │   │       │       │   ├── arch_def.vh
│       │   │   │       │       │   ├── arch_para.vh
│       │   │   │       │       │   └── function.vh
│       │   │   │       │       ├── xdc
│       │   │   │       │       │   ├── timing_clocks.xdc
│       │   │   │       │       │   └── timing_impl_clocks.xdc
│       │   │   │       │       └── xgui
│       │   │   │       │           └── dpu_eu_v0_0_53.tcl
│       │   │   │       ├── FM192_SPI_Buffering
│       │   │   │       │   ├── component.xml
│       │   │   │       │   ├── SPI_US_Buffering.vhd
│       │   │   │       │   └── xgui
│       │   │   │       │       └── FM192_SPI_Buffering_v1_0.tcl
│       │   │   │       └── video_io_to_hdmi
│       │   │   │           ├── component.xml
│       │   │   │           ├── video_io_to_hdmi.vhd
│       │   │   │           └── xgui
│       │   │   │               └── video_io_to_hdmi_v1_0.tcl
│       │   │   ├── README.md
│       │   │   ├── ZU3EG
│       │   │   │   ├── FM192-RU
│       │   │   │   │   ├── FM192_ZU3EG.tcl
│       │   │   │   │   ├── FM192_ZU3EG.xdc
│       │   │   │   │   ├── Prebuilt
│       │   │   │   │   │   ├── design_1_wrapper.bit
│       │   │   │   │   │   └── design_1_wrapper.hdf
│       │   │   │   │   └── README.md
│       │   │   │   └── README.md
│       │   │   ├── ZU4CG
│       │   │   │   ├── FM192-RU
│       │   │   │   │   ├── FM192_ZU4CG
│       │   │   │   │   │   ├── FM192_ZU4CG.cache
│       │   │   │   │   │   │   └── wt
│       │   │   │   │   │   │       ├── gui_handlers.wdf
│       │   │   │   │   │   │       ├── java_command_handlers.wdf
│       │   │   │   │   │   │       ├── project.wpc
│       │   │   │   │   │   │       └── webtalk_pa.xml
│       │   │   │   │   │   ├── FM192_ZU4CG.hw
│       │   │   │   │   │   │   └── FM192_ZU4CG.lpr
│       │   │   │   │   │   ├── FM192_ZU4CG.ip_user_files
│       │   │   │   │   │   ├── FM192_ZU4CG.sim
│       │   │   │   │   │   ├── FM192_ZU4CG.srcs
│       │   │   │   │   │   │   └── sources_1
│       │   │   │   │   │   │       └── bd
│       │   │   │   │   │   │           └── design_1
│       │   │   │   │   │   │               ├── design_1.bd
│       │   │   │   │   │   │               ├── design_1.bxml
│       │   │   │   │   │   │               ├── hdl
│       │   │   │   │   │   │               │   └── design_1_wrapper.vhd
│       │   │   │   │   │   │               ├── ip
│       │   │   │   │   │   │               │   ├── design_1_auto_pc_0
│       │   │   │   │   │   │               │   │   ├── design_1_auto_pc_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_auto_pc_0.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_1
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_1.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_1.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_2
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_2.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_2.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_3
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_3.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_3.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_4
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_4.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_4.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_5
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_5.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_5.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_6
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_6.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_6.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_gpio_0_7
│       │   │   │   │   │   │               │   │   ├── design_1_axi_gpio_0_7.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_gpio_0_7.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_iic_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_axi_iic_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_iic_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_iic_0_1
│       │   │   │   │   │   │               │   │   ├── design_1_axi_iic_0_1.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_iic_0_1.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_iic_0_2
│       │   │   │   │   │   │               │   │   ├── design_1_axi_iic_0_2.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_iic_0_2.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_1
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_1.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_1.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_2
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_2.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_2.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_3
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_3.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_3.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_4
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_4.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_4.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_5
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_5.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_5.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_6
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_6.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_6.xml
│       │   │   │   │   │   │               │   ├── design_1_axi_uartlite_0_7
│       │   │   │   │   │   │               │   │   ├── design_1_axi_uartlite_0_7.xci
│       │   │   │   │   │   │               │   │   └── design_1_axi_uartlite_0_7.xml
│       │   │   │   │   │   │               │   ├── design_1_FM192_SPI_Buffering_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_FM192_SPI_Buffering_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_FM192_SPI_Buffering_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_ps8_0_axi_periph_0
│       │   │   │   │   │   │               │   │   ├── design_1_ps8_0_axi_periph_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_ps8_0_axi_periph_0.xml
│       │   │   │   │   │   │               │   ├── design_1_rst_ps8_0_99M_0
│       │   │   │   │   │   │               │   │   ├── design_1_rst_ps8_0_99M_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_rst_ps8_0_99M_0.xml
│       │   │   │   │   │   │               │   ├── design_1_tier2_xbar_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_tier2_xbar_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_tier2_xbar_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_tier2_xbar_1_0
│       │   │   │   │   │   │               │   │   ├── design_1_tier2_xbar_1_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_tier2_xbar_1_0.xml
│       │   │   │   │   │   │               │   ├── design_1_tier2_xbar_2_0
│       │   │   │   │   │   │               │   │   ├── design_1_tier2_xbar_2_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_tier2_xbar_2_0.xml
│       │   │   │   │   │   │               │   ├── design_1_util_vector_logic_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_util_vector_logic_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_util_vector_logic_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_xbar_0
│       │   │   │   │   │   │               │   │   ├── design_1_xbar_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_xbar_0.xml
│       │   │   │   │   │   │               │   ├── design_1_xlconcat_0_0
│       │   │   │   │   │   │               │   │   ├── design_1_xlconcat_0_0.xci
│       │   │   │   │   │   │               │   │   └── design_1_xlconcat_0_0.xml
│       │   │   │   │   │   │               │   ├── design_1_xlconcat_0_1
│       │   │   │   │   │   │               │   │   ├── design_1_xlconcat_0_1.xci
│       │   │   │   │   │   │               │   │   └── design_1_xlconcat_0_1.xml
│       │   │   │   │   │   │               │   └── design_1_zynq_ultra_ps_e_0_0
│       │   │   │   │   │   │               │       ├── design_1_zynq_ultra_ps_e_0_0_ooc.xdc
│       │   │   │   │   │   │               │       ├── design_1_zynq_ultra_ps_e_0_0.xci
│       │   │   │   │   │   │               │       ├── design_1_zynq_ultra_ps_e_0_0.xdc
│       │   │   │   │   │   │               │       ├── design_1_zynq_ultra_ps_e_0_0.xml
│       │   │   │   │   │   │               │       ├── hdl
│       │   │   │   │   │   │               │       │   ├── design_1_zynq_ultra_ps_e_0_0.hwdef
│       │   │   │   │   │   │               │       │   └── zynq_ultra_ps_e_v3_2_2.v
│       │   │   │   │   │   │               │       ├── psu_init.c
│       │   │   │   │   │   │               │       ├── psu_init_gpl.c
│       │   │   │   │   │   │               │       ├── psu_init_gpl.h
│       │   │   │   │   │   │               │       ├── psu_init.h
│       │   │   │   │   │   │               │       ├── psu_init.html
│       │   │   │   │   │   │               │       └── psu_init.tcl
│       │   │   │   │   │   │               ├── sim
│       │   │   │   │   │   │               ├── synth
│       │   │   │   │   │   │               └── ui
│       │   │   │   │   │   │                   └── bd_1f5defd0.ui
│       │   │   │   │   │   └── FM192_ZU4CG.xpr
│       │   │   │   │   ├── FM192_ZU4CG.tcl
│       │   │   │   │   ├── FM192_ZU4CG.xdc
│       │   │   │   │   ├── Prebuilt
│       │   │   │   │   │   ├── design_1_wrapper.bit
│       │   │   │   │   │   └── design_1_wrapper.hdf
│       │   │   │   │   └── README.md
│       │   │   │   └── README.md
│       │   │   └── ZU4EV
│       │   │       ├── FM192-RU
│       │   │       │   ├── FM192_ZU4EV_BIF.sh
│       │   │       │   ├── FM192_ZU4EV.c
│       │   │       │   ├── FM192_ZU4EV.sh
│       │   │       │   ├── FM192_ZU4EV.tcl
│       │   │       │   ├── FM192_ZU4EV.xdc
│       │   │       │   ├── Prebuilt
│       │   │       │   │   ├── BOOT.bin
│       │   │       │   │   ├── design_1_wrapper.bit
│       │   │       │   │   └── design_1_wrapper.hdf
│       │   │       │   └── README.md
│       │   │       └── README.md
│       │   └── README.md
│       ├── Pinout
│       │   ├── EMC2-DP+TE0820+FM192_Pinout.xlsx
│       │   └── README.md
│       └── README.md
├── LICENSE.md
├── push.sh
└── README.md

96 directories, 173 files
```
