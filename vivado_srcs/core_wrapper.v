`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/09/24 00:40:05
// Design Name:
// Module Name: core_wrapper
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

module core_wrapper(
    input clk,
    input rst_n,
    input wire [7:0] i_data,
    input wire i_rd_en,
    input wire i_empty,
    output wire [7:0] o_data,
    output wire o_empty,
    output wire o_rd_en
    );

reg [`MAX_INPUT_BITS - 1:0] whole_i_data_r, whole_i_data_w;
reg [`MAX_OUTPUT_BITS_2 + `MAX_OUTPUT_BITS_1 - 1:0] whole_o_data_r, whole_o_data_w;
reg ready_r, ready_w;

reg [1:0] state_r, state_w;
reg [$clog2((`MAX_INPUT_BITS + `MAX_OUTPUT_BITS_2 + `MAX_OUTPUT_BITS_1)/8): 0] cnt_r, cnt_w;

localparam S_READ = 2'd0;
localparam S_CORE = 2'd1;
localparam S_WRITE = 2'd2;

reg [7:0] o_data_r, o_data_w;
reg o_rd_en_r, o_rd_en_w;
reg o_empty_r, o_empty_w;
reg flag_r, flag_w;

assign o_data = o_data_r;
assign o_rd_en = o_rd_en_r;
assign o_empty = o_empty_r;

wire [`MAX_OUTPUT_BITS_2 + `MAX_OUTPUT_BITS_1 - 1:0] whole_o_data;
wire finish;

always@(*) begin
    whole_i_data_w = whole_i_data_r;
    whole_o_data_w = whole_o_data_r;
    ready_w = ready_r;
    state_w = state_r;
    cnt_w = cnt_r;
    o_data_w = o_data_r;
    o_rd_en_w = o_rd_en_r;
    o_empty_w = o_empty_r;
    flag_w = flag_r;

    case(state_r)
        S_READ: begin
            if (cnt_r == `MAX_INPUT_BITS / 8) begin
                state_w = S_CORE;
                ready_w = 1'b1;
                cnt_w = 0;
            end
            else begin
                if (!i_empty) begin
                    if (!o_rd_en_r) begin
                        o_rd_en_w = 1'b1;
                    end
                    else begin
                        flag_w = 1'b1;
                        o_rd_en_w = 1'b0;
                    end
                end
                else begin
                    if (flag_r) begin
                        cnt_w = cnt_r + 1;
                        whole_i_data_w[8*cnt_r +: 8] = i_data;
                        flag_w = 1'b0;
                    end
                end
            end
        end
        S_CORE: begin
            ready_w = 1'b0;
            if (finish) begin
                state_w = S_WRITE;
                whole_o_data_w = whole_o_data;
                o_empty_w = 1'b0;
            end
        end
        S_WRITE: begin
            if (cnt_r == ((`MAX_OUTPUT_BITS_2 + `MAX_OUTPUT_BITS_1) / 8)) begin
                state_w = S_READ;
                cnt_w = 0;
                o_empty_w = 1'b1;
            end
            else begin
                if (i_rd_en) begin
                    cnt_w = cnt_r + 1'd1;
                    o_data_w = whole_o_data_r[8*cnt_r +: 8];
                end
            end
        end
        default: begin
        end
    endcase
end

Core core1(
    .clk(clk),
    .rst_n(rst_n),
    .i_basis(whole_i_data_r),
    .i_data_ready(ready_r),
    .o_data_all(whole_o_data),
    .o_finish(finish)
);

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        whole_i_data_r <= 0;
        whole_o_data_r <= 0;
        ready_r <= 1'b0;
        state_r <= S_READ;
        cnt_r <= 0;
        o_data_r <= 0;
        o_rd_en_r <= 1'b0;
        o_empty_r <= 1'b1;
        flag_r <= 1'b0;
    end
    else begin
        whole_i_data_r <= whole_i_data_w;
        whole_o_data_r <= whole_o_data_w;
        ready_r <= ready_w;
        state_r <= state_w;
        cnt_r <= cnt_w;
        o_data_r <= o_data_w;
        o_rd_en_r <= o_rd_en_w;
        o_empty_r <= o_empty_w;
        flag_r <= flag_w;
    end
end
endmodule

/*
module exCore(
    input wire clk,
    input wire rst_n,
    input wire [`MAX_INPUT_BITS - 1:0] i_data,
    input wire i_ready,
    output wire [`MAX_OUTPUT_BITS - 1:0] o_data,
    output wire o_finish
    );

reg [`MAX_OUTPUT_BITS - 1:0] o_data_r, o_data_w;
reg o_finish_r, o_finish_w;

reg [1:0] state_r, state_w;

assign o_data = o_data_r;
assign o_finish = o_finish_r;

integer i;

always@(*) begin
    o_data_w = o_data_r;
    o_finish_w = o_finish_r;
    state_w = state_r;
    case(state_r)
        2'd0: begin
            o_finish_w = 1'b0;
            if (i_ready) begin
                state_w = 2'd1;
            end
        end
        2'd1: begin
            for(i=0;i<`MAX_INPUT_BITS;i=i+1) begin
                o_data_w[i] = i_data[`MAX_INPUT_BITS - 1 - i];
            end
            o_data_w[71:64] = 8'hAA;
            state_w = 2'd2;
        end
        2'd2 : begin
            o_finish_w = 1'b1;
            state_w = 2'd0;
        end
        default : begin
        end
    endcase
end

always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        o_data_r <= 0;
        o_finish_r <= 1'b0;
        state_r <= 2'd0;
    end
    else begin
        o_data_r <= o_data_w;
        o_finish_r <= o_finish_w;
        state_r <= state_w;
    end
end
endmodule
*/