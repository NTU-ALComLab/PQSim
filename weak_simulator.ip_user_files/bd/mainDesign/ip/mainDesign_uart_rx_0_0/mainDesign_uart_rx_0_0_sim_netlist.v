// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Wed Oct 30 14:29:04 2024
// Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/Vivado
//               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_rx_0_0/mainDesign_uart_rx_0_0_sim_netlist.v}
// Design      : mainDesign_uart_rx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mainDesign_uart_rx_0_0,uart_rx,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "uart_rx,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module mainDesign_uart_rx_0_0
   (clk,
    rst_n,
    RXD,
    data,
    wr_en);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input RXD;
  output [7:0]data;
  output wr_en;

  wire RXD;
  wire clk;
  wire [7:0]data;
  wire rst_n;
  wire wr_en;

  mainDesign_uart_rx_0_0_uart_rx inst
       (.RXD(RXD),
        .clk(clk),
        .data(data),
        .rst_n(rst_n),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "uart_rx" *) 
module mainDesign_uart_rx_0_0_uart_rx
   (data,
    wr_en,
    clk,
    RXD,
    rst_n);
  output [7:0]data;
  output wr_en;
  input clk;
  input RXD;
  input rst_n;

  wire RXD;
  wire clk;
  wire [14:0]cnt;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[10]_i_1_n_0 ;
  wire \cnt[11]_i_1_n_0 ;
  wire \cnt[12]_i_1_n_0 ;
  wire \cnt[13]_i_1_n_0 ;
  wire \cnt[14]_i_1_n_0 ;
  wire \cnt[14]_i_2_n_0 ;
  wire \cnt[14]_i_3_n_0 ;
  wire \cnt[14]_i_4_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[5]_i_1_n_0 ;
  wire \cnt[6]_i_1_n_0 ;
  wire \cnt[7]_i_1_n_0 ;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[9]_i_1_n_0 ;
  wire \cnt_reg[12]_i_2_n_0 ;
  wire \cnt_reg[12]_i_2_n_1 ;
  wire \cnt_reg[12]_i_2_n_2 ;
  wire \cnt_reg[12]_i_2_n_3 ;
  wire \cnt_reg[14]_i_5_n_3 ;
  wire \cnt_reg[4]_i_2_n_0 ;
  wire \cnt_reg[4]_i_2_n_1 ;
  wire \cnt_reg[4]_i_2_n_2 ;
  wire \cnt_reg[4]_i_2_n_3 ;
  wire \cnt_reg[8]_i_2_n_0 ;
  wire \cnt_reg[8]_i_2_n_1 ;
  wire \cnt_reg[8]_i_2_n_2 ;
  wire \cnt_reg[8]_i_2_n_3 ;
  wire [7:0]data;
  wire [14:1]data0;
  wire \data[7]_i_2_n_0 ;
  wire \data[7]_i_3_n_0 ;
  wire \data[7]_i_4_n_0 ;
  wire data_1;
  wire [7:0]data_r;
  wire \data_r[0]_i_1_n_0 ;
  wire \data_r[0]_i_2_n_0 ;
  wire \data_r[1]_i_1_n_0 ;
  wire \data_r[2]_i_1_n_0 ;
  wire \data_r[3]_i_1_n_0 ;
  wire \data_r[4]_i_1_n_0 ;
  wire \data_r[4]_i_2_n_0 ;
  wire \data_r[5]_i_1_n_0 ;
  wire \data_r[5]_i_2_n_0 ;
  wire \data_r[6]_i_1_n_0 ;
  wire \data_r[6]_i_2_n_0 ;
  wire \data_r[7]_i_1_n_0 ;
  wire \data_r[7]_i_2_n_0 ;
  wire flag;
  wire flag_i_1_n_0;
  wire [3:0]num;
  wire \num[0]_i_1_n_0 ;
  wire \num[1]_i_1_n_0 ;
  wire \num[2]_i_2_n_0 ;
  wire \num[3]_i_1_n_0 ;
  wire num_0;
  wire [0:0]p_7_in;
  wire rst_n;
  wire rxd_r;
  wire wr_en;
  wire wr_en_i_1_n_0;
  wire [3:1]\NLW_cnt_reg[14]_i_5_CO_UNCONNECTED ;
  wire [3:2]\NLW_cnt_reg[14]_i_5_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \cnt[0]_i_1 
       (.I0(flag),
        .I1(cnt[0]),
        .O(\cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[10]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[10]),
        .O(\cnt[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[11]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[11]),
        .O(\cnt[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[12]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[12]),
        .O(\cnt[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[13]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[13]),
        .O(\cnt[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[14]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[14]),
        .O(\cnt[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cnt[14]_i_2 
       (.I0(cnt[13]),
        .I1(cnt[14]),
        .I2(cnt[11]),
        .I3(cnt[12]),
        .I4(cnt[2]),
        .I5(cnt[1]),
        .O(\cnt[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFF7)) 
    \cnt[14]_i_3 
       (.I0(cnt[7]),
        .I1(cnt[4]),
        .I2(cnt[10]),
        .I3(cnt[9]),
        .O(\cnt[14]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFDFFF)) 
    \cnt[14]_i_4 
       (.I0(cnt[0]),
        .I1(cnt[6]),
        .I2(cnt[8]),
        .I3(cnt[5]),
        .I4(cnt[3]),
        .O(\cnt[14]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[1]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[1]),
        .O(\cnt[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[2]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[2]),
        .O(\cnt[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[3]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[3]),
        .O(\cnt[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[4]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[4]),
        .O(\cnt[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[5]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[5]),
        .O(\cnt[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[6]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[6]),
        .O(\cnt[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[7]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[7]),
        .O(\cnt[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[8]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[8]),
        .O(\cnt[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \cnt[9]_i_1 
       (.I0(\cnt[14]_i_2_n_0 ),
        .I1(\cnt[14]_i_3_n_0 ),
        .I2(\cnt[14]_i_4_n_0 ),
        .I3(flag),
        .I4(data0[9]),
        .O(\cnt[9]_i_1_n_0 ));
  FDCE \cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt[0]));
  FDCE \cnt_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[10]_i_1_n_0 ),
        .Q(cnt[10]));
  FDCE \cnt_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[11]_i_1_n_0 ),
        .Q(cnt[11]));
  FDCE \cnt_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[12]_i_1_n_0 ),
        .Q(cnt[12]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[12]_i_2 
       (.CI(\cnt_reg[8]_i_2_n_0 ),
        .CO({\cnt_reg[12]_i_2_n_0 ,\cnt_reg[12]_i_2_n_1 ,\cnt_reg[12]_i_2_n_2 ,\cnt_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(cnt[12:9]));
  FDCE \cnt_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[13]_i_1_n_0 ),
        .Q(cnt[13]));
  FDCE \cnt_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[14]_i_1_n_0 ),
        .Q(cnt[14]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[14]_i_5 
       (.CI(\cnt_reg[12]_i_2_n_0 ),
        .CO({\NLW_cnt_reg[14]_i_5_CO_UNCONNECTED [3:1],\cnt_reg[14]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[14]_i_5_O_UNCONNECTED [3:2],data0[14:13]}),
        .S({1'b0,1'b0,cnt[14:13]}));
  FDCE \cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt[1]));
  FDCE \cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt[2]));
  FDCE \cnt_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt[3]));
  FDCE \cnt_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[4]_i_1_n_0 ),
        .Q(cnt[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[4]_i_2_n_0 ,\cnt_reg[4]_i_2_n_1 ,\cnt_reg[4]_i_2_n_2 ,\cnt_reg[4]_i_2_n_3 }),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(cnt[4:1]));
  FDCE \cnt_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[5]_i_1_n_0 ),
        .Q(cnt[5]));
  FDCE \cnt_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[6]_i_1_n_0 ),
        .Q(cnt[6]));
  FDCE \cnt_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[7]_i_1_n_0 ),
        .Q(cnt[7]));
  FDCE \cnt_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[8]_i_1_n_0 ),
        .Q(cnt[8]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \cnt_reg[8]_i_2 
       (.CI(\cnt_reg[4]_i_2_n_0 ),
        .CO({\cnt_reg[8]_i_2_n_0 ,\cnt_reg[8]_i_2_n_1 ,\cnt_reg[8]_i_2_n_2 ,\cnt_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(cnt[8:5]));
  FDCE \cnt_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\cnt[9]_i_1_n_0 ),
        .Q(cnt[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \data[7]_i_1 
       (.I0(num[3]),
        .I1(num[2]),
        .I2(num[0]),
        .I3(num[1]),
        .I4(\data[7]_i_3_n_0 ),
        .O(data_1));
  LUT1 #(
    .INIT(2'h1)) 
    \data[7]_i_2 
       (.I0(rst_n),
        .O(\data[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \data[7]_i_3 
       (.I0(\data[7]_i_4_n_0 ),
        .I1(cnt[8]),
        .I2(\cnt[14]_i_2_n_0 ),
        .I3(\cnt[14]_i_3_n_0 ),
        .O(\data[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \data[7]_i_4 
       (.I0(cnt[5]),
        .I1(cnt[6]),
        .I2(cnt[0]),
        .I3(cnt[3]),
        .O(\data[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBFFFF00080000)) 
    \data_r[0]_i_1 
       (.I0(p_7_in),
        .I1(num[0]),
        .I2(num[1]),
        .I3(num[2]),
        .I4(\data_r[0]_i_2_n_0 ),
        .I5(data_r[0]),
        .O(\data_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000100)) 
    \data_r[0]_i_2 
       (.I0(\cnt[14]_i_3_n_0 ),
        .I1(\cnt[14]_i_2_n_0 ),
        .I2(cnt[8]),
        .I3(\data[7]_i_4_n_0 ),
        .I4(num[3]),
        .O(\data_r[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \data_r[1]_i_1 
       (.I0(p_7_in),
        .I1(num[2]),
        .I2(\data_r[5]_i_2_n_0 ),
        .I3(num[3]),
        .I4(\data[7]_i_3_n_0 ),
        .I5(data_r[1]),
        .O(\data_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFF00200000)) 
    \data_r[2]_i_1 
       (.I0(p_7_in),
        .I1(num[2]),
        .I2(\data_r[6]_i_2_n_0 ),
        .I3(num[3]),
        .I4(\data[7]_i_3_n_0 ),
        .I5(data_r[2]),
        .O(\data_r[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    \data_r[3]_i_1 
       (.I0(p_7_in),
        .I1(num[1]),
        .I2(num[0]),
        .I3(\data_r[4]_i_2_n_0 ),
        .I4(data_r[3]),
        .O(\data_r[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    \data_r[4]_i_1 
       (.I0(p_7_in),
        .I1(num[1]),
        .I2(num[0]),
        .I3(\data_r[4]_i_2_n_0 ),
        .I4(data_r[4]),
        .O(\data_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    \data_r[4]_i_2 
       (.I0(num[3]),
        .I1(\data[7]_i_4_n_0 ),
        .I2(cnt[8]),
        .I3(\cnt[14]_i_2_n_0 ),
        .I4(\cnt[14]_i_3_n_0 ),
        .I5(num[2]),
        .O(\data_r[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \data_r[5]_i_1 
       (.I0(p_7_in),
        .I1(num[2]),
        .I2(\data[7]_i_3_n_0 ),
        .I3(num[3]),
        .I4(\data_r[5]_i_2_n_0 ),
        .I5(data_r[5]),
        .O(\data_r[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_r[5]_i_2 
       (.I0(num[1]),
        .I1(num[0]),
        .O(\data_r[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFF00800000)) 
    \data_r[6]_i_1 
       (.I0(p_7_in),
        .I1(num[2]),
        .I2(\data[7]_i_3_n_0 ),
        .I3(num[3]),
        .I4(\data_r[6]_i_2_n_0 ),
        .I5(data_r[6]),
        .O(\data_r[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_r[6]_i_2 
       (.I0(num[0]),
        .I1(num[1]),
        .O(\data_r[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFBFFFF00080000)) 
    \data_r[7]_i_1 
       (.I0(p_7_in),
        .I1(\data_r[7]_i_2_n_0 ),
        .I2(num[0]),
        .I3(num[1]),
        .I4(\data[7]_i_3_n_0 ),
        .I5(data_r[7]),
        .O(\data_r[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \data_r[7]_i_2 
       (.I0(num[3]),
        .I1(num[2]),
        .O(\data_r[7]_i_2_n_0 ));
  FDCE \data_r_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[0]_i_1_n_0 ),
        .Q(data_r[0]));
  FDCE \data_r_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[1]_i_1_n_0 ),
        .Q(data_r[1]));
  FDCE \data_r_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[2]_i_1_n_0 ),
        .Q(data_r[2]));
  FDCE \data_r_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[3]_i_1_n_0 ),
        .Q(data_r[3]));
  FDCE \data_r_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[4]_i_1_n_0 ),
        .Q(data_r[4]));
  FDCE \data_r_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[5]_i_1_n_0 ),
        .Q(data_r[5]));
  FDCE \data_r_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[6]_i_1_n_0 ),
        .Q(data_r[6]));
  FDCE \data_r_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\data_r[7]_i_1_n_0 ),
        .Q(data_r[7]));
  FDCE \data_reg[0] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[0]),
        .Q(data[0]));
  FDCE \data_reg[1] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[1]),
        .Q(data[1]));
  FDCE \data_reg[2] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[2]),
        .Q(data[2]));
  FDCE \data_reg[3] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[3]),
        .Q(data[3]));
  FDCE \data_reg[4] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[4]),
        .Q(data[4]));
  FDCE \data_reg[5] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[5]),
        .Q(data[5]));
  FDCE \data_reg[6] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[6]),
        .Q(data[6]));
  FDCE \data_reg[7] 
       (.C(clk),
        .CE(data_1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(data_r[7]),
        .Q(data[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7530)) 
    flag_i_1
       (.I0(wr_en_i_1_n_0),
        .I1(rxd_r),
        .I2(p_7_in),
        .I3(flag),
        .O(flag_i_1_n_0));
  FDCE flag_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(flag_i_1_n_0),
        .Q(flag));
  LUT2 #(
    .INIT(4'h2)) 
    \num[0]_i_1 
       (.I0(\data[7]_i_3_n_0 ),
        .I1(num[0]),
        .O(\num[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \num[1]_i_1 
       (.I0(\data[7]_i_3_n_0 ),
        .I1(num[1]),
        .I2(num[0]),
        .O(\num[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    \num[2]_i_1 
       (.I0(num[1]),
        .I1(num[0]),
        .I2(num[3]),
        .I3(num[2]),
        .I4(\data[7]_i_3_n_0 ),
        .O(num_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \num[2]_i_2 
       (.I0(\data[7]_i_3_n_0 ),
        .I1(num[2]),
        .I2(num[0]),
        .I3(num[1]),
        .O(\num[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h78F0F0D0)) 
    \num[3]_i_1 
       (.I0(num[1]),
        .I1(num[0]),
        .I2(num[3]),
        .I3(num[2]),
        .I4(\data[7]_i_3_n_0 ),
        .O(\num[3]_i_1_n_0 ));
  FDCE \num_reg[0] 
       (.C(clk),
        .CE(num_0),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\num[0]_i_1_n_0 ),
        .Q(num[0]));
  FDCE \num_reg[1] 
       (.C(clk),
        .CE(num_0),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\num[1]_i_1_n_0 ),
        .Q(num[1]));
  FDCE \num_reg[2] 
       (.C(clk),
        .CE(num_0),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\num[2]_i_2_n_0 ),
        .Q(num[2]));
  FDCE \num_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(\num[3]_i_1_n_0 ),
        .Q(num[3]));
  FDRE rxd_r_reg
       (.C(clk),
        .CE(1'b1),
        .D(RXD),
        .Q(rxd_r),
        .R(1'b0));
  FDRE rxd_rr_reg
       (.C(clk),
        .CE(1'b1),
        .D(rxd_r),
        .Q(p_7_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    wr_en_i_1
       (.I0(num[2]),
        .I1(num[3]),
        .I2(num[0]),
        .I3(num[1]),
        .O(wr_en_i_1_n_0));
  FDCE wr_en_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\data[7]_i_2_n_0 ),
        .D(wr_en_i_1_n_0),
        .Q(wr_en));
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
