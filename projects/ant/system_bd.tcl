# create board design

source $ad_hdl_dir/projects/common/xilinx/adi_fir_filter_bd.tcl
source $ad_hdl_dir/library/axi_tdd/scripts/axi_tdd.tcl
set_property  ip_repo_paths  $ad_hdl_dir/library/ [current_project]
update_ip_catalog

# default ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io

create_bd_port -dir O spi0_csn_2_o
create_bd_port -dir O spi0_csn_1_o
create_bd_port -dir O spi0_csn_0_o
create_bd_port -dir I spi0_csn_i
create_bd_port -dir I spi0_clk_i
create_bd_port -dir O spi0_clk_o
create_bd_port -dir I spi0_sdo_i
create_bd_port -dir O spi0_sdo_o
create_bd_port -dir I spi0_sdi_i

create_bd_port -dir I -from 63 -to 0 gpio_i
create_bd_port -dir O -from 63 -to 0 gpio_o
create_bd_port -dir O -from 63 -to 0 gpio_t


create_bd_port -dir O txdata_o
create_bd_port -dir I tdd_ext_sync


create_bd_port -dir I CLKIN_10MHz
create_bd_port -dir I CLK_40MHz_FPGA
create_bd_port -dir O CLK_40M_DAC_DIN
create_bd_port -dir O CLK_40M_DAC_SCLK
create_bd_port -dir O CLK_40M_DAC_nSYNC
create_bd_port -dir I PPS_GPS
create_bd_port -dir I PPS_IN
create_bd_port -dir O PPS_LED
create_bd_port -dir O PPS_LOCKED
create_bd_port -dir O REF_10M_LOCKED

# ps7 settings

ad_ip_instance processing_system7 sys_ps7
ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK0_VOLTAGE "LVCMOS 3.3V"
ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK1_VOLTAGE "LVCMOS 1.8V"
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_NAME clg400
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_ENET0_IO "MIO 16 .. 27"
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_GRP_MDIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_GRP_MDIO_IO "MIO 52 .. 53"
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_RESET_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_ENET0_RESET_IO "MIO 46"
ad_ip_parameter sys_ps7 CONFIG.PCW_SD0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ 50
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_UART1_IO {MIO 12 .. 13}
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C0_I2C0_IO {MIO 10 .. 11}
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_IO "MIO 47"
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 0.048
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 0.050
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 0.241
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 0.240
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST2_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ 200.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ 200.0
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 64
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_SPI1_IO EMIO


ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1

# system reset/clock definitions



set axi_vcxo_ctrl [ create_bd_cell -type ip -vlnv user.org:user:axi_vcxo_ctrl:1.0 axi_vcxo_ctrl ]
ad_connect axi_vcxo_ctrl/CLK_40M_DAC_DIN CLK_40M_DAC_DIN
ad_connect axi_vcxo_ctrl/CLK_40M_DAC_SCLK CLK_40M_DAC_SCLK
ad_connect axi_vcxo_ctrl/CLK_40M_DAC_nSYNC CLK_40M_DAC_nSYNC
ad_connect axi_vcxo_ctrl/CLKIN_10MHz CLKIN_10MHz
ad_connect axi_vcxo_ctrl/CLK_40MHz_FPGA CLK_40MHz_FPGA
ad_connect axi_vcxo_ctrl/PPS_GPS PPS_GPS
ad_connect axi_vcxo_ctrl/PPS_IN PPS_IN
ad_connect axi_vcxo_ctrl/PPS_LED PPS_LED
ad_connect axi_vcxo_ctrl/PPS_LOCKED PPS_LOCKED
ad_connect axi_vcxo_ctrl/REF_10M_LOCKED REF_10M_LOCKED




ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_200m_clk sys_ps7/FCLK_CLK1
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N

# interface connections

ad_connect  ddr sys_ps7/DDR
ad_connect  gpio_i sys_ps7/GPIO_I
ad_connect  gpio_o sys_ps7/GPIO_O
ad_connect  gpio_t sys_ps7/GPIO_T
ad_connect  fixed_io sys_ps7/FIXED_IO

# ps7 spi connections

ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I


# interrupts

