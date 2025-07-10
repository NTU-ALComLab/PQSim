`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/09/23 02:09:56
// Design Name:
// Module Name: uart
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

// Baud rate 115200
// 1 bit : 8680.555555... ns

`include "define.v"

module uart_rx(
    input wire clk,
    input wire rst_n,
    input wire RXD,
    output reg [7:0] data,
    output reg wr_en
);

reg [14:0] cnt;
reg flag;
reg rxd_r, rxd_rr;
wire rx_en;
reg [3:0] num;
reg [7:0] data_r;

always @ (posedge clk) rxd_r <= RXD;
always @ (posedge clk) rxd_rr <= rxd_r;

assign rx_en = (~rxd_r) & rxd_rr;

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0) 
        cnt <= 15'd0;
    else 
        if(flag) begin
            if(cnt == `uart_t - 1) 
                cnt <= 15'd0;
            else 
                cnt <= cnt + 1'b1;
        end
        else cnt <= 15'd0;
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        flag <= 1'b0;
    else 
        if(rx_en)
            flag <= 1'b1;
        else 
            if(num == 4'd10)
                flag <= 1'b0;
            else
                flag <= flag;
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        num <= 4'd0;
    else 
        if(cnt == `uart_t / 2 - 1)
            num <= num + 1'b1;
        else 
            if(num == 4'd10)
                num <= 4'd0;
            else
                num <= num;
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0) begin
        data_r <= 8'd0;
        data <= 8'd0;
    end
    else 
        if(cnt == `uart_t / 2 - 1)
            case(num)
            4'd0 : ;
            4'd1 : data_r[0] <= rxd_rr;
            4'd2 : data_r[1] <= rxd_rr;
            4'd3 : data_r[2] <= rxd_rr;
            4'd4 : data_r[3] <= rxd_rr;
            4'd5 : data_r[4] <= rxd_rr;
            4'd6 : data_r[5] <= rxd_rr;
            4'd7 : data_r[6] <= rxd_rr;
            4'd8 : data_r[7] <= rxd_rr;
            4'd9 : data <= data_r;
            default : data <= data;
            endcase
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        wr_en <= 1'b0;
    else 
        if(num == 4'd10)
            wr_en <= 1'b1;
        else
            wr_en <= 1'b0;
end

endmodule

module uart_tx(
    input wire clk,
    input wire rst_n,
    input wire empty,
    input wire [7:0] data,
    output wire rd_en,
    output reg TXD
);

reg [14:0] cnt;
reg flag;
reg [3:0] num;

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        cnt <= 15'd0;
    else 
        if(flag) begin
            if(cnt == `uart_t - 1)
                cnt <= 15'd0;
            else 
                cnt <= cnt + 1'b1;
        end
        else
            cnt <= 15'd0;
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        flag <= 1'b0;
    else 
        if(empty == 1'b0)
            flag <= 1'b1;
        else 
            if(num == 4'd10)
                flag <= 1'b0;
            else
                flag <= flag;
end

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        num <= 4'd0;
    else 
        if(cnt == `uart_t / 2 - 1)
            num <= num + 1'b1;
        else 
            if(num == 4'd10)
                num <= 4'd0;
            else
                num <= num;
end

assign rd_en = (num == 4'd0 && cnt == 15'd1) ? 1'b1 : 1'b0;

always @ (posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0)
        TXD <= 1'b1;
    else 
        if(cnt == `uart_t / 2 - 1)
            case(num)
            4'd0 : TXD <= 1'b0;
            4'd1 : TXD <= data[0];
            4'd2 : TXD <= data[1];
            4'd3 : TXD <= data[2];
            4'd4 : TXD <= data[3];
            4'd5 : TXD <= data[4];
            4'd6 : TXD <= data[5];
            4'd7 : TXD <= data[6];
            4'd8 : TXD <= data[7];
            4'd9 : TXD <= 1'b1;
            default : TXD <= 1'b1;
            endcase
end

endmodule
