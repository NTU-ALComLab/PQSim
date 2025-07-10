//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Wed Apr  9 14:22:49 2025
//Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
//Command     : generate_target mainDesign_wrapper.bd
//Design      : mainDesign_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mainDesign_wrapper
   (CLK100MHZ,
    RXD,
    SW_rst_n,
    TXD);
  input CLK100MHZ;
  input RXD;
  input SW_rst_n;
  output TXD;

  wire CLK100MHZ;
  wire RXD;
  wire SW_rst_n;
  wire TXD;

  mainDesign mainDesign_i
       (.CLK100MHZ(CLK100MHZ),
        .RXD(RXD),
        .SW_rst_n(SW_rst_n),
        .TXD(TXD));
endmodule