ad_connect  sys_concat_intc/dout sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15 GND
ad_connect  sys_concat_intc/In14 GND
ad_connect  sys_concat_intc/In13 GND
ad_connect  sys_concat_intc/In12 GND
ad_connect  sys_concat_intc/In11 GND
ad_connect  sys_concat_intc/In10 GND
ad_connect  sys_concat_intc/In9 GND
ad_connect  sys_concat_intc/In8 GND
ad_connect  sys_concat_intc/In7 GND
ad_connect  sys_concat_intc/In6 GND
ad_connect  sys_concat_intc/In5 GND
ad_connect  sys_concat_intc/In4 GND
ad_connect  sys_concat_intc/In3 GND
ad_connect  sys_concat_intc/In2 GND
ad_connect  sys_concat_intc/In1 GND
ad_connect  sys_concat_intc/In0 GND

# ad9361

create_bd_port -dir I rx_clk_in
create_bd_port -dir I rx_frame_in
create_bd_port -dir I -from 11 -to 0 rx_data_in

create_bd_port -dir O tx_clk_out
create_bd_port -dir O tx_frame_out
create_bd_port -dir O -from 11 -to 0 tx_data_out

create_bd_port -dir O enable
create_bd_port -dir O txnrx
create_bd_port -dir I up_enable
create_bd_port -dir I up_txnrx

# ad9361 core(s)

ad_ip_instance axi_ad9361 axi_ad9361
ad_ip_parameter axi_ad9361 CONFIG.ID 0
ad_ip_parameter axi_ad9361 CONFIG.CMOS_OR_LVDS_N 1
ad_ip_parameter axi_ad9361 CONFIG.MODE_1R1T 0
ad_ip_parameter axi_ad9361 CONFIG.ADC_INIT_DELAY 21

ad_ip_instance axi_dmac axi_ad9361_dac_dma
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_TYPE_DEST 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.CYCLIC 1
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_dac_dma CONFIG.DMA_DATA_WIDTH_DEST 64

ad_add_interpolation_filter "tx_fir_interpolator" 8 2 1 {61.44} {7.68} \
                             "$ad_hdl_dir/library/util_fir_int/coefile_int.coe"
ad_ip_instance xlslice interp_slice
ad_ip_instance util_upack2 tx_upack

ad_ip_instance axi_dmac axi_ad9361_adc_dma
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_SRC 2
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_TYPE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.CYCLIC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.SYNC_TRANSFER_START 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_SRC 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.AXI_SLICE_DEST 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_2D_TRANSFER 0
ad_ip_parameter axi_ad9361_adc_dma CONFIG.DMA_DATA_WIDTH_SRC 64
ad_ip_parameter axi_ad9361_adc_dma CONFIG.SYNC_TRANSFER_START {true}

ad_add_decimation_filter "rx_fir_decimator" 8 2 1 {61.44} {61.44} \
                         "$ad_hdl_dir/library/util_fir_int/coefile_int.coe"
ad_ip_instance xlslice decim_slice
ad_ip_instance util_cpack2 cpack

# connections

ad_connect  rx_clk_in axi_ad9361/rx_clk_in
ad_connect  rx_frame_in axi_ad9361/rx_frame_in
ad_connect  rx_data_in axi_ad9361/rx_data_in
ad_connect  tx_clk_out axi_ad9361/tx_clk_out
ad_connect  tx_frame_out axi_ad9361/tx_frame_out
ad_connect  tx_data_out axi_ad9361/tx_data_out
ad_connect  enable axi_ad9361/enable
ad_connect  txnrx axi_ad9361/txnrx
ad_connect  up_enable axi_ad9361/up_enable
ad_connect  up_txnrx axi_ad9361/up_txnrx

ad_connect  axi_ad9361/tdd_sync GND
ad_connect  sys_200m_clk axi_ad9361/delay_clk
ad_connect  axi_ad9361/l_clk axi_ad9361/clk

ad_connect axi_ad9361/l_clk rx_fir_decimator/aclk

ad_connect axi_ad9361/adc_valid_i0 rx_fir_decimator/valid_in_0
ad_connect axi_ad9361/adc_enable_i0 rx_fir_decimator/enable_in_0
ad_connect axi_ad9361/adc_data_i0 rx_fir_decimator/data_in_0
ad_connect axi_ad9361/adc_valid_q0 rx_fir_decimator/valid_in_1
ad_connect axi_ad9361/adc_enable_q0 rx_fir_decimator/enable_in_1
ad_connect axi_ad9361/adc_data_q0 rx_fir_decimator/data_in_1

ad_connect axi_ad9361/l_clk cpack/clk
ad_connect axi_ad9361/rst cpack/reset

