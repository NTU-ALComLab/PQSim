`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/25 16:43:41
// Design Name: 
// Module Name: testfixture
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


module testfixture(
);

reg clk;
reg rst_n;
reg RXD;
reg TXD;

localparam CLK_PERIOD = 10;
localparam RST_T = 3;

initial clk = 1'b0;
always #(CLK_PERIOD/2.0)
    clk = ~clk;

initial begin
    rst_n = 1'b1;
    #(RST_T); rst_n = 1'b0;
    #(CLK_PERIOD/2.0); rst_n = 1'b1;
end

integer i;

parameter data = 40'b1001_1001_1001_1001_1001_1001_1001_1001_1001_1001;

reg [4:0] cnt, cnt2;

initial begin
    RXD = 1'b1;
    cnt = 0;
    #(8*CLK_PERIOD/2.0);
    while (cnt != 5) begin
        cnt2 = 0;
        while (cnt2 != 10) begin
            if (cnt2 == 0) RXD = 0;
            else begin if (cnt2 == 4'd9) RXD = 1;
            else RXD = data[8*cnt + cnt2 - 1];
            end
            #(8680);
            cnt2 = cnt2 + 1;
        end
        #(100000);
        cnt = cnt + 1;
    end
end
    
mainDesign_wrapper mw1(
    .CLK100MHZ(clk),
    .RXD(RXD),
    .TXD(TXD),
    .SW_rst_n(rst_n)
);

endmodule
