`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/16 19:46:02
// Design Name: 
// Module Name: tb_uart_rx
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


module tb_uart_rx();

reg i_clk       =   1'b0;
reg i_reset     =   1'b0;
reg i_data      =   1'b1;

wire [7 : 0] o_data;
wire o_valid;

    uart_rx                     DUT(
        .i_clk                  (i_clk),
        .i_reset                (i_reset),
        .i_data                 (i_data),
        .o_data                 (o_data),
        .o_valid                (o_valid)
    );

    always #5 i_clk = ~i_clk;
    initial begin
        @(posedge i_clk) i_reset = 1'b1;
        @(posedge i_clk) i_reset = 1'b0;

        // START BIT
        #104170 i_data = 1'b0;

        // A in ASCII : 0x41 : 0b 0100 0001
        #104170 i_data = 1'b1;
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b0;

        #104170 i_data = 1'b0;
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b1;
        #104170 i_data = 1'b0;
        
        // STOP BIT
        #104170 i_data = 1'b1;
        

        // START BIT
        #104170 i_data = 1'b0;

        // B in ASCII : 0x42 : 0b 0100 0010
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b1;
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b0;

        #104170 i_data = 1'b0;
        #104170 i_data = 1'b0;
        #104170 i_data = 1'b1;
        #104170 i_data = 1'b0;
        
        // STOP BIT
        #104170 i_data = 1'b1;
    end

endmodule