ad_connect axi_ad9361/adc_enable_i1 cpack/enable_2
ad_connect axi_ad9361/adc_data_i1 cpack/fifo_wr_data_2
ad_connect axi_ad9361/adc_enable_q1 cpack/enable_3
ad_connect axi_ad9361/adc_data_q1 cpack/fifo_wr_data_3

# =============================================================================
# RX Passthrough Module - 階段二
# =============================================================================
# 插入點: rx_fir_decimator -> [rx_passthrough] -> cpack

# 載入自訂模組源碼
# 計算專案根目錄 (從 hdl/projects/ant 往上到 antsdr-fw-patch)
set script_dir [file dirname [file normalize [info script]]]
set hdl_root [file dirname [file dirname $script_dir]]
set fw_root [file dirname $hdl_root]
set patch_root [file dirname $fw_root]
set passthrough_src "$patch_root/custom_src/hdl/passthrough/passthrough.v"
set bpsk_mod_src "$patch_root/custom_src/hdl/bpsk_modulator/bpsk_modulator.v"

puts "Script dir: $script_dir"
puts "Passthrough src: $passthrough_src"
puts "BPSK modulator src: $bpsk_mod_src"

# 載入 passthrough 模組 (RX 路徑使用)
if {[file exists $passthrough_src]} {
    puts "Loading passthrough module..."
    add_files -norecurse $passthrough_src
    update_compile_order -fileset sources_1
} else {
    puts "ERROR: passthrough.v not found at $passthrough_src"
    error "Passthrough module not found"
}

# 載入 BPSK modulator 模組 (TX 路徑使用)
if {[file exists $bpsk_mod_src]} {
    puts "Loading BPSK modulator module..."
    add_files -norecurse $bpsk_mod_src
    update_compile_order -fileset sources_1
} else {
    puts "ERROR: bpsk_modulator.v not found at $bpsk_mod_src"
    error "BPSK modulator module not found"
}

# 創建 RX Passthrough 實例
create_bd_cell -type module -reference passthrough rx_passthrough

# 時脈和復位
ad_connect axi_ad9361/l_clk rx_passthrough/clk
ad_connect axi_ad9361/rst rx_passthrough/rst

# rx_fir_decimator -> rx_passthrough (數據)
ad_connect rx_fir_decimator/data_out_0 rx_passthrough/data_in_i
ad_connect rx_fir_decimator/data_out_1 rx_passthrough/data_in_q

# rx_passthrough -> cpack (數據)
ad_connect rx_passthrough/data_out_i cpack/fifo_wr_data_0
ad_connect rx_passthrough/data_out_q cpack/fifo_wr_data_1

# enable/valid 信號保持原始連接 (FIR -> cpack)
ad_connect cpack/enable_0 rx_fir_decimator/enable_out_0
ad_connect cpack/enable_1 rx_fir_decimator/enable_out_1
ad_connect rx_fir_decimator/valid_out_0 cpack/fifo_wr_en

# passthrough 控制輸入接常數 (目前不使用)
ad_connect VCC rx_passthrough/valid_in
ad_connect VCC rx_passthrough/enable_in_i
ad_connect VCC rx_passthrough/enable_in_q

puts "RX Passthrough inserted: rx_fir_decimator -> rx_passthrough -> cpack"

ad_connect axi_ad9361_adc_dma/fifo_wr cpack/packed_fifo_wr
ad_connect axi_ad9361/up_adc_gpio_out decim_slice/Din
ad_connect rx_fir_decimator/active decim_slice/Dout

ad_connect axi_ad9361/l_clk tx_fir_interpolator/aclk

ad_connect axi_ad9361/dac_enable_i0 tx_fir_interpolator/dac_enable_0
ad_connect axi_ad9361/dac_valid_i0 tx_fir_interpolator/dac_valid_0
ad_connect axi_ad9361/dac_data_i0 tx_fir_interpolator/data_out_0
ad_connect axi_ad9361/dac_enable_q0 tx_fir_interpolator/dac_enable_1
ad_connect axi_ad9361/dac_valid_q0 tx_fir_interpolator/dac_valid_1
ad_connect axi_ad9361/dac_data_q0 tx_fir_interpolator/data_out_1

ad_connect  axi_ad9361/l_clk tx_upack/clk

# =============================================================================
# TX BPSK Modulator - 階段三
# =============================================================================
# 插入點: tx_upack -> [bpsk_modulator] -> tx_fir_interpolator
# 功能: 將 DMA packed bits 轉換為 BPSK 星座點
# 注意: 只攔截數據路徑，enable 信號保持原始連接

