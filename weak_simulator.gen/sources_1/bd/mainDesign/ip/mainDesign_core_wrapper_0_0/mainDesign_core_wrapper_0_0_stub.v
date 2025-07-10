// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Apr 12 01:14:06 2025
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/Vivado
//               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_core_wrapper_0_0/mainDesign_core_wrapper_0_0_stub.v}
// Design      : mainDesign_core_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "core_wrapper,Vivado 2024.1" *)
module mainDesign_core_wrapper_0_0(clk, rst_n, i_data, i_rd_en, i_empty, o_data, 
  o_empty, o_rd_en)
/* synthesis syn_black_box black_box_pad_pin="rst_n,i_data[7:0],i_rd_en,i_empty,o_data[7:0],o_empty,o_rd_en" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input rst_n;
  input [7:0]i_data;
  input i_rd_en;
  input i_empty;
  output [7:0]o_data;
  output o_empty;
  output o_rd_en;
endmodule
