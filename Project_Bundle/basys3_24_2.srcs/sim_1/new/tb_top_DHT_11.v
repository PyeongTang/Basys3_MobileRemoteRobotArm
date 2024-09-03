`timescale 1ns / 1ps

module tb_top_DHT_11();

    reg     i_clk                   =       1'b0;
    reg     i_reset                 =       1'b1;

    tri1    io_data;
    reg     r_data                  =       1'b0;
    reg     r_wr                    =       1'b0;

    wire    [7 : 0] o_humidity;
    wire    [7 : 0] o_temperature;

    reg     [7 : 0] r_DHT_humidity      =       8'd80;
    reg     [7 : 0] r_DHT_temperature   =       8'd25;
    reg     [7 : 0] r_DHT_check_sum;
    reg     [39 :0] r_DHT_5byte_value;

    DHT11_Control                   DUT(
        .i_clk                      (i_clk),
        .i_reset                    (i_reset),
        .io_data                    (io_data),
        .o_humidity                 (o_humidity),
        .o_temperature              (o_temperature),
        .o_state_led                (),
        .o_read_state_led           ()
    );

    always #5 i_clk = ~i_clk;

    initial begin
        @(posedge i_clk) i_reset = 1'b0;
        wait(!io_data);
    end

    initial begin
        r_DHT_check_sum = r_DHT_humidity + r_DHT_temperature;
        r_DHT_5byte_value = {r_DHT_humidity, 8'h00, r_DHT_temperature, 8'h00};
    end

    assign io_data = (r_wr) ? (r_data) : (1'bz);

endmodule
