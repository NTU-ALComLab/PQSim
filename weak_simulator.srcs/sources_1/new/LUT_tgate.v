`timescale 1ns / 1ps

`include "define.v"

module LUT_tgate(
    input i_clk,
    input i_rst_n,
    input [3:0] i_state,
    input [3:0] i_basis,
    output signed [3:0] o_a_value,
    output signed [3:0] o_b_value
);

reg [3:0] o_a_value_r, o_a_value_w;
reg [3:0] o_b_value_r, o_b_value_w;

assign o_a_value = o_a_value_r;
assign o_b_value = o_b_value_r;

always@(*) begin
    case({i_state,i_basis})
        {`value_0, `value_0}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_0, `value_1}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_0, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_0, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_0, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_0, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_0, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_0, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_0, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_0, `value_Z}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_1, `value_0}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_1, `value_1}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_1, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_1, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_1, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_1, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_1, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_1, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_1, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_1, `value_Z}: begin o_a_value_w = -4'd4; o_b_value_w = 4'd0; end
        {`value_p, `value_0}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_p, `value_1}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_p, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_p, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_p, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_p, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_p, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_p, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd2; end
        {`value_p, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd2; end
        {`value_p, `value_Z}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_m, `value_0}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_m, `value_1}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_m, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_m, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_m, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_m, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_m, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_m, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = -4'd2; end
        {`value_m, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = -4'd2; end
        {`value_m, `value_Z}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_i, `value_0}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_i, `value_1}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_i, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_i, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_i, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_i, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_i, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_i, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = -4'd2; end
        {`value_i, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd2; end
        {`value_i, `value_Z}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        {`value_j, `value_0}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_j, `value_1}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd0; end
        {`value_j, `value_p}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_j, `value_m}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_j, `value_i}: begin o_a_value_w = 4'd2; o_b_value_w = -4'd1; end
        {`value_j, `value_j}: begin o_a_value_w = 4'd2; o_b_value_w = 4'd1; end
        {`value_j, `value_I}: begin o_a_value_w = 4'd4; o_b_value_w = 4'd0; end
        {`value_j, `value_X}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd2; end
        {`value_j, `value_Y}: begin o_a_value_w = 4'd0; o_b_value_w = -4'd2; end
        {`value_j, `value_Z}: begin o_a_value_w = 4'd0; o_b_value_w = 4'd0; end
        default : begin o_a_value_w = 0; o_b_value_w = 0; end
    endcase
end

always@(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        o_a_value_r <= 0;
        o_b_value_r <= 0;
    end
    else begin
        o_a_value_r <= o_a_value_w;
        o_b_value_r <= o_b_value_w;
    end
end

endmodule