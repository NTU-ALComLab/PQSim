`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/09/04 00:42:04
// Design Name:
// Module Name: Core
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`include "define.v"

module Core(
    input clk,
    input rst_n,
    input [`MAX_INPUT_BITS - 1:0] i_basis,
    input i_data_ready,
    output [`MAX_OUTPUT_BITS_2 + `MAX_OUTPUT_BITS_1 - 1:0] o_data_all,
    output o_finish
);

integer i;
reg [7:0] cnt_r [0 : `NUM_CUTS - 1];
reg [7:0] cnt_w [0 : `NUM_CUTS - 1];

reg [3:0] multi_cnt_r, multi_cnt_w;

// define state
localparam S_IDLE = 2'd0;
localparam S_SETUP = 2'd1;
localparam S_MEASURE = 2'd2;
localparam S_MULTI = 2'd3;

reg [1:0] state_r, state_w;

reg [4*`NUM_QUBITS - 1:0] i_basis_r, i_basis_w;
reg [1:0] basis_r [0:`NUM_TOTAL_QUBITS - 1];
reg [1:0] basis_w [0:`NUM_TOTAL_QUBITS - 1];
reg [1:0] result_r [0:`NUM_TOTAL_QUBITS - 1];
reg [1:0] result_w [0:`NUM_TOTAL_QUBITS - 1];
reg setup_r, setup_w;
reg back_setup_r, back_setup_w;
wire signed [$clog2(`NUM_TOTAL_QUBITS) :0] measure_value;
wire is_zero;
wire is_neg;
wire ready;

//@5

reg [`MAX_OUTPUT_BITS_1 - 1:0] o_k_r, o_k_w;

reg signed [`MAX_OUTPUT_BITS_2/2 - 1:0] o_a_r, o_a_w;
reg signed [`MAX_OUTPUT_BITS_2/2 - 1:0] o_b_r, o_b_w;
reg signed [`MAX_OUTPUT_BITS_2/2 - 1:0] o_temp_a_r, o_temp_a_w;
reg signed [`MAX_OUTPUT_BITS_2/2 - 1:0] o_temp_b_r, o_temp_b_w;
reg o_finish_r, o_finish_w;

assign o_data_all = {o_k_r, o_a_r, o_b_r};
assign o_finish = o_finish_r;

always@(*) begin
    state_w = state_r;
    for (i=0 ; i<`NUM_CUTS ; i = i+1) begin
        cnt_w[i] = cnt_r[i];
    end
    multi_cnt_w = multi_cnt_r;
    i_basis_w = i_basis_r;
    setup_w = setup_r;
    back_setup_w = back_setup_r;
    for (i=0 ; i<`NUM_TOTAL_QUBITS;i = i+1) begin
        basis_w[i] = basis_r[i];
        result_w[i] = result_r[i];
    end
//@7
    o_k_w = o_k_r;
    o_a_w = o_a_r;
    o_b_w = o_b_r;
    o_temp_a_w = o_temp_a_r;
    o_temp_b_w = o_temp_b_r;
    o_finish_w = o_finish_r;

    case(state_r)
    S_IDLE : begin
        o_finish_w = 1'b0;
        if (i_data_ready) begin
            state_w = S_SETUP;
            for (i=0;i<`NUM_CUTS;i = i+1) begin
                cnt_w[i] = 3'd0;
            end
            i_basis_w = i_basis[4*`NUM_QUBITS - 1:0];
            o_a_w = 0;
            o_b_w = 0;
        end
    end
    S_SETUP : begin
        setup_w = 1'b1;
//@1
basis_w[0] = (i_basis_r[3 -: 2] == 2'b00)? 2'b00 : i_basis_r[1 -: 2];
result_w[0] = (i_basis_r[3 -: 2] == 2'b00)? 2'b00 : i_basis_r[3 -: 2];
basis_w[1] = (i_basis_r[7 -: 2] == 2'b00)? 2'b00 : i_basis_r[5 -: 2];
result_w[1] = (i_basis_r[7 -: 2] == 2'b00)? 2'b00 : i_basis_r[7 -: 2];
basis_w[2] = (i_basis_r[11 -: 2] == 2'b00)? 2'b00 : i_basis_r[9 -: 2];
result_w[2] = (i_basis_r[11 -: 2] == 2'b00)? 2'b00 : i_basis_r[11 -: 2];
basis_w[3] = (i_basis_r[15 -: 2] == 2'b00)? 2'b00 : i_basis_r[13 -: 2];
result_w[3] = (i_basis_r[15 -: 2] == 2'b00)? 2'b00 : i_basis_r[15 -: 2];
basis_w[4] = (i_basis_r[19 -: 2] == 2'b00)? 2'b00 : i_basis_r[17 -: 2];
result_w[4] = (i_basis_r[19 -: 2] == 2'b00)? 2'b00 : i_basis_r[19 -: 2];
basis_w[5] = (i_basis_r[23 -: 2] == 2'b00)? 2'b00 : i_basis_r[21 -: 2];
result_w[5] = (i_basis_r[23 -: 2] == 2'b00)? 2'b00 : i_basis_r[23 -: 2];
basis_w[6] = (i_basis_r[27 -: 2] == 2'b00)? 2'b00 : i_basis_r[25 -: 2];
result_w[6] = (i_basis_r[27 -: 2] == 2'b00)? 2'b00 : i_basis_r[27 -: 2];
basis_w[7] = (i_basis_r[31 -: 2] == 2'b00)? 2'b00 : i_basis_r[29 -: 2];
result_w[7] = (i_basis_r[31 -: 2] == 2'b00)? 2'b00 : i_basis_r[31 -: 2];
basis_w[8] = 2'b00;
result_w[8] = 2'b00;
basis_w[9] = (i_basis_r[39 -: 2] == 2'b00)? 2'b00 : i_basis_r[37 -: 2];
result_w[9] = (i_basis_r[39 -: 2] == 2'b00)? 2'b00 : i_basis_r[39 -: 2];
basis_w[10] = (i_basis_r[43 -: 2] == 2'b00)? 2'b00 : i_basis_r[41 -: 2];
result_w[10] = (i_basis_r[43 -: 2] == 2'b00)? 2'b00 : i_basis_r[43 -: 2];
basis_w[11] = (i_basis_r[47 -: 2] == 2'b00)? 2'b00 : i_basis_r[45 -: 2];
result_w[11] = (i_basis_r[47 -: 2] == 2'b00)? 2'b00 : i_basis_r[47 -: 2];
basis_w[12] = (i_basis_r[51 -: 2] == 2'b00)? 2'b00 : i_basis_r[49 -: 2];
result_w[12] = (i_basis_r[51 -: 2] == 2'b00)? 2'b00 : i_basis_r[51 -: 2];
basis_w[13] = (i_basis_r[55 -: 2] == 2'b00)? 2'b00 : i_basis_r[53 -: 2];
result_w[13] = (i_basis_r[55 -: 2] == 2'b00)? 2'b00 : i_basis_r[55 -: 2];
basis_w[14] = (i_basis_r[59 -: 2] == 2'b00)? 2'b00 : i_basis_r[57 -: 2];
result_w[14] = (i_basis_r[59 -: 2] == 2'b00)? 2'b00 : i_basis_r[59 -: 2];
basis_w[15] = (i_basis_r[63 -: 2] == 2'b00)? 2'b00 : i_basis_r[61 -: 2];
result_w[15] = (i_basis_r[63 -: 2] == 2'b00)? 2'b00 : i_basis_r[63 -: 2];
basis_w[16] = (i_basis_r[67 -: 2] == 2'b00)? 2'b00 : i_basis_r[65 -: 2];
result_w[16] = (i_basis_r[67 -: 2] == 2'b00)? 2'b00 : i_basis_r[67 -: 2];
basis_w[17] = (i_basis_r[71 -: 2] == 2'b00)? 2'b00 : i_basis_r[69 -: 2];
result_w[17] = (i_basis_r[71 -: 2] == 2'b00)? 2'b00 : i_basis_r[71 -: 2];
basis_w[18] = (i_basis_r[75 -: 2] == 2'b00)? 2'b00 : i_basis_r[73 -: 2];
result_w[18] = (i_basis_r[75 -: 2] == 2'b00)? 2'b00 : i_basis_r[75 -: 2];
basis_w[19] = (i_basis_r[79 -: 2] == 2'b00)? 2'b00 : i_basis_r[77 -: 2];
result_w[19] = (i_basis_r[79 -: 2] == 2'b00)? 2'b00 : i_basis_r[79 -: 2];
basis_w[20] = (i_basis_r[83 -: 2] == 2'b00)? 2'b00 : i_basis_r[81 -: 2];
result_w[20] = (i_basis_r[83 -: 2] == 2'b00)? 2'b00 : i_basis_r[83 -: 2];
basis_w[21] = (i_basis_r[87 -: 2] == 2'b00)? 2'b00 : i_basis_r[85 -: 2];
result_w[21] = (i_basis_r[87 -: 2] == 2'b00)? 2'b00 : i_basis_r[87 -: 2];
basis_w[22] = 2'b00;
result_w[22] = 2'b00;
basis_w[23] = (i_basis_r[95 -: 2] == 2'b00)? 2'b00 : i_basis_r[93 -: 2];
result_w[23] = (i_basis_r[95 -: 2] == 2'b00)? 2'b00 : i_basis_r[95 -: 2];
basis_w[24] = (i_basis_r[99 -: 2] == 2'b00)? 2'b00 : i_basis_r[97 -: 2];
result_w[24] = (i_basis_r[99 -: 2] == 2'b00)? 2'b00 : i_basis_r[99 -: 2];
basis_w[25] = (i_basis_r[103 -: 2] == 2'b00)? 2'b00 : i_basis_r[101 -: 2];
result_w[25] = (i_basis_r[103 -: 2] == 2'b00)? 2'b00 : i_basis_r[103 -: 2];
basis_w[26] = 2'b00;
result_w[26] = 2'b00;
basis_w[27] = (i_basis_r[111 -: 2] == 2'b00)? 2'b00 : i_basis_r[109 -: 2];
result_w[27] = (i_basis_r[111 -: 2] == 2'b00)? 2'b00 : i_basis_r[111 -: 2];
basis_w[28] = (i_basis_r[115 -: 2] == 2'b00)? 2'b00 : i_basis_r[113 -: 2];
result_w[28] = (i_basis_r[115 -: 2] == 2'b00)? 2'b00 : i_basis_r[115 -: 2];
basis_w[29] = (i_basis_r[119 -: 2] == 2'b00)? 2'b00 : i_basis_r[117 -: 2];
result_w[29] = (i_basis_r[119 -: 2] == 2'b00)? 2'b00 : i_basis_r[119 -: 2];
basis_w[30] = (i_basis_r[35 -: 2] == 2'b00)? 2'b00 : i_basis_r[33 -: 2];
result_w[30] = (i_basis_r[35 -: 2] == 2'b00)? 2'b00 : i_basis_r[35 -: 2];
basis_w[31] = 2'b00;
result_w[31] = 2'b00;
basis_w[32] = (i_basis_r[91 -: 2] == 2'b00)? 2'b00 : i_basis_r[89 -: 2];
result_w[32] = (i_basis_r[91 -: 2] == 2'b00)? 2'b00 : i_basis_r[91 -: 2];
basis_w[33] = 2'b00;
result_w[33] = 2'b00;
basis_w[34] = (i_basis_r[107 -: 2] == 2'b00)? 2'b00 : i_basis_r[105 -: 2];
result_w[34] = (i_basis_r[107 -: 2] == 2'b00)? 2'b00 : i_basis_r[107 -: 2];
basis_w[35] = 2'b00;
result_w[35] = 2'b00;

        if (ready) begin
            setup_w = 1'b0;
            if (is_zero) begin
                o_k_w = `NUM_CUTS;
                o_a_w = 0;
                o_b_w = 0;
                o_finish_w = 1'b1;
                state_w = S_IDLE;
            end
            else begin
                o_k_w = `NUM_CUTS + measure_value;
                state_w = S_MEASURE;
            end
        end
    end
    S_MEASURE : begin
        back_setup_w = 1'b1;
//@1x
basis_w[0] = (i_basis_r[3 -: 2] == 2'b00)? i_basis_r[1 -: 2] : 2'b00;
result_w[0] = (i_basis_r[3 -: 2] == 2'b00)? i_basis_r[3 -: 2] : 2'b00;
basis_w[1] = (i_basis_r[7 -: 2] == 2'b00)? i_basis_r[5 -: 2] : 2'b00;
result_w[1] = (i_basis_r[7 -: 2] == 2'b00)? i_basis_r[7 -: 2] : 2'b00;
basis_w[2] = (i_basis_r[11 -: 2] == 2'b00)? i_basis_r[9 -: 2] : 2'b00;
result_w[2] = (i_basis_r[11 -: 2] == 2'b00)? i_basis_r[11 -: 2] : 2'b00;
basis_w[3] = (i_basis_r[15 -: 2] == 2'b00)? i_basis_r[13 -: 2] : 2'b00;
result_w[3] = (i_basis_r[15 -: 2] == 2'b00)? i_basis_r[15 -: 2] : 2'b00;
basis_w[4] = (i_basis_r[19 -: 2] == 2'b00)? i_basis_r[17 -: 2] : 2'b00;
result_w[4] = (i_basis_r[19 -: 2] == 2'b00)? i_basis_r[19 -: 2] : 2'b00;
basis_w[5] = (i_basis_r[23 -: 2] == 2'b00)? i_basis_r[21 -: 2] : 2'b00;
result_w[5] = (i_basis_r[23 -: 2] == 2'b00)? i_basis_r[23 -: 2] : 2'b00;
basis_w[6] = (i_basis_r[27 -: 2] == 2'b00)? i_basis_r[25 -: 2] : 2'b00;
result_w[6] = (i_basis_r[27 -: 2] == 2'b00)? i_basis_r[27 -: 2] : 2'b00;
basis_w[7] = (i_basis_r[31 -: 2] == 2'b00)? i_basis_r[29 -: 2] : 2'b00;
result_w[7] = (i_basis_r[31 -: 2] == 2'b00)? i_basis_r[31 -: 2] : 2'b00;
case (cnt_r[0])
	3'd0 : begin basis_w[8] = 2'b00; result_w[8] = 2'b00; end
	3'd1 : begin basis_w[8] = 2'b10; result_w[8] = 2'b00; end
	3'd2 : begin basis_w[8] = 2'b10; result_w[8] = 2'b00; end
	3'd3 : begin basis_w[8] = 2'b11; result_w[8] = 2'b00; end
	3'd4 : begin basis_w[8] = 2'b11; result_w[8] = 2'b00; end
	3'd5 : begin basis_w[8] = 2'b01; result_w[8] = 2'b00; end
	default : begin basis_w[8] = 2'b00; result_w[8] = 2'b00; end
endcase
basis_w[9] = (i_basis_r[39 -: 2] == 2'b00)? i_basis_r[37 -: 2] : 2'b00;
result_w[9] = (i_basis_r[39 -: 2] == 2'b00)? i_basis_r[39 -: 2] : 2'b00;
basis_w[10] = (i_basis_r[43 -: 2] == 2'b00)? i_basis_r[41 -: 2] : 2'b00;
result_w[10] = (i_basis_r[43 -: 2] == 2'b00)? i_basis_r[43 -: 2] : 2'b00;
basis_w[11] = (i_basis_r[47 -: 2] == 2'b00)? i_basis_r[45 -: 2] : 2'b00;
result_w[11] = (i_basis_r[47 -: 2] == 2'b00)? i_basis_r[47 -: 2] : 2'b00;
basis_w[12] = (i_basis_r[51 -: 2] == 2'b00)? i_basis_r[49 -: 2] : 2'b00;
result_w[12] = (i_basis_r[51 -: 2] == 2'b00)? i_basis_r[51 -: 2] : 2'b00;
basis_w[13] = (i_basis_r[55 -: 2] == 2'b00)? i_basis_r[53 -: 2] : 2'b00;
result_w[13] = (i_basis_r[55 -: 2] == 2'b00)? i_basis_r[55 -: 2] : 2'b00;
basis_w[14] = (i_basis_r[59 -: 2] == 2'b00)? i_basis_r[57 -: 2] : 2'b00;
result_w[14] = (i_basis_r[59 -: 2] == 2'b00)? i_basis_r[59 -: 2] : 2'b00;
basis_w[15] = (i_basis_r[63 -: 2] == 2'b00)? i_basis_r[61 -: 2] : 2'b00;
result_w[15] = (i_basis_r[63 -: 2] == 2'b00)? i_basis_r[63 -: 2] : 2'b00;
basis_w[16] = (i_basis_r[67 -: 2] == 2'b00)? i_basis_r[65 -: 2] : 2'b00;
result_w[16] = (i_basis_r[67 -: 2] == 2'b00)? i_basis_r[67 -: 2] : 2'b00;
basis_w[17] = (i_basis_r[71 -: 2] == 2'b00)? i_basis_r[69 -: 2] : 2'b00;
result_w[17] = (i_basis_r[71 -: 2] == 2'b00)? i_basis_r[71 -: 2] : 2'b00;
basis_w[18] = (i_basis_r[75 -: 2] == 2'b00)? i_basis_r[73 -: 2] : 2'b00;
result_w[18] = (i_basis_r[75 -: 2] == 2'b00)? i_basis_r[75 -: 2] : 2'b00;
basis_w[19] = (i_basis_r[79 -: 2] == 2'b00)? i_basis_r[77 -: 2] : 2'b00;
result_w[19] = (i_basis_r[79 -: 2] == 2'b00)? i_basis_r[79 -: 2] : 2'b00;
basis_w[20] = (i_basis_r[83 -: 2] == 2'b00)? i_basis_r[81 -: 2] : 2'b00;
result_w[20] = (i_basis_r[83 -: 2] == 2'b00)? i_basis_r[83 -: 2] : 2'b00;
basis_w[21] = (i_basis_r[87 -: 2] == 2'b00)? i_basis_r[85 -: 2] : 2'b00;
result_w[21] = (i_basis_r[87 -: 2] == 2'b00)? i_basis_r[87 -: 2] : 2'b00;
case (cnt_r[1])
	3'd0 : begin basis_w[22] = 2'b00; result_w[22] = 2'b00; end
	3'd1 : begin basis_w[22] = 2'b10; result_w[22] = 2'b00; end
	3'd2 : begin basis_w[22] = 2'b10; result_w[22] = 2'b00; end
	3'd3 : begin basis_w[22] = 2'b11; result_w[22] = 2'b00; end
	3'd4 : begin basis_w[22] = 2'b11; result_w[22] = 2'b00; end
	3'd5 : begin basis_w[22] = 2'b01; result_w[22] = 2'b00; end
	default : begin basis_w[22] = 2'b00; result_w[22] = 2'b00; end
endcase
basis_w[23] = (i_basis_r[95 -: 2] == 2'b00)? i_basis_r[93 -: 2] : 2'b00;
result_w[23] = (i_basis_r[95 -: 2] == 2'b00)? i_basis_r[95 -: 2] : 2'b00;
basis_w[24] = (i_basis_r[99 -: 2] == 2'b00)? i_basis_r[97 -: 2] : 2'b00;
result_w[24] = (i_basis_r[99 -: 2] == 2'b00)? i_basis_r[99 -: 2] : 2'b00;
basis_w[25] = (i_basis_r[103 -: 2] == 2'b00)? i_basis_r[101 -: 2] : 2'b00;
result_w[25] = (i_basis_r[103 -: 2] == 2'b00)? i_basis_r[103 -: 2] : 2'b00;
case (cnt_r[2])
	3'd0 : begin basis_w[26] = 2'b00; result_w[26] = 2'b00; end
	3'd1 : begin basis_w[26] = 2'b10; result_w[26] = 2'b00; end
	3'd2 : begin basis_w[26] = 2'b10; result_w[26] = 2'b00; end
	3'd3 : begin basis_w[26] = 2'b11; result_w[26] = 2'b00; end
	3'd4 : begin basis_w[26] = 2'b11; result_w[26] = 2'b00; end
	3'd5 : begin basis_w[26] = 2'b01; result_w[26] = 2'b00; end
	default : begin basis_w[26] = 2'b00; result_w[26] = 2'b00; end
endcase
basis_w[27] = (i_basis_r[111 -: 2] == 2'b00)? i_basis_r[109 -: 2] : 2'b00;
result_w[27] = (i_basis_r[111 -: 2] == 2'b00)? i_basis_r[111 -: 2] : 2'b00;
basis_w[28] = (i_basis_r[115 -: 2] == 2'b00)? i_basis_r[113 -: 2] : 2'b00;
result_w[28] = (i_basis_r[115 -: 2] == 2'b00)? i_basis_r[115 -: 2] : 2'b00;
basis_w[29] = (i_basis_r[119 -: 2] == 2'b00)? i_basis_r[117 -: 2] : 2'b00;
result_w[29] = (i_basis_r[119 -: 2] == 2'b00)? i_basis_r[119 -: 2] : 2'b00;
basis_w[30] = (i_basis_r[35 -: 2] == 2'b00)? i_basis_r[33 -: 2] : 2'b00;
result_w[30] = (i_basis_r[35 -: 2] == 2'b00)? i_basis_r[35 -: 2] : 2'b00;
case (cnt_r[0])
	3'd0 : begin basis_w[31] = 2'b00; result_w[31] = 2'b00; end
	3'd1 : begin basis_w[31] = 2'b10; result_w[31] = 2'b00; end
	3'd2 : begin basis_w[31] = 2'b11; result_w[31] = 2'b00; end
	3'd3 : begin basis_w[31] = 2'b11; result_w[31] = 2'b00; end
	3'd4 : begin basis_w[31] = 2'b10; result_w[31] = 2'b00; end
	3'd5 : begin basis_w[31] = 2'b01; result_w[31] = 2'b00; end
	default : begin basis_w[31] = 2'b00; result_w[31] = 2'b00; end
endcase
basis_w[32] = (i_basis_r[91 -: 2] == 2'b00)? i_basis_r[89 -: 2] : 2'b00;
result_w[32] = (i_basis_r[91 -: 2] == 2'b00)? i_basis_r[91 -: 2] : 2'b00;
case (cnt_r[1])
	3'd0 : begin basis_w[33] = 2'b00; result_w[33] = 2'b00; end
	3'd1 : begin basis_w[33] = 2'b10; result_w[33] = 2'b00; end
	3'd2 : begin basis_w[33] = 2'b11; result_w[33] = 2'b00; end
	3'd3 : begin basis_w[33] = 2'b11; result_w[33] = 2'b00; end
	3'd4 : begin basis_w[33] = 2'b10; result_w[33] = 2'b00; end
	3'd5 : begin basis_w[33] = 2'b01; result_w[33] = 2'b00; end
	default : begin basis_w[33] = 2'b00; result_w[33] = 2'b00; end
endcase
basis_w[34] = (i_basis_r[107 -: 2] == 2'b00)? i_basis_r[105 -: 2] : 2'b00;
result_w[34] = (i_basis_r[107 -: 2] == 2'b00)? i_basis_r[107 -: 2] : 2'b00;
case (cnt_r[2])
	3'd0 : begin basis_w[35] = 2'b00; result_w[35] = 2'b00; end
	3'd1 : begin basis_w[35] = 2'b10; result_w[35] = 2'b00; end
	3'd2 : begin basis_w[35] = 2'b11; result_w[35] = 2'b00; end
	3'd3 : begin basis_w[35] = 2'b11; result_w[35] = 2'b00; end
	3'd4 : begin basis_w[35] = 2'b10; result_w[35] = 2'b00; end
	3'd5 : begin basis_w[35] = 2'b01; result_w[35] = 2'b00; end
	default : begin basis_w[35] = 2'b00; result_w[35] = 2'b00; end
endcase

        if (ready) begin
            state_w = S_MULTI;
            multi_cnt_w = 4'd0;
            back_setup_w = 1'b0;
            o_temp_a_w = (is_zero)? 0 : (1<<(`NUM_CUTS - measure_value));
            if (is_neg) begin
                o_temp_a_w = -o_temp_a_w;
            end
            o_temp_b_w = 0;
        end
    end
    S_MULTI : begin
        multi_cnt_w = multi_cnt_r + 4'd1;
//@2
case (multi_cnt_r)
	4'd0 : begin
		//T 0
		case (cnt_r[0])
            3'd0 : begin
                o_temp_a_w = o_temp_a_r <<< 1;
                o_temp_b_w = o_temp_b_r <<< 1;
            end
            3'd1 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd2 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd3 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd4 : begin
                o_temp_a_w = o_temp_b_r <<< 1;
                o_temp_b_w = o_temp_a_r;
            end
            3'd5 : begin
                o_temp_a_w = -(o_temp_a_r <<< 1);
                o_temp_b_w = -(o_temp_b_r <<< 1);
            end
            default : begin
                o_temp_a_w = 0;
                o_temp_b_w = 0;
            end
        endcase	end
	4'd1 : begin
		//T 1
		case (cnt_r[1])
            3'd0 : begin
                o_temp_a_w = o_temp_a_r <<< 1;
                o_temp_b_w = o_temp_b_r <<< 1;
            end
            3'd1 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd2 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd3 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd4 : begin
                o_temp_a_w = o_temp_b_r <<< 1;
                o_temp_b_w = o_temp_a_r;
            end
            3'd5 : begin
                o_temp_a_w = -(o_temp_a_r <<< 1);
                o_temp_b_w = -(o_temp_b_r <<< 1);
            end
            default : begin
                o_temp_a_w = 0;
                o_temp_b_w = 0;
            end
        endcase	end
	4'd2 : begin
		//T 2
		case (cnt_r[2])
            3'd0 : begin
                o_temp_a_w = o_temp_a_r <<< 1;
                o_temp_b_w = o_temp_b_r <<< 1;
            end
            3'd1 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd2 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd3 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd4 : begin
                o_temp_a_w = o_temp_b_r <<< 1;
                o_temp_b_w = o_temp_a_r;
            end
            3'd5 : begin
                o_temp_a_w = -(o_temp_a_r <<< 1);
                o_temp_b_w = -(o_temp_b_r <<< 1);
            end
            default : begin
                o_temp_a_w = 0;
                o_temp_b_w = 0;
            end
        endcase	end
	4'd3 : begin
		o_a_w = o_a_r + o_temp_a_r;
		o_b_w = o_b_r + o_temp_b_r;
		state_w = S_MEASURE;
		// Update counter
		if (cnt_r[0] == 3'd5) begin
			cnt_w[0] = 3'd0;
			if (cnt_r[1] == 3'd5) begin
				cnt_w[1] = 3'd0;
				if (cnt_r[2] == 3'd5) begin
					cnt_w[2] = 3'd0;
					state_w = S_IDLE;
					o_finish_w = 1'b1;
				end
				else begin
					cnt_w[2] = cnt_r[2] + 3'd1;
				end
			end
			else begin
				cnt_w[1] = cnt_r[1] + 3'd1;
			end
		end
		else begin
			cnt_w[0] = cnt_r[0] + 3'd1;
		end
		multi_cnt_w = 4'd0;
	end
	default : begin
	end
endcase
    end
    default : begin
    end
    endcase
end

genvar j;

//@6

reg [2*`NUM_TOTAL_QUBITS - 1:0] flatten_basis;
reg [2*`NUM_TOTAL_QUBITS - 1:0] flatten_result;

always@(*) begin
    for (i=0;i<`NUM_TOTAL_QUBITS;i=i+1) begin
        flatten_basis[2*i +: 2] = basis_r[i];
        flatten_result[2*i +: 2] = result_r[i];
    end
end

measureClifford mc1(
    .i_clk(clk),
    .i_rst_n(rst_n),
    .i_basis(flatten_basis),
    .i_result(flatten_result),
    .i_setup(setup_r),
    .i_back_setup(back_setup_r),
    .o_value(measure_value),
    .o_is_zero(is_zero),
    .o_is_neg(is_neg),
    .o_ready(ready)
);

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i=0 ; i<`NUM_CUTS ; i = i+1) begin
            cnt_r[i] <= 3'd0;
        end
        state_r <= S_IDLE;
        multi_cnt_r <= 0;
        i_basis_r <= 0;
        setup_r <= 0;
        back_setup_r <= 0;
        for (i=0 ; i<`NUM_TOTAL_QUBITS;i = i+1) begin
            basis_r[i] <= 0;
            result_r[i] <= 0;
        end
//@8
        o_k_r <= 0;
        o_a_r <= 0;
        o_b_r <= 0;
        o_temp_a_r <= 0;
        o_temp_b_r <= 0;
        o_finish_r <= 0;
    end
    else begin
        for (i=0 ; i<`NUM_CUTS ; i = i+1) begin
            cnt_r[i] <= cnt_w[i];
        end
        state_r <= state_w;
        multi_cnt_r <= multi_cnt_w;
        i_basis_r <= i_basis_w;
        setup_r <= setup_w;
        back_setup_r <= back_setup_w;
        for (i=0 ; i<`NUM_TOTAL_QUBITS;i = i+1) begin
            basis_r[i] <= basis_w[i];
            result_r[i] <= result_w[i];
        end
//@9
        o_k_r <= o_k_w;
        o_a_r <= o_a_w;
        o_b_r <= o_b_w;
        o_temp_a_r <= o_temp_a_w;
        o_temp_b_r <= o_temp_b_w;
        o_finish_r <= o_finish_w;
    end
end

endmodule
