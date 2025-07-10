//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Wed Apr  9 14:22:49 2025
//Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
//Command     : generate_target mainDesign.bd
//Design      : mainDesign
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mainDesign,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mainDesign,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "mainDesign.hwdef" *) 
module mainDesign
   (CLK100MHZ,
    RXD,
    SW_rst_n,
    TXD);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK100MHZ, ASSOCIATED_RESET RESET_N, CLK_DOMAIN mainDesign_CLK100MHZ, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CLK100MHZ;
  input RXD;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SW_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SW_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input SW_rst_n;
  output TXD;

  wire CLK100MHZ_1;
  wire RXD_1;
  wire clk_wiz_0_clk_out1;
  wire [7:0]core_wrapper_0_o_data;
  wire core_wrapper_0_o_empty;
  wire core_wrapper_0_o_rd_en;
  wire [7:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire rst_n_1;
  wire [7:0]uart_rx_0_data;
  wire uart_rx_0_wr_en;
  wire uart_tx_0_TXD;
  wire uart_tx_0_rd_en;

  assign CLK100MHZ_1 = CLK100MHZ;
  assign RXD_1 = RXD;
  assign TXD = uart_tx_0_TXD;
  assign rst_n_1 = SW_rst_n;
  mainDesign_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(CLK100MHZ_1),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(rst_n_1));
  mainDesign_core_wrapper_0_0 core_wrapper_0
       (.clk(clk_wiz_0_clk_out1),
        .i_data(fifo_generator_0_dout),
        .i_empty(fifo_generator_0_empty),
        .i_rd_en(uart_tx_0_rd_en),
        .o_data(core_wrapper_0_o_data),
        .o_empty(core_wrapper_0_o_empty),
        .o_rd_en(core_wrapper_0_o_rd_en),
        .rst_n(rst_n_1));
  mainDesign_fifo_generator_0_0 fifo_generator_0
       (.din(uart_rx_0_data),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .rd_clk(clk_wiz_0_clk_out1),
        .rd_en(core_wrapper_0_o_rd_en),
        .wr_clk(clk_wiz_0_clk_out1),
        .wr_en(uart_rx_0_wr_en));
  mainDesign_uart_rx_0_0 uart_rx_0
       (.RXD(RXD_1),
        .clk(clk_wiz_0_clk_out1),
        .data(uart_rx_0_data),
        .rst_n(rst_n_1),
        .wr_en(uart_rx_0_wr_en));
  mainDesign_uart_tx_0_0 uart_tx_0
       (.TXD(uart_tx_0_TXD),
        .clk(clk_wiz_0_clk_out1),
        .data(core_wrapper_0_o_data),
        .empty(core_wrapper_0_o_empty),
        .rd_en(uart_tx_0_rd_en),
        .rst_n(rst_n_1));
endmodule
