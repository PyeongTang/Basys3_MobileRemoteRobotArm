`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 22:47:21
// Design Name: 
// Module Name: tb_clockDivider
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


module tb_clockDivider();

reg     i_clk       = 1'b0;
reg     i_reset     = 1'b0;
reg     i_en        = 1'b0;
wire    o_clk;

    clockDivider #(
        .COUNT_TH           (16'hC350)
    )   CLK_DIV_MILLIS      (
        .i_clk              (i_clk),
        .i_reset            (i_reset),
        .i_en               (i_en),
        .o_clk              (o_clk)
    );

    always #5 i_clk = ~i_clk;
    initial begin
        @(posedge i_clk) i_reset    =   1'b1;
        @(posedge i_clk) i_reset    =   1'b0;
        @(posedge i_clk) i_en       =   1'b1;
    end
    always @(posedge o_clk or negedge o_clk) begin
        #1000; $stop();
    end

endmodule
