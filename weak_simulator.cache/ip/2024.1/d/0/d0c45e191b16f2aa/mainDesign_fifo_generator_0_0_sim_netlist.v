// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Apr  6 17:04:39 2025
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mainDesign_fifo_generator_0_0_sim_netlist.v
// Design      : mainDesign_fifo_generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mainDesign_fifo_generator_0_0,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 40000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 40000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "11" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "2kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2045" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2044" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_10 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "11" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [10:0]src_in_bin;
  input dest_clk;
  output [10:0]dest_out_bin;

  wire [10:0]async_path;
  wire [9:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[1] ;
  wire [10:0]dest_out_bin;
  wire [9:0]gray_enc;
  wire src_clk;
  wire [10:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(binval[5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[5]),
        .O(binval[4]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .I5(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "11" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [10:0]src_in_bin;
  input dest_clk;
  output [10:0]dest_out_bin;

  wire [10:0]async_path;
  wire [9:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [10:0]\dest_graysync_ff[1] ;
  wire [10:0]dest_out_bin;
  wire [9:0]gray_enc;
  wire src_clk;
  wire [10:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(binval[5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[5]),
        .O(binval[4]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .I5(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 97856)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
