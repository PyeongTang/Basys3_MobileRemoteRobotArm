`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/15 09:24:44
// Design Name: 
// Module Name: tb_28BYJ_48
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


module tb_28BYJ_48();

reg i_clk   = 1'b0;
reg i_reset = 1'b0;
reg i_sw    = 1'b0;
reg i_btn   = 1'b0;
wire [3 : 0] o_phase;

    top_28BYJ_48            #(
        .DELAY_PER_STEP_US  (900)
    )                       DUT(
        .i_clk              (i_clk),
        .i_reset            (i_reset),
        .i_sw               (i_sw),
        .i_btn              (i_btn),
        .o_phase            (o_phase)
    );

    always #5 i_clk = ~i_clk;
    always #20000 i_btn = ~i_btn;

    initial begin
        @(posedge i_clk) i_reset = 1'b1;
        @(posedge i_clk) i_reset = 1'b0;

        #100 i_sw = 1;
    end

endmodule
