`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/26 15:45:03
// Design Name: 
// Module Name: tb_stopWatch
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


module tb_stopWatch();

reg i_clk               =       1'b0;
reg i_reset             =       1'b0;

reg i_btn_c_start       =       1'b0;
reg i_btn_u_stop        =       1'b0;
reg i_btn_r_rep         =       1'b0;
reg i_btn_d_show_rep    =       1'b0;
reg [15 : 0] i_sw       =       16'h0000;

wire [7 : 0] o_fnd;
wire [3 : 0] o_fnd_sel;

    StopWatch   DUT(
        .i_clk              (i_clk),
        .i_reset            (i_reset),
        .i_btn_c_start      (i_btn_c_start),
        .i_btn_u_stop       (i_btn_u_stop),
        .i_btn_r_rep        (i_btn_r_rep),
        .i_btn_d_show_rep   (i_btn_d_show_rep),
        .i_sw               (i_sw),
        .o_fnd              (o_fnd),
        .o_fnd_sel          (o_fnd_sel)
    );

always #5 i_clk = ~i_clk;
initial begin
    @(posedge i_clk) i_reset = 1'b1;
    @(posedge i_clk) i_reset = 1'b0;
    @(posedge i_clk) i_btn_c_start = 1'b1;
end

endmodule
