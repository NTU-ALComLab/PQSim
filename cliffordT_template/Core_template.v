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
