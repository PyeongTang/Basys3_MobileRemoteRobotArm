`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/03 10:01:48
// Design Name: 
// Module Name: tb_dubble_dabble
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


module tb_dubble_dabble();

reg              i_clk       =   1'b0;
reg              i_reset     =   1'b0;
reg              i_start     =   1'b0;
reg  [7 : 0]     i_data_bin  =   8'h00;
wire [11 : 0]    o_data_bcd;

    dubble_dabble           DUT(
        .i_clk              (i_clk),
        .i_reset            (i_reset),
        .i_start            (i_start),
        .i_data_bin         (i_data_bin),
        .o_data_bcd         (o_data_bcd)
    );

    always #5 i_clk = ~i_clk;
    initial begin
        i_data_bin = 8'h19;
    end


endmodule