# 創建 BPSK Modulator 實例
create_bd_cell -type module -reference bpsk_modulator tx_bpsk_mod

# 時脈和復位
ad_connect axi_ad9361/l_clk tx_bpsk_mod/clk
ad_connect axi_ad9361/rst tx_bpsk_mod/rst

# tx_upack -> bpsk_modulator (數據)
ad_connect tx_upack/fifo_rd_data_0 tx_bpsk_mod/data_in_i
ad_connect tx_upack/fifo_rd_data_1 tx_bpsk_mod/data_in_q

# bpsk_modulator -> tx_fir_interpolator (數據)
ad_connect tx_bpsk_mod/data_out_i tx_fir_interpolator/data_in_0
ad_connect tx_bpsk_mod/data_out_q tx_fir_interpolator/data_in_1

# enable 信號保持原始連接 (FIR -> upack)
ad_connect tx_upack/enable_0 tx_fir_interpolator/enable_out_0
ad_connect tx_upack/enable_1 tx_fir_interpolator/enable_out_1

# bpsk_modulator 控制輸入 - 連接 FIR valid 信號
ad_connect tx_fir_interpolator/valid_out_0 tx_bpsk_mod/valid_in
ad_connect VCC tx_bpsk_mod/enable_in_i
ad_connect VCC tx_bpsk_mod/enable_in_q

puts "TX BPSK Modulator inserted: tx_upack -> tx_bpsk_mod -> tx_fir_interpolator"

ad_connect axi_ad9361/dac_enable_i1 tx_upack/enable_2
ad_connect axi_ad9361/dac_data_i1 tx_upack/fifo_rd_data_2
ad_connect axi_ad9361/dac_enable_q1 tx_upack/enable_3
ad_connect axi_ad9361/dac_data_q1 tx_upack/fifo_rd_data_3

ad_connect tx_upack/s_axis  axi_ad9361_dac_dma/m_axis

ad_ip_instance util_vector_logic logic_or [list \
  C_OPERATION {or} \
  C_SIZE 1]

ad_connect  logic_or/Op1  tx_fir_interpolator/valid_out_0
ad_connect  logic_or/Op2  axi_ad9361/dac_valid_i1
ad_connect  logic_or/Res  tx_upack/fifo_rd_en
ad_connect  tx_upack/fifo_rd_underflow axi_ad9361/dac_dunf

ad_connect axi_ad9361/up_dac_gpio_out interp_slice/Din
ad_connect  tx_fir_interpolator/active interp_slice/Dout

ad_connect  axi_ad9361/l_clk axi_ad9361_adc_dma/fifo_wr_clk
ad_connect  axi_ad9361/l_clk axi_ad9361_dac_dma/m_axis_aclk
ad_connect  cpack/fifo_wr_overflow axi_ad9361/adc_dovf

# External TDD
set TDD_CHANNEL_CNT 3
set TDD_DEFAULT_POL 0b010
set TDD_REG_WIDTH 32
set TDD_BURST_WIDTH 32
set TDD_SYNC_WIDTH 0
set TDD_SYNC_INT 0
set TDD_SYNC_EXT 1
set TDD_SYNC_EXT_CDC 1
ad_tdd_gen_create axi_tdd_0 $TDD_CHANNEL_CNT \
                            $TDD_DEFAULT_POL \
                            $TDD_REG_WIDTH \
                            $TDD_BURST_WIDTH \
                            $TDD_SYNC_WIDTH \
                            $TDD_SYNC_INT \
                            $TDD_SYNC_EXT \
                            $TDD_SYNC_EXT_CDC

ad_ip_instance util_vector_logic logic_inv [list \
  C_OPERATION {not} \
  C_SIZE 1]

ad_ip_instance util_vector_logic logic_or_1 [list \
  C_OPERATION {or} \
  C_SIZE 1]

ad_connect logic_inv/Op1  axi_ad9361/rst
ad_connect logic_inv/Res  axi_tdd_0/resetn
ad_connect axi_ad9361/l_clk axi_tdd_0/clk
ad_connect axi_tdd_0/sync_in tdd_ext_sync
ad_connect axi_tdd_0/tdd_channel_0 txdata_o
ad_connect axi_tdd_0/tdd_channel_1 axi_ad9361_adc_dma/sync


ad_connect  logic_or_1/Op1  axi_ad9361/rst
ad_connect  logic_or_1/Op2  axi_tdd_0/tdd_channel_2
ad_connect  logic_or_1/Res  tx_upack/reset

