// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 16 10:59:26 2024
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top mainDesign_fifo_generator_0_0 -prefix
//               mainDesign_fifo_generator_0_0_ mainDesign_fifo_generator_0_0_sim_netlist.v
// Design      : mainDesign_fifo_generator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mainDesign_fifo_generator_0_0,fifo_generator_v13_2_10,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_10,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module mainDesign_fifo_generator_0_0
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input rd_clk;
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
  mainDesign_fifo_generator_0_0_fifo_generator_v13_2_10 U0
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
module mainDesign_fifo_generator_0_0_xpm_cdc_gray
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
module mainDesign_fifo_generator_0_0_xpm_cdc_gray__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 97296)
`pragma protect data_block
+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
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
