`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/20 09:29:55
// Design Name: 
// Module Name: tb_manipulatorSolver
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


module tb_manipulatorSolver();

localparam  [7 : 0] COORD_X_END = 20;
localparam  [7 : 0] COORD_Y_END = 20;

reg i_clk = 1'b0;
reg i_reset = 1'b0;

reg [7 : 0] i_coord_x = 8'h0;
reg [7 : 0] i_coord_y = 8'h0;

wire signed [31 : 0] w_q_theta_1;
wire signed [31 : 0] w_q_theta_2;

wire [11 : 0] o_duty_1;
wire [11 : 0] o_duty_2;

    manipulatorSolver       DUT(
        .i_clk              (i_clk),
        .i_reset            (i_reset),
        .i_coord_x          (i_coord_x),
        .i_coord_y          (i_coord_y),
        .o_q_theta_1        (w_q_theta_1),
        .o_q_theta_2        (w_q_theta_2)
    );

    SG90_angle2Duty         THETA_1_TO_DUTY(
        .i_q_theta          (w_q_theta_1),
        .o_duty             (o_duty_1)
    );

    SG90_angle2Duty         THETA_2_TO_DUTY(
        .i_q_theta          (w_q_theta_2),
        .o_duty             (o_duty_2)
    );

    always #5 i_clk = ~i_clk;
    initial begin
        @(posedge i_clk) i_reset = 1'b1;
        @(posedge i_clk) i_reset = 1'b0;
    end

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            i_coord_x   <=  0;
            i_coord_y   <=  0;
        end
        else begin
            if ((i_coord_x*i_coord_x + i_coord_y*i_coord_y) >= 400) begin
                i_coord_x <= 0;
                if (i_coord_y <= 20 - 1) begin
                    i_coord_y <= i_coord_y + 1;
                end
                else begin
                    i_coord_y <= 0;
                end
            end
            else begin
                i_coord_x <= i_coord_x + 1;
            end
        end
    end

    always @(posedge i_clk) begin
        if ((i_coord_x*i_coord_x + i_coord_y*i_coord_y) < 400) begin
            // $display("X : %d\tY : %d\tY / X : %d\tARCT2 : %d", i_coord_x, i_coord_y, DUT.w_arctan_y_over_x, DUT.w_arctan_T2);
            // $display("%d", DUT.w_q_y_over_x);
            // $display("%d", DUT.w_T2);
        end
        else if (i_coord_y == 20) begin
            $stop();
        end
    end

endmodule
