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
│       │   │   │   │   ├── FM192_ZU4CG.tcl
│       │   │   │   │   ├── FM192_ZU4CG.xdc
│       │   │   │   │   ├── Prebuilt
│       │   │   │   │   │   ├── design_1_wrapper.bit
│       │   │   │   │   │   └── design_1_wrapper.hdf
│       │   │   │   │   └── README.md
│       │   │   │   └── README.md
│       │   │   └── ZU4EV
│       │   │       ├── FM192-RU
│       │   │       │   ├── FM192_ZU4EV.tcl
│       │   │       │   ├── FM192_ZU4EV.xdc
│       │   │       │   ├── Prebuilt
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

49 directories, 87 files
```
