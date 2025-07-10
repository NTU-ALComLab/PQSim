// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sat Apr 12 01:11:35 2025
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/Vivado
//               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_tx_0_0/mainDesign_uart_tx_0_0_sim_netlist.v}
// Design      : mainDesign_uart_tx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mainDesign_uart_tx_0_0,uart_tx,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "uart_tx,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module mainDesign_uart_tx_0_0
   (clk,
    rst_n,
    empty,
    data,
    rd_en,
    TXD);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input empty;
  input [7:0]data;
  output rd_en;
  output TXD;

  wire TXD;
  wire clk;
  wire [7:0]data;
  wire empty;
  wire rd_en;
  wire rst_n;

  mainDesign_uart_tx_0_0_uart_tx inst
       (.TXD(TXD),
        .clk(clk),
        .data(data),
        .empty(empty),
        .rd_en(rd_en),
        .rst_n(rst_n));
endmodule

(* ORIG_REF_NAME = "uart_tx" *) 
module mainDesign_uart_tx_0_0_uart_tx
   (rd_en,
    TXD,
    clk,
    data,
    rst_n,
    empty);
  output rd_en;
  output TXD;
  input clk;
  input [7:0]data;
  input rst_n;
  input empty;

  wire TXD;
  wire TXD_0;
  wire TXD_i_10_n_0;
  wire TXD_i_1_n_0;
  wire TXD_i_2_n_0;
  wire TXD_i_3_n_0;
  wire TXD_i_4_n_0;
  wire TXD_i_5_n_0;
  wire TXD_i_7_n_0;
  wire TXD_i_8_n_0;
  wire TXD_i_9_n_0;
  wire clk;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[14]_i_2_n_0 ;
  wire \cnt[14]_i_4_n_0 ;
  wire \cnt_reg[12]_i_2_n_0 ;
  wire \cnt_reg[12]_i_2_n_1 ;
  wire \cnt_reg[12]_i_2_n_2 ;
  wire \cnt_reg[12]_i_2_n_3 ;
  wire \cnt_reg[12]_i_2_n_4 ;
  wire \cnt_reg[12]_i_2_n_5 ;
  wire \cnt_reg[12]_i_2_n_6 ;
  wire \cnt_reg[12]_i_2_n_7 ;
  wire \cnt_reg[14]_i_3_n_3 ;
  wire \cnt_reg[14]_i_3_n_6 ;
  wire \cnt_reg[14]_i_3_n_7 ;
  wire \cnt_reg[4]_i_2_n_0 ;
  wire \cnt_reg[4]_i_2_n_1 ;
  wire \cnt_reg[4]_i_2_n_2 ;
  wire \cnt_reg[4]_i_2_n_3 ;
  wire \cnt_reg[4]_i_2_n_4 ;
  wire \cnt_reg[4]_i_2_n_5 ;
  wire \cnt_reg[4]_i_2_n_6 ;
  wire \cnt_reg[4]_i_2_n_7 ;
  wire \cnt_reg[8]_i_2_n_0 ;
  wire \cnt_reg[8]_i_2_n_1 ;
  wire \cnt_reg[8]_i_2_n_2 ;
  wire \cnt_reg[8]_i_2_n_3 ;
  wire \cnt_reg[8]_i_2_n_4 ;
  wire \cnt_reg[8]_i_2_n_5 ;
  wire \cnt_reg[8]_i_2_n_6 ;
  wire \cnt_reg[8]_i_2_n_7 ;
  wire \cnt_reg_n_0_[0] ;
  wire \cnt_reg_n_0_[10] ;
  wire \cnt_reg_n_0_[11] ;
  wire \cnt_reg_n_0_[12] ;
  wire \cnt_reg_n_0_[13] ;
  wire \cnt_reg_n_0_[14] ;
  wire \cnt_reg_n_0_[1] ;
  wire \cnt_reg_n_0_[2] ;
  wire \cnt_reg_n_0_[3] ;
  wire \cnt_reg_n_0_[4] ;
  wire \cnt_reg_n_0_[5] ;
  wire \cnt_reg_n_0_[6] ;
  wire \cnt_reg_n_0_[7] ;
  wire \cnt_reg_n_0_[8] ;
  wire \cnt_reg_n_0_[9] ;
  wire [7:0]data;
  wire empty;
  wire flag;
  wire flag_i_1_n_0;
  wire num;
  wire \num[0]_i_1_n_0 ;
  wire \num[1]_i_1_n_0 ;
  wire \num[2]_i_2_n_0 ;
  wire \num[3]_i_1_n_0 ;
  wire \num_reg_n_0_[0] ;
  wire \num_reg_n_0_[1] ;
  wire \num_reg_n_0_[2] ;
  wire \num_reg_n_0_[3] ;
  wire [14:1]p_0_in;
  wire rd_en;
  wire rd_en_INST_0_i_1_n_0;
  wire rd_en_INST_0_i_2_n_0;
  wire rd_en_INST_0_i_3_n_0;
  wire rd_en_INST_0_i_4_n_0;
  wire rst_n;
  wire [3:1]\NLW_cnt_reg[14]_i_3_CO_UNCONNECTED ;
  wire [3:2]\NLW_cnt_reg[14]_i_3_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFEEEFFFFFEEE0000)) 
    TXD_i_1
       (.I0(TXD_i_3_n_0),
        .I1(TXD_i_4_n_0),
        .I2(TXD_i_5_n_0),
        .I3(\num_reg_n_0_[3] ),
        .I4(TXD_0),
        .I5(TXD),
        .O(TXD_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    TXD_i_10
       (.I0(\cnt_reg_n_0_[2] ),
        .I1(\cnt_reg_n_0_[1] ),
        .I2(\cnt_reg_n_0_[10] ),
        .I3(\cnt_reg_n_0_[9] ),
        .O(TXD_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    TXD_i_2
       (.I0(rst_n),
        .O(TXD_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFF8888888)) 
    TXD_i_3
       (.I0(\num_reg_n_0_[3] ),
        .I1(data[7]),
        .I2(data[6]),
        .I3(\num_reg_n_0_[2] ),
        .I4(TXD_i_7_n_0),
        .I5(TXD_i_8_n_0),
        .O(TXD_i_3_n_0));
  LUT6 #(
    .INIT(64'h00000A0ACFC00000)) 
    TXD_i_4
       (.I0(data[1]),
        .I1(data[4]),
        .I2(\num_reg_n_0_[2] ),
        .I3(data[0]),
        .I4(\num_reg_n_0_[0] ),
        .I5(\num_reg_n_0_[1] ),
        .O(TXD_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    TXD_i_5
       (.I0(\num_reg_n_0_[2] ),
        .I1(\num_reg_n_0_[0] ),
        .I2(\num_reg_n_0_[1] ),
        .O(TXD_i_5_n_0));
  LUT5 #(
    .INIT(32'h02000000)) 
    TXD_i_6
       (.I0(TXD_i_9_n_0),
        .I1(TXD_i_10_n_0),
        .I2(rd_en_INST_0_i_3_n_0),
        .I3(\cnt_reg_n_0_[4] ),
        .I4(\cnt_reg_n_0_[7] ),
        .O(TXD_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    TXD_i_7
       (.I0(\num_reg_n_0_[0] ),
        .I1(\num_reg_n_0_[1] ),
        .O(TXD_i_7_n_0));
  LUT6 #(
    .INIT(64'h0A0C0A0CF0000000)) 
    TXD_i_8
       (.I0(data[5]),
        .I1(data[3]),
        .I2(\num_reg_n_0_[0] ),
        .I3(\num_reg_n_0_[1] ),
        .I4(data[2]),
        .I5(\num_reg_n_0_[2] ),
        .O(TXD_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    TXD_i_9
       (.I0(\cnt_reg_n_0_[6] ),
        .I1(\cnt_reg_n_0_[5] ),
        .I2(\cnt_reg_n_0_[8] ),
        .I3(\cnt_reg_n_0_[0] ),
        .I4(\cnt_reg_n_0_[3] ),
        .O(TXD_i_9_n_0));
  FDPE TXD_reg
       (.C(clk),
        .CE(1'b1),
        .D(TXD_i_1_n_0),
        .PRE(TXD_i_2_n_0),
        .Q(TXD));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[0]_i_1 
       (.I0(flag),
        .I1(\cnt_reg_n_0_[0] ),
        .O(\cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[10]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_6 ),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[11]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_5 ),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[12]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_4 ),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[13]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[14]_i_3_n_7 ),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[14]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[14]_i_3_n_6 ),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'hFFFFFFF700000000)) 
    \cnt[14]_i_2 
       (.I0(\cnt_reg_n_0_[7] ),
        .I1(\cnt_reg_n_0_[4] ),
        .I2(rd_en_INST_0_i_3_n_0),
        .I3(TXD_i_10_n_0),
        .I4(\cnt[14]_i_4_n_0 ),
        .I5(flag),
        .O(\cnt[14]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFF7F)) 
    \cnt[14]_i_4 
       (.I0(\cnt_reg_n_0_[8] ),
        .I1(\cnt_reg_n_0_[5] ),
        .I2(\cnt_reg_n_0_[0] ),
        .I3(\cnt_reg_n_0_[3] ),
        .I4(\cnt_reg_n_0_[6] ),
        .O(\cnt[14]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[1]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_7 ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[2]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_6 ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[3]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_5 ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[4]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[4]_i_2_n_4 ),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[5]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_7 ),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[6]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_6 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[7]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_5 ),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[8]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[8]_i_2_n_4 ),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[9]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt_reg[12]_i_2_n_7 ),
        .O(p_0_in[9]));
  FDCE \cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(\cnt_reg_n_0_[0] ));
  FDCE \cnt_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[10]),
        .Q(\cnt_reg_n_0_[10] ));
  FDCE \cnt_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[11]),
        .Q(\cnt_reg_n_0_[11] ));
  FDCE \cnt_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[12]),
        .Q(\cnt_reg_n_0_[12] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[12]_i_2 
       (.CI(\cnt_reg[8]_i_2_n_0 ),
        .CO({\cnt_reg[12]_i_2_n_0 ,\cnt_reg[12]_i_2_n_1 ,\cnt_reg[12]_i_2_n_2 ,\cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_2_n_4 ,\cnt_reg[12]_i_2_n_5 ,\cnt_reg[12]_i_2_n_6 ,\cnt_reg[12]_i_2_n_7 }),
        .S({\cnt_reg_n_0_[12] ,\cnt_reg_n_0_[11] ,\cnt_reg_n_0_[10] ,\cnt_reg_n_0_[9] }));
  FDCE \cnt_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[13]),
        .Q(\cnt_reg_n_0_[13] ));
  FDCE \cnt_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[14]),
        .Q(\cnt_reg_n_0_[14] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[14]_i_3 
       (.CI(\cnt_reg[12]_i_2_n_0 ),
        .CO({\NLW_cnt_reg[14]_i_3_CO_UNCONNECTED [3:1],\cnt_reg[14]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[14]_i_3_O_UNCONNECTED [3:2],\cnt_reg[14]_i_3_n_6 ,\cnt_reg[14]_i_3_n_7 }),
        .S({1'b0,1'b0,\cnt_reg_n_0_[14] ,\cnt_reg_n_0_[13] }));
  FDCE \cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[1]),
        .Q(\cnt_reg_n_0_[1] ));
  FDCE \cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[2]),
        .Q(\cnt_reg_n_0_[2] ));
  FDCE \cnt_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[3]),
        .Q(\cnt_reg_n_0_[3] ));
  FDCE \cnt_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[4]),
        .Q(\cnt_reg_n_0_[4] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_2_n_0 ,\cnt_reg[4]_i_2_n_1 ,\cnt_reg[4]_i_2_n_2 ,\cnt_reg[4]_i_2_n_3 }),
        .CYINIT(\cnt_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_2_n_4 ,\cnt_reg[4]_i_2_n_5 ,\cnt_reg[4]_i_2_n_6 ,\cnt_reg[4]_i_2_n_7 }),
        .S({\cnt_reg_n_0_[4] ,\cnt_reg_n_0_[3] ,\cnt_reg_n_0_[2] ,\cnt_reg_n_0_[1] }));
  FDCE \cnt_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[5]),
        .Q(\cnt_reg_n_0_[5] ));
  FDCE \cnt_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[6]),
        .Q(\cnt_reg_n_0_[6] ));
  FDCE \cnt_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[7]),
        .Q(\cnt_reg_n_0_[7] ));
  FDCE \cnt_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[8]),
        .Q(\cnt_reg_n_0_[8] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[8]_i_2 
       (.CI(\cnt_reg[4]_i_2_n_0 ),
        .CO({\cnt_reg[8]_i_2_n_0 ,\cnt_reg[8]_i_2_n_1 ,\cnt_reg[8]_i_2_n_2 ,\cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_2_n_4 ,\cnt_reg[8]_i_2_n_5 ,\cnt_reg[8]_i_2_n_6 ,\cnt_reg[8]_i_2_n_7 }),
        .S({\cnt_reg_n_0_[8] ,\cnt_reg_n_0_[7] ,\cnt_reg_n_0_[6] ,\cnt_reg_n_0_[5] }));
  FDCE \cnt_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(p_0_in[9]),
        .Q(\cnt_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'hEFFFFFFF0000FFFF)) 
    flag_i_1
       (.I0(\num_reg_n_0_[0] ),
        .I1(\num_reg_n_0_[2] ),
        .I2(\num_reg_n_0_[1] ),
        .I3(\num_reg_n_0_[3] ),
        .I4(empty),
        .I5(flag),
        .O(flag_i_1_n_0));
  FDCE flag_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(flag_i_1_n_0),
        .Q(flag));
  LUT2 #(
    .INIT(4'h2)) 
    \num[0]_i_1 
       (.I0(TXD_0),
        .I1(\num_reg_n_0_[0] ),
        .O(\num[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \num[1]_i_1 
       (.I0(TXD_0),
        .I1(\num_reg_n_0_[1] ),
        .I2(\num_reg_n_0_[0] ),
        .O(\num[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF1000)) 
    \num[2]_i_1 
       (.I0(\num_reg_n_0_[0] ),
        .I1(\num_reg_n_0_[2] ),
        .I2(\num_reg_n_0_[1] ),
        .I3(\num_reg_n_0_[3] ),
        .I4(TXD_0),
        .O(num));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \num[2]_i_2 
       (.I0(TXD_0),
        .I1(\num_reg_n_0_[2] ),
        .I2(\num_reg_n_0_[0] ),
        .I3(\num_reg_n_0_[1] ),
        .O(\num[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F80EF00)) 
    \num[3]_i_1 
       (.I0(\num_reg_n_0_[0] ),
        .I1(\num_reg_n_0_[2] ),
        .I2(\num_reg_n_0_[1] ),
        .I3(\num_reg_n_0_[3] ),
        .I4(TXD_0),
        .O(\num[3]_i_1_n_0 ));
  FDCE \num_reg[0] 
       (.C(clk),
        .CE(num),
        .CLR(TXD_i_2_n_0),
        .D(\num[0]_i_1_n_0 ),
        .Q(\num_reg_n_0_[0] ));
  FDCE \num_reg[1] 
       (.C(clk),
        .CE(num),
        .CLR(TXD_i_2_n_0),
        .D(\num[1]_i_1_n_0 ),
        .Q(\num_reg_n_0_[1] ));
  FDCE \num_reg[2] 
       (.C(clk),
        .CE(num),
        .CLR(TXD_i_2_n_0),
        .D(\num[2]_i_2_n_0 ),
        .Q(\num_reg_n_0_[2] ));
  FDCE \num_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(TXD_i_2_n_0),
        .D(\num[3]_i_1_n_0 ),
        .Q(\num_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    rd_en_INST_0
       (.I0(rd_en_INST_0_i_1_n_0),
        .I1(rd_en_INST_0_i_2_n_0),
        .I2(\num_reg_n_0_[1] ),
        .I3(\num_reg_n_0_[0] ),
        .I4(\num_reg_n_0_[2] ),
        .O(rd_en));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    rd_en_INST_0_i_1
       (.I0(\cnt_reg_n_0_[9] ),
        .I1(\cnt_reg_n_0_[10] ),
        .I2(\cnt_reg_n_0_[1] ),
        .I3(\cnt_reg_n_0_[2] ),
        .I4(rd_en_INST_0_i_3_n_0),
        .O(rd_en_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    rd_en_INST_0_i_2
       (.I0(\cnt_reg_n_0_[5] ),
        .I1(\cnt_reg_n_0_[8] ),
        .I2(\cnt_reg_n_0_[7] ),
        .I3(\cnt_reg_n_0_[4] ),
        .I4(\num_reg_n_0_[3] ),
        .I5(rd_en_INST_0_i_4_n_0),
        .O(rd_en_INST_0_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    rd_en_INST_0_i_3
       (.I0(\cnt_reg_n_0_[12] ),
        .I1(\cnt_reg_n_0_[11] ),
        .I2(\cnt_reg_n_0_[14] ),
        .I3(\cnt_reg_n_0_[13] ),
        .O(rd_en_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    rd_en_INST_0_i_4
       (.I0(\cnt_reg_n_0_[6] ),
        .I1(\cnt_reg_n_0_[3] ),
        .I2(\cnt_reg_n_0_[0] ),
        .O(rd_en_INST_0_i_4_n_0));
endmodule
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