# interconnects

ad_cpu_interconnect 0x79020000 axi_ad9361
ad_cpu_interconnect 0x7C400000 axi_ad9361_adc_dma
ad_cpu_interconnect 0x7C420000 axi_ad9361_dac_dma
ad_cpu_interconnect 0x7C440000 axi_tdd_0
ad_cpu_interconnect 0x43C00000 axi_vcxo_ctrl

ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP1 {1}
ad_connect sys_cpu_clk sys_ps7/S_AXI_HP1_ACLK
ad_connect axi_ad9361_adc_dma/m_dest_axi sys_ps7/S_AXI_HP1

create_bd_addr_seg -range 0x40000000 -offset 0x00000000 \
                    [get_bd_addr_spaces axi_ad9361_adc_dma/m_dest_axi] \
                    [get_bd_addr_segs sys_ps7/S_AXI_HP1/HP1_DDR_LOWOCM] \
                    SEG_sys_ps7_HP1_DDR_LOWOCM

ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP2 {1}
ad_connect sys_cpu_clk sys_ps7/S_AXI_HP2_ACLK
ad_connect axi_ad9361_dac_dma/m_src_axi sys_ps7/S_AXI_HP2

create_bd_addr_seg -range 0x40000000 -offset 0x00000000 \
                    [get_bd_addr_spaces axi_ad9361_dac_dma/m_src_axi] \
                    [get_bd_addr_segs sys_ps7/S_AXI_HP2/HP2_DDR_LOWOCM] \
                    SEG_sys_ps7_HP2_DDR_LOWOCM

ad_connect sys_cpu_clk axi_ad9361_dac_dma/m_src_axi_aclk
ad_connect sys_cpu_clk axi_ad9361_adc_dma/m_dest_axi_aclk
ad_connect sys_cpu_resetn axi_ad9361_adc_dma/m_dest_axi_aresetn
ad_connect sys_cpu_resetn axi_ad9361_dac_dma/m_src_axi_aresetn

# interrupts

ad_cpu_interrupt ps-13 mb-13 axi_ad9361_adc_dma/irq
ad_cpu_interrupt ps-12 mb-12 axi_ad9361_dac_dma/irq

# =============================================================================
# ILA Debug Core - 階段三：觀察 BPSK 調變器輸出
# =============================================================================

puts "Adding ILA Debug Core..."

# 使用標準 ILA，時鐘使用 l_clk
# 重要: 需要從 SD 卡啟動後（AD9361 初始化），l_clk 才會活動
#       然後再用 JTAG 連接 ILA

ad_ip_instance ila ila_rf_debug
ad_ip_parameter ila_rf_debug CONFIG.C_MONITOR_TYPE Native
ad_ip_parameter ila_rf_debug CONFIG.C_NUM_OF_PROBES 26
ad_ip_parameter ila_rf_debug CONFIG.C_DATA_DEPTH 4096
ad_ip_parameter ila_rf_debug CONFIG.C_EN_STRG_QUAL 1
ad_ip_parameter ila_rf_debug CONFIG.C_ADV_TRIGGER true
ad_ip_parameter ila_rf_debug CONFIG.ALL_PROBE_SAME_MU_CNT 2

# Probe 寬度
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE0_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE1_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE2_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE3_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE4_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE5_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE6_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE7_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE8_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE9_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE10_WIDTH 4
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE11_WIDTH 1
# DMA 路徑監控
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE12_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE13_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE14_WIDTH 16
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE15_WIDTH 16
# AXI Stream Debug (Stage 3+)
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE16_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE17_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE18_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE19_WIDTH 1
# DMA/Reset Debug (Stage 3+ Extended)
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE20_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE21_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE22_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE23_WIDTH 1
# DMA 內部狀態 (Stage 3++ Deep Debug)
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE24_WIDTH 1
ad_ip_parameter ila_rf_debug CONFIG.C_PROBE25_WIDTH 16

# 時脈 - l_clk (從 AD9361)
ad_connect axi_ad9361/l_clk ila_rf_debug/clk

# TX 路徑 (監控 BPSK modulator)
# probe0: BPSK modulator 輸出 I (星座點)
# probe1: BPSK modulator 輸出 Q (應為 0)
# probe2: TX FIR out I
# probe3: TX FIR out Q
ad_connect tx_bpsk_mod/probe_i ila_rf_debug/probe0
ad_connect tx_bpsk_mod/probe_q ila_rf_debug/probe1
ad_connect tx_fir_interpolator/data_out_0 ila_rf_debug/probe2
ad_connect tx_fir_interpolator/data_out_1 ila_rf_debug/probe3

