// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Apr 12 01:11:35 2025
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/Vivado
//               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_tx_0_0/mainDesign_uart_tx_0_0_stub.v}
// Design      : mainDesign_uart_tx_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uart_tx,Vivado 2024.1" *)
module mainDesign_uart_tx_0_0(clk, rst_n, empty, data, rd_en, TXD)
/* synthesis syn_black_box black_box_pad_pin="rst_n,empty,data[7:0],rd_en,TXD" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input rst_n;
  input empty;
  input [7:0]data;
  output rd_en;
  output TXD;
endmodule
