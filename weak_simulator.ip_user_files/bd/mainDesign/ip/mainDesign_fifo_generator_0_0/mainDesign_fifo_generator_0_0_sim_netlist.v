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
