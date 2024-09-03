`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 10:48:41
// Design Name: 
// Module Name: tb_timer
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


module tb_timer();

reg i_clk = 1'b0;
reg i_reset = 1'b0;
reg i_button = 1'b0;

wire i_time_out;
wire w_load;
wire w_enable;

wire [15 : 0] w_bcd;
wire [15 : 0] o_time_bcd;

wire [3 : 0] w_timer_state;

wire o_time_out;
wire o_led_enable;

    fanTimerControl             CTRL(
        .clk                    (i_clk),
        .reset_p                (i_reset),
        .time_set_change        (i_button),
        .timer_disable          (i_time_out),
        .state                  (w_timer_state),
        .bcd                    (w_bcd),
        .enable                 (w_enable),
        .load                   (w_load)
    );

    timer                       DUT(
        .i_clk                  (i_clk),
        .i_reset                (i_reset),
        .i_enable               (w_enable),
        .i_load                 (w_load),
        .i_time_bcd             (w_bcd),
        .o_time_bcd             (o_time_bcd),
        .o_time_out             (o_time_out),
        .o_led_enable           (o_led_enable)
    );

    assign i_time_out = o_time_out;

    always #5 i_clk = ~i_clk;
    initial begin
        @(posedge i_clk) i_reset = 1'b1;
        @(posedge i_clk) i_reset = 1'b0;
        @(posedge i_clk) i_button = 1'b1;
        @(posedge i_clk) i_button = 1'b0;
        wait(o_time_out);

        #1000;
        @(posedge i_clk) i_button = 1'b1;
        @(posedge i_clk) i_button = 1'b0;
        #1000;
        @(posedge i_clk) i_button = 1'b1;
        @(posedge i_clk) i_button = 1'b0;
        wait(o_time_out) $stop();
    end  

endmodule