# RX 路徑 (監控 passthrough)
# probe4: RX ADC I (raw)
# probe5: RX ADC Q (raw)
# probe6: RX passthrough I (from FIR)
# probe7: RX passthrough Q (from FIR)
ad_connect axi_ad9361/adc_data_i0 ila_rf_debug/probe4
ad_connect axi_ad9361/adc_data_q0 ila_rf_debug/probe5
ad_connect rx_passthrough/probe_i ila_rf_debug/probe6
ad_connect rx_passthrough/probe_q ila_rf_debug/probe7

# 控制信號
# probe8: BPSK modulator valid
# probe9: RX passthrough valid
ad_connect tx_bpsk_mod/probe_valid ila_rf_debug/probe8
ad_connect rx_passthrough/probe_valid ila_rf_debug/probe9

# BPSK 調變器狀態
# probe10: bit_cnt (當前位元位置 0-15)
# probe11: current_bit (當前調變位元)
ad_connect tx_bpsk_mod/probe_bit_cnt ila_rf_debug/probe10
ad_connect tx_bpsk_mod/probe_current_bit ila_rf_debug/probe11

# DMA 路徑監控 (Stage 3 Debug)
# probe12: tx_upack fifo_rd_en - FIFO 讀取使能
# probe13: tx_upack fifo_rd_underflow - FIFO 下溢
# probe14: tx_upack fifo_rd_data_0 - FIFO 資料輸出 I
# probe15: tx_upack fifo_rd_data_1 - FIFO 資料輸出 Q
ad_connect tx_upack/fifo_rd_en ila_rf_debug/probe12
ad_connect tx_upack/fifo_rd_underflow ila_rf_debug/probe13
ad_connect tx_upack/fifo_rd_data_0 ila_rf_debug/probe14
ad_connect tx_upack/fifo_rd_data_1 ila_rf_debug/probe15

# AXI Stream 握手信號 (Stage 3+ Debug)
# probe16: DMA m_axis_valid - DMA 輸出有效
# probe17: tx_upack s_axis_ready - FIFO 接收準備好
# probe18: tx_upack enable_0 - 通道 0 啟用 (from FIR)
# probe19: tx_upack enable_1 - 通道 1 啟用 (from FIR)
ad_connect axi_ad9361_dac_dma/m_axis_valid ila_rf_debug/probe16
ad_connect tx_upack/s_axis_ready ila_rf_debug/probe17
ad_connect tx_fir_interpolator/enable_out_0 ila_rf_debug/probe18
ad_connect tx_fir_interpolator/enable_out_1 ila_rf_debug/probe19

# DMA/Reset Debug (Stage 3+ Extended)
# probe20: tx_upack reset - 檢查是否被 TDD 卡住
# probe21: TDD channel 2 輸出 - 控制 tx_upack reset
# probe22: DMA m_axis_last - 突發結束指示
# probe23: AD9361 rst - 系統復位狀態
ad_connect tx_upack/reset ila_rf_debug/probe20
ad_connect axi_tdd_0/tdd_channel_2 ila_rf_debug/probe21
ad_connect axi_ad9361_dac_dma/m_axis_last ila_rf_debug/probe22
ad_connect axi_ad9361/rst ila_rf_debug/probe23

# DMA 內部狀態 (Stage 3++ Deep Debug)
# probe24: DMA m_axis_xfer_req - 傳輸活動中 (= active in dest_axi_stream)
# probe25: tx_upack s_axis_data[15:0] - AXI Stream 資料低16位
ad_connect axi_ad9361_dac_dma/m_axis_xfer_req ila_rf_debug/probe24

# 需要 slice 來取 s_axis 的低16位
ad_ip_instance xlslice dma_data_slice
ad_ip_parameter dma_data_slice CONFIG.DIN_WIDTH 64
ad_ip_parameter dma_data_slice CONFIG.DIN_FROM 15
ad_ip_parameter dma_data_slice CONFIG.DIN_TO 0
ad_connect axi_ad9361_dac_dma/m_axis_data dma_data_slice/Din
ad_connect dma_data_slice/Dout ila_rf_debug/probe25

puts "ILA added: 26 probes, 4096 depth, l_clk (Stage 3++ Deep Debug)"

