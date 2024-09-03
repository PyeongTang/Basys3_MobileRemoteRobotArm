`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////
module fndControl(
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire        [15 : 0]    i_value,
    output      wire        [7 : 0]     o_fnd,
    output      wire        [3 : 0]     o_fnd_sel
);

    reg     [3 : 0]                     r_hex_value;
    wire    [3 : 0]                     w_hex_value;
    
    decoder7Seg                         FND_VALUE(
        .i_hex_value                    (w_hex_value),
        .o_fnd_value                    (o_fnd)
    );

    ringCounterFnd                      FND_SELECT(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_fnd_sel                      (o_fnd_sel)
    );
    
    always @(posedge i_clk)begin
        case(o_fnd_sel)
            4'b1110 : r_hex_value <= i_value[3   :   0];
            4'b1101 : r_hex_value <= i_value[7   :   4];
            4'b1011 : r_hex_value <= i_value[11  :   8];
            4'b0111 : r_hex_value <= i_value[15  :   12];
        endcase
    end

    assign w_hex_value = r_hex_value;
    
endmodule
///////////////////////////////////////////////////////////////////////////
module buttonControl(
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_btn,
    output      wire                    o_btn_posedge,
    output      wire                    o_btn_negedge
);
    
    reg     [16 : 0]                    r_delay_counter;
    wire                                r_delay_counter_posedge;

    reg                                 r_debounced_btn;
    wire                                w_debounced_btn;
    
    edge_detector_n_LJH                    ED_DELAY_COUNTER(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset), 
        .i_cp                           (r_delay_counter[16]),
        .o_posedge                      (r_delay_counter_posedge),
        .o_negedge                      ()
    );
    
    edge_detector_n_LJH                     ED_BTN(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (w_debounced_btn), 
        .o_posedge                      (o_btn_posedge),
        .o_negedge                      (o_btn_negedge)
    );

    always @(posedge i_clk) begin
       r_delay_counter <= r_delay_counter + 1; 
    end
        
    always @(posedge i_clk or posedge i_reset)begin
        if (i_reset) begin
            r_debounced_btn <= 0;
        end
        else if (r_delay_counter_posedge) begin
            r_debounced_btn <= i_btn;
        end
    end

    assign w_debounced_btn = r_debounced_btn;

endmodule
///////////////////////////////////////////////////////////////////////////
module keyPadControl (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire        [3 : 0]     i_row,
    output      wire        [3 : 0]     o_col,
    output      wire        [3 : 0]     o_key_value,
    output      wire                    o_key_valid
);
    reg     [3 : 0]                     r_col;
    reg     [3 : 0]                     r_key_value;
    reg                                 r_key_valid;

    // Delay for Debouncing
    reg     [19 : 0]                    r_delay_counter;
    wire                                w_delayed_clk;
    wire                                w_delayed_clk_posedge;
    wire                                w_delayed_clk_negedge;

    // State Machine
    reg     [2 : 0]                     present_state;
    reg     [2 : 0]                     next_state;

    localparam [2 : 0]                  SCAN_0001    =   3'h0;
    localparam [2 : 0]                  SCAN_0010    =   3'h1;
    localparam [2 : 0]                  SCAN_0100    =   3'h2;
    localparam [2 : 0]                  SCAN_1000    =   3'h3;
    localparam [2 : 0]                  KEY_PROCESS  =   3'h4;

    edge_detector_n                     ED_WIRE_DELAYED_CLK(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (w_delayed_clk),
        .o_posedge                      (w_delayed_clk_posedge),
        .o_negedge                      (w_delayed_clk_negedge)
    );
    
    // Delay
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_delay_counter <= 0;
        end
        else begin
            r_delay_counter <= r_delay_counter + 1;
        end
    end
    /////////////////////////////////////////////////////////////////////

    // FSM
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            present_state <= SCAN_0001;
        end
        else if (w_delayed_clk_posedge) begin
            present_state <= next_state;
        end
    end

    always @(*) begin
        if (i_reset) begin
            next_state = SCAN_0001;
        end
        else begin
            case (present_state)
                SCAN_0001    : begin
                    if (i_row == 0) begin
                        next_state = SCAN_0010;
                    end 
                    else begin
                        next_state = KEY_PROCESS;
                    end
                end
            
                SCAN_0010    : begin
                    if (i_row == 0) begin
                        next_state = SCAN_0100;
                    end 
                    else begin
                        next_state = KEY_PROCESS;
                    end
                end
            
                SCAN_0100    : begin
                    if (i_row == 0) begin
                        next_state = SCAN_1000;
                    end 
                    else begin
                        next_state = KEY_PROCESS;
                    end
                end
            
                SCAN_1000    : begin
                    if (i_row == 0) begin
                        next_state = SCAN_0001;
                    end 
                    else begin
                        next_state = KEY_PROCESS;
                    end
                end
            
                KEY_PROCESS    : begin
                    if (i_row == 0) begin
                        next_state = SCAN_0001;
                    end 
                    else begin
                        next_state = KEY_PROCESS;
                    end
                end

                default: begin
                    next_state = SCAN_0001;
                end
            endcase
        end
    end

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_col       <= 4'b0001;
            r_key_value <= 4'h0;
            r_key_valid <= 1'b0;
        end
        else if (w_delayed_clk_negedge) begin
            case (present_state)
                SCAN_0001    : begin r_col <= 4'b0001; r_key_valid <= 1'b0;  end
                SCAN_0010    : begin r_col <= 4'b0010; r_key_valid <= 1'b0;  end
                SCAN_0100    : begin r_col <= 4'b0100; r_key_valid <= 1'b0;  end
                SCAN_1000    : begin r_col <= 4'b1000; r_key_valid <= 1'b0;  end
                KEY_PROCESS  : begin r_col <= r_col;   r_key_valid <= 1'b1;
                    case ({r_col, i_row})
                        8'b0001_0001 : r_key_value <= 4'h0;
                        8'b0010_0001 : r_key_value <= 4'h1;
                        8'b0100_0001 : r_key_value <= 4'h2;
                        8'b1000_0001 : r_key_value <= 4'h3;
                        8'b0001_0010 : r_key_value <= 4'h4;
                        8'b0010_0010 : r_key_value <= 4'h5;
                        8'b0100_0010 : r_key_value <= 4'h6;
                        8'b1000_0010 : r_key_value <= 4'h7;
                        8'b0001_0100 : r_key_value <= 4'h8;
                        8'b0010_0100 : r_key_value <= 4'h9;
                        8'b0100_0100 : r_key_value <= 4'hA;
                        8'b1000_0100 : r_key_value <= 4'hB; 
                        8'b0001_1000 : r_key_value <= 4'hC;
                        8'b0010_1000 : r_key_value <= 4'hD;
                        8'b0100_1000 : r_key_value <= 4'hE;
                        8'b1000_1000 : r_key_value <= 4'hF;
                    endcase
                end
            endcase
        end
    end
    /////////////////////////////////////////////////////////////////////

    assign w_delayed_clk    =   r_delay_counter[17];
    assign o_col            =   r_col;
    assign o_key_value      =   r_key_value;
    assign o_key_valid      =   r_key_valid;

endmodule
////////////////////////////////////////////////////////////////////////////////
module DHT11_Control (
    input       wire                    i_clk,
    input       wire                    i_reset,
    inout       wire                    io_data,
    output      wire        [7 : 0]     o_humidity,
    output      wire        [7 : 0]     o_temperature,
    output      wire        [6 : 0]     o_state_led,
    output      wire        [1 : 0]     o_read_state_led
);

    localparam  [22 : 0]                IDLE_DELAY             =   23'd3_000_000;
    localparam  [22 : 0]                MCU_SEND_OUT_DELAY     =   23'd18_000;
    localparam  [22 : 0]                DHT_TIME_OUT           =   23'd100_000;

    localparam  [6 : 0]                 IDLE                    =   7'b000_0001;
    localparam  [6 : 0]                 MCU_SEND_OUT            =   7'b000_0010;
    localparam  [6 : 0]                 MCU_PULLS_UP            =   7'b000_0100;
    localparam  [6 : 0]                 DHT_SEND_OUT            =   7'b000_1000;
    localparam  [6 : 0]                 DHT_PULLS_UP            =   7'b001_0000;
    localparam  [6 : 0]                 MCU_READ_DATA           =   7'b010_0000;
    localparam  [6 : 0]                 DONE                    =   7'b100_0000;

    localparam  [1 : 0]                 MCU_WAIT_POSEDGE        =   2'b01;
    localparam  [1 : 0]                 MCU_WAIT_NEGEDGE        =   2'b10;

    reg     [6 : 0]                     present_state;
    reg     [6 : 0]                     next_state;
    reg     [1 : 0]                     read_state;

    reg     [7 : 0]                     r_humidity;
    reg     [7 : 0]                     r_temperature;

    reg     [22 : 0]                    r_count_usec;
    reg                                 r_en_count_usec;

    wire                                w_tick_usec_posedge;

    reg     [5 : 0]                     r_count_data;
    reg     [39 : 0]                    r_byte_data;
    reg                                 r_data;

    wire                                w_DHT_data_posedge;
    wire                                w_DHT_data_negedge;

    clock_div_100                       CLK_DIV_US(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_cp                           (),
        .o_tick_posedge                 (w_tick_usec_posedge),
        .o_tick_negedge                 ()
    );

    edge_detector_n                     ED_INPUT_DHT11_DATA(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (io_data),
        .o_posedge                      (w_DHT_data_posedge),
        .o_negedge                      (w_DHT_data_negedge)
    );

    // present_state
    // Clock Polarity : Negedge
    // To ensure state transition (at posedge)
    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            present_state <= IDLE;
        end
        else begin
            present_state <= next_state;
        end
    end
    
    // r_count_usec
    // Clock Polarity : Negedge
    // To ensure clear counter (conditioned at posedge)
    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_count_usec = 0;
        end
        else if (w_tick_usec_posedge && r_en_count_usec) begin
            r_count_usec = r_count_usec + 1;
        end
        else if (!r_en_count_usec) begin
            r_count_usec = 0;
        end
    end

    // next_state
    // read_state
    // r_count_data
    // r_data
    // r_en_count_usec
    // r_humidity
    // r_temperature
    // r_byte_data
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            next_state          =      IDLE;
            read_state          =      MCU_WAIT_POSEDGE;

            r_data              =      1'bz;
            r_en_count_usec     =      0;
            
            r_humidity          =      0;
            r_temperature       =      0;
            
            r_count_data        =      0;
            r_byte_data         =      0;
        end
        else begin
            case (present_state)
            
                IDLE                :   begin
                    if (r_count_usec < IDLE_DELAY) begin
                        // Same as pulled up ('bz)
                        r_data              =      1'b1;
                        r_en_count_usec     =      1;
                    end
                    else begin
                        next_state          =      MCU_SEND_OUT;
                        r_data              =      1'b0;
                        r_en_count_usec     =      0;
                    end
                end

                MCU_SEND_OUT    :   begin
                    if (r_count_usec < MCU_SEND_OUT_DELAY) begin
                        r_data              =      1'b0;
                        r_en_count_usec     =      1;
                    end
                    else begin
                        next_state          =      MCU_PULLS_UP;
                        r_en_count_usec     =      0;
                        r_data              =      1'bz;
                    end
                end

                MCU_PULLS_UP   :   begin
                    r_en_count_usec     =      1;
                    // Escape when Inf Looping
                    if (r_count_usec > DHT_TIME_OUT) begin
                        next_state          =      IDLE;
                        r_en_count_usec     =      0;
                    end
                    if (w_DHT_data_negedge) begin
                        next_state          =      DHT_SEND_OUT;
                        r_en_count_usec     =      0;
                    end
                end

                DHT_SEND_OUT    :    begin
                    r_en_count_usec     =      1;
                    // Escape when Inf Looping
                    if (r_count_usec > DHT_TIME_OUT) begin
                        next_state          =      IDLE;
                        r_en_count_usec     =      0;
                    end
                    if (w_DHT_data_posedge) begin
                        next_state          =      DHT_PULLS_UP;
                        r_data              =      1'bz;
                        r_en_count_usec     =      0;
                    end
                end

                DHT_PULLS_UP   :   begin
                    r_en_count_usec     =      1;
                    // Escape when Inf Looping
                    if (r_count_usec > DHT_TIME_OUT) begin
                        next_state          =      IDLE;
                        r_en_count_usec     =      0;
                    end
                    if (w_DHT_data_negedge) begin
                        next_state          =      MCU_READ_DATA;
                        r_data              =      1'bz;
                        r_en_count_usec     =      0;
                    end
                end

                MCU_READ_DATA       :   begin
                    case (read_state)
                        MCU_WAIT_POSEDGE    : begin
                            if (w_DHT_data_posedge) begin
                                read_state          =      MCU_WAIT_NEGEDGE;
                            end
                            else begin
                                r_en_count_usec     =      0;
                            end
                        end

                        MCU_WAIT_NEGEDGE    : begin
                            if (w_DHT_data_negedge) begin
                                if (r_count_usec < 23'd45) begin
                                    r_byte_data     =      {r_byte_data[38 : 0], 1'b0};
                                end
                                else begin
                                    r_byte_data     =      {r_byte_data[38 : 0], 1'b1};
                                end
                                r_count_data        =      r_count_data + 1;

                                if (r_count_data >= 6'd40) begin
                                    r_count_data    =      0;
                                    next_state      =      DONE;
                                    r_humidity      =      r_byte_data[39 -: 8];
                                    r_temperature   =      r_byte_data[23 -: 8];
                                end
                                else begin
                                    next_state      =      MCU_READ_DATA;
                                end
                                read_state          =      MCU_WAIT_POSEDGE;
                            end
                            else begin
                                r_en_count_usec     =      1;
                            end
                            if (r_count_usec > DHT_TIME_OUT) begin
                                next_state          =       IDLE;
                                r_en_count_usec     =       0;
                                read_state          =      MCU_WAIT_POSEDGE;
                            end
                        end
                    endcase
                end

                DONE                :   begin
                    next_state          =      IDLE;
                end

                default             :   begin
                    next_state          =      IDLE;
                end
            endcase
        end
    end

    assign io_data              =       r_data;
    assign o_humidity           =       r_humidity;
    assign o_temperature        =       r_temperature;
    assign o_state_led          =       present_state;
    assign o_read_state_led     =       read_state;

endmodule
////////////////////////////////////////////////////////////////////////////////
module HC_SR04_Control (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_enable,
    input       wire                    i_echo,
    output      wire                    o_trigger,
    output      wire        [8 : 0]     o_distance
);
    // For Debugging
    // output      wire        [2 : 0]     o_state_led,
    // output      wire        [1 : 0]     o_read_state_led

    parameter                           IDLE_DELAY          =       32'd500_000;
    parameter                           TRIGGER_PULSE_WIDTH =       32'd10;
    parameter                           ESCAPE_TH           =       32'd24_000;

    // Onehot, Not to make 32-bit adder
    localparam  [2 : 0]                 IDLE                =       3'b001;
    localparam  [2 : 0]                 TRIG                =       3'b010;
    localparam  [2 : 0]                 ECHO                =       3'b100;

    localparam  [1 : 0]                 WAIT_ECHO_POSEDGE   =       2'b01;
    localparam  [1 : 0]                 WAIT_ECHO_NEGEDGE   =       2'b10;

    // State
    reg [2 : 0]                         present_state;
    reg [2 : 0]                         next_state;
    reg [1 : 0]                         read_state;

    // Trigger
    reg                                 r_trigger;
    reg                                 r_en_trigger_pulse_count;
    reg [31 : 0]                        r_trigger_pulse_count;

    // 1 Microsecond
    wire                                w_cp_usec;
    wire                                w_tick_usec_posedge;

    // Echo
    wire                                w_echo_posedge;
    wire                                w_echo_negedge;
    reg                                 r_en_echo_pulse_count;
    reg [8 : 0]                         r_echo_pulse_count;

    // 58 Microsecond
    wire                                w_tick_58usec_posedge;

    // Distance
    reg [8 : 0]                         r_distance_pulse_width;
    reg [8 : 0]                         r_distance_pipeline;

    clock_div_100                       CLK_DIV_US(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_cp                           (w_cp_usec),
        .o_tick_posedge                 (w_tick_usec_posedge),
        .o_tick_negedge                 ()
    );

    clock_div_58                        CLK_DIV_58(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (w_cp_usec),
        .o_cp                           (),
        .o_tick_posedge                 (w_tick_58usec_posedge),
        .o_tick_negedge                 ()
    );

    edge_detector_n                     ED_INPUT_ECHO_DATA(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (i_echo),
        .o_posedge                      (w_echo_posedge),
        .o_negedge                      (w_echo_negedge)
    );

    // r_echo_pulse_count
    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_echo_pulse_count <= 0;
        end
        else if (w_tick_58usec_posedge && r_en_echo_pulse_count) begin
            r_echo_pulse_count <= r_echo_pulse_count + 1;
        end
        else if (!r_en_echo_pulse_count) begin
            r_echo_pulse_count <= 0;
        end
    end

    // r_trigger_pulse_count
    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_trigger_pulse_count <= 0;
        end
        else if (w_tick_usec_posedge && r_en_trigger_pulse_count) begin
            r_trigger_pulse_count <= r_trigger_pulse_count + 1;
        end
        else if (!r_en_trigger_pulse_count) begin
            r_trigger_pulse_count <= 0;
        end
    end

    // present_state
    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            present_state = IDLE;
        end
        else begin
            present_state = next_state;
        end
    end

    // next_state
    // read_state
    // r_en_trigger_pulse_count
    // r_en_echo_pulse_count
    // r_trigger
    // r_distance_pulse_width
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            next_state                      =   IDLE;
            read_state                      =   WAIT_ECHO_POSEDGE;
            r_en_trigger_pulse_count        =   0;
            r_en_echo_pulse_count           =   0;
            r_trigger                       =   0;
            r_distance_pulse_width          =   0;
        end
        else begin
            case (present_state)
                
                IDLE : begin
                    if (i_enable) begin
                        if (r_trigger_pulse_count       >=  IDLE_DELAY) begin
                            next_state                  =   TRIG;
                            r_en_trigger_pulse_count    =   0;
                            r_trigger                   =   0;
                        end
                        else begin
                            next_state                  =   IDLE;
                            r_en_trigger_pulse_count    =   1;
                            r_trigger                   =   0;
                        end
                    end
                    else begin
                        next_state                  =   IDLE;
                        r_en_trigger_pulse_count    =   1;
                        r_trigger                   =   0;
                    end
                end 

                TRIG : begin
                    if (r_trigger_pulse_count       >=  TRIGGER_PULSE_WIDTH) begin
                        next_state                  =   ECHO;
                        r_en_trigger_pulse_count    =   0;
                        r_trigger                   =   0;
                    end
                    else begin
                        next_state                  =   TRIG;
                        r_en_trigger_pulse_count    =   1;
                        r_trigger                   =   1;
                    end
                end

                ECHO : begin
                    case (read_state)
                        WAIT_ECHO_POSEDGE    : begin
                            if (w_echo_posedge) begin
                                read_state                  =   WAIT_ECHO_NEGEDGE;
                                r_en_echo_pulse_count       =   1;
                            end
                        end
                        WAIT_ECHO_NEGEDGE   : begin
                            if (w_echo_negedge) begin
                                read_state                  =   WAIT_ECHO_POSEDGE;
                                next_state                  =   IDLE;
                                r_en_echo_pulse_count       =   0;
                                r_distance_pulse_width      =   r_echo_pulse_count;
                            end
                            // Escape
                            if (r_trigger_pulse_count       >   ESCAPE_TH) begin
                                r_en_trigger_pulse_count    =   0;
                                r_en_echo_pulse_count       =   0;
                                read_state                  =   WAIT_ECHO_POSEDGE;
                                next_state                  =   IDLE;
                            end
                        end
                        default : begin
                            next_state = IDLE;
                        end 
                    endcase
                end
                default : begin
                    next_state = IDLE;
                end
            endcase
        end
    end

    // r_distance_pipeline
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_distance_pipeline <= 0;
        end
        else begin
            r_distance_pipeline <= r_distance_pulse_width;
        end
    end

    assign o_trigger            =       r_trigger;
    assign o_state_led          =       present_state;
    assign o_read_state_led     =       read_state;
    assign o_distance           =       r_distance_pipeline;
    
endmodule
////////////////////////////////////////////////////////////////////////////////
module buzzerControl #(
    parameter                           ACTIVE  =   1,
    parameter                           NOTE    =   (20'h5D2EF / 2)
) (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_enable,
    output      wire                    o_buzz_clk
);

    reg                                 r_buzz_clk;
    reg [19 : 0]                        r_buzz_count;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_buzz_clk           <=      0;
            r_buzz_count         <=      0;
        end
        else if (i_enable) begin
            if (ACTIVE) begin
                r_buzz_clk       <=     1;
            end
            else begin
                // PASSIVE
                if (r_buzz_count >= NOTE) begin
                    r_buzz_clk           <=      ~r_buzz_clk;
                    r_buzz_count         <=      0;
                end
                else begin
                    r_buzz_clk           <=      r_buzz_clk;
                    r_buzz_count         <=      r_buzz_count + 1;
                end
            end
        end
        else begin
            r_buzz_clk           <=      0;
            r_buzz_count         <=      0;
        end
    end

    assign o_buzz_clk = r_buzz_clk;

endmodule
////////////////////////////////////////////////////////////////////////////////
module functionalWatchControl (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_mode,
    output      wire        [2 : 0]     o_function_select
);

    localparam [2 : 0] MODE_WATCH           = 3'b001;
    localparam [2 : 0] MODE_STOP_WATCH      = 3'b010;
    localparam [2 : 0] MODE_COOKING_TIMER   = 3'b100;

    reg [2 : 0] present_state;
    reg [2 : 0] next_state;

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            present_state <= MODE_WATCH; 
        end
        else begin
            present_state <= next_state;
        end
    end

    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            next_state <= MODE_WATCH;
        end
        else begin
            case (present_state)
            
                MODE_WATCH          : if (i_mode)   next_state <= MODE_STOP_WATCH;
                MODE_STOP_WATCH     : if (i_mode)   next_state <= MODE_COOKING_TIMER;
                MODE_COOKING_TIMER  : if (i_mode)   next_state <= MODE_WATCH;
                default             :               next_state <= MODE_WATCH;

            endcase
        end
    end

    assign o_function_select = present_state;
    
endmodule
////////////////////////////////////////////////////////////////////////////////
module DC_Motor_Control (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire        [11 : 0]    i_duty,
    output      wire                    o_pwm
);

    parameter                           DC_MOTOR_PWM_FREQ           =   100;
    parameter                           DC_MOTOR_PWM_RESOLUTION     =   4096;
    parameter                           DC_MOTOR_BIT_RESOLUTION     =   12;

    pwm #(
        .PWM_FREQ                       (DC_MOTOR_PWM_FREQ),
        .PWM_RESOLUTION                 (DC_MOTOR_PWM_RESOLUTION),
        .BIT_RESOLUTION                 (DC_MOTOR_BIT_RESOLUTION)
    )                                   MOTOR_DRIVER(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_duty                         (i_duty),
        .o_pwm                          (o_pwm)
    );

endmodule
////////////////////////////////////////////////////////////////////////////////
module SG90_Control (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire    [11 : 0]        i_duty,
    output      wire                    o_pwm
);

    parameter                           SERVO_PWM_FREQ          =   50;
    parameter                           SERVO_PWM_RESOLUTION    =   4096;
    parameter                           SERVO_BIT_RESOLUTION    =   12;

    parameter                           SERVO_MAX               =   12'd410;
    parameter                           SERVO_NEUTRAL           =   12'd308;
    parameter                           SERVO_MIN               =   12'd205;
    parameter                           SERVO_1_DEGREE          =   12'd1;
    parameter                           SERVO_10_DEGREE         =   12'd11;

    reg  [11 : 0]                       r_duty;
    wire [11 : 0]                       w_servo_duty;

    pwm                                 #(
        .PWM_FREQ                       (SERVO_PWM_FREQ),
        .PWM_RESOLUTION                 (SERVO_PWM_RESOLUTION),
        .BIT_RESOLUTION                 (SERVO_BIT_RESOLUTION)
    )                                   SERVO_DRIVER(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_duty                         (w_servo_duty),
        .o_pwm                          (o_pwm)
    );

    assign w_servo_duty         =       i_duty;

endmodule
////////////////////////////////////////////////////////////////////////////////
module SG90_angle2Duty #(
    parameter                               X_OFFSET_TRUE = 0,
    parameter                               UP_DOWN_INVERT = 0
)(
    input       wire    signed  [31 : 0]    i_q_theta,
    output      wire            [11 : 0]    o_duty
);

    localparam                              SERVO_MAX               =   12'd480;
    localparam                              SERVO_NEUTRAL           =   12'd270;
    localparam                              SERVO_MIN               =   12'd60;

    localparam          signed  [15 : 0]    Q_SCALE                 =   32'd597;
    localparam          signed  [15 : 0]    Y_OFFSET                =   32'd270;
    localparam          signed  [15 : 0]    X_OFFSET                =   32'd210; // 90.0 * 1.1389 = 102.50

    wire signed [15 : 0] w_q_theta_intVal;
    wire signed [63 : 0] w_q_duty_extended;
    wire signed [31 : 0] w_duty;

    assign w_q_theta_intVal         =       i_q_theta[31 -: 16];
    assign w_q_duty_extended        =       i_q_theta * (Q_SCALE << 8);
    assign w_duty                   =       (X_OFFSET_TRUE  && UP_DOWN_INVERT)  ?   (SERVO_MAX - (w_q_duty_extended[63 -: 32] + Y_OFFSET - X_OFFSET) + SERVO_MIN)   :
                                            (X_OFFSET_TRUE  && !UP_DOWN_INVERT) ?   (w_q_duty_extended[63 -: 32] + Y_OFFSET - X_OFFSET)                             :
                                            (!X_OFFSET_TRUE && UP_DOWN_INVERT)  ?   (SERVO_MAX - (w_q_duty_extended[63 -: 32] + Y_OFFSET) + SERVO_MIN)              :
                                            (!X_OFFSET_TRUE && !UP_DOWN_INVERT) ?   (w_q_duty_extended[63 -: 32] + Y_OFFSET)                                        : (12'hz);
    assign o_duty                   =       w_duty[0 +: 12];

endmodule
////////////////////////////////////////////////////////////////////////////////
module SG90_Rotator (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_enable,
    input       wire                    i_load,
    input       wire    [11 : 0]        i_duty_load,
    output      wire    [11 : 0]        o_duty
);
    parameter                           SERVO_MAX               =   12'd516;
    parameter                           SERVO_NEUTRAL           =   12'd307;
    parameter                           SERVO_MIN               =   12'd102;
    parameter                           SERVO_1_DEGREE          =   12'd2;
    parameter                           SERVO_10_DEGREE         =   12'd23;

    reg     [11 : 0]                    r_duty_wiper;
    reg                                 r_duty_direction;

    reg     [20 : 0]                    delay_counter;
    wire                                w_delay_counter_posedge;

    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            delay_counter <= 0;
        end
        else begin
            delay_counter <= delay_counter + 1;
        end
    end

    // 0.002 sec = 2ms
    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_duty_direction     <=      1;
            r_duty_wiper         <=      SERVO_MIN;
        end
        else if (i_load) begin
            r_duty_wiper        <=      i_duty_load;
        end
        else if (i_enable && w_delay_counter_posedge) begin
            // Min to Max
            if      (r_duty_direction) begin
                // Reach to Max
                if (r_duty_wiper >= SERVO_MAX) begin
                    r_duty_direction <= 0;
                end
                else begin
                    r_duty_wiper <= r_duty_wiper + SERVO_1_DEGREE;
                end
            end
            // Max to Min
            else if (!r_duty_direction) begin
                // Reach to Min
                if (r_duty_wiper <= SERVO_MIN) begin
                    r_duty_direction <= 1;
                end
                else begin
                    r_duty_wiper <= r_duty_wiper - SERVO_1_DEGREE;
                end
            end
        end
    end

    assign o_duty = r_duty_wiper;

endmodule
////////////////////////////////////////////////////////////////////////////////
module fanTimerControl(
    input clk, reset_p,
    input time_set_change,
    input timer_disable,
    output [3:0] state,
    output reg [15:0] bcd,
    output reg enable,
    output reg load
);

    parameter STATE_NO_SET      = 4'b0001;
    parameter STATE_TIME_SET_1H = 4'b0010;
    parameter STATE_TIME_SET_3H = 4'b0100;
    parameter STATE_TIME_SET_5H = 4'b1000;
    
    reg [3:0] time_set_state, time_set_next_state;

    assign state = time_set_state;

    always @(negedge clk or posedge reset_p) begin
        if (reset_p)
            time_set_state <= STATE_NO_SET;
        else
            time_set_state <= time_set_next_state;
    end

    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            time_set_next_state <= STATE_NO_SET;
            load <= 0;
            enable <= 0;
            bcd <= 0;
        end else begin
            case (time_set_state)
                STATE_NO_SET: begin
                    if (timer_disable) begin
                        load <= 0;
                        enable <= 0;
                        bcd <= 16'b0000_0000_0000_0000;
                    end
                    else if (time_set_change) begin
                        time_set_next_state <= STATE_TIME_SET_1H;
                        bcd <= 16'b0000_0001_0000_0000;
                        enable <= 1;
                        load <= 1;
                    end else begin
                        load <= 0;
                        enable <= 0;
                        bcd <= 16'b0000_0000_0000_0000;
                    end
                end

                STATE_TIME_SET_1H: begin
                    if (timer_disable) begin
                        time_set_next_state <= STATE_NO_SET;
                        load <= 0;
                        enable <= 0;
                        bcd <= 16'b0000_0000_0000_0000;
                    end
                    else if (time_set_change) begin
                        time_set_next_state <= STATE_TIME_SET_3H;
                        bcd <= 16'b0000_0011_0000_0000;
                        enable <= 1;
                        load <= 1;
                    end else begin
                        bcd <= 16'b0000_0001_0000_0000;
                        enable <= 1;
                        load <= 0;
                    end
                end

                STATE_TIME_SET_3H: begin
                    if (timer_disable) begin
                        time_set_next_state <= STATE_NO_SET;
                        load <= 0;
                        enable <= 0;
                        bcd <= 16'b0000_0000_0000_0000;
                    end
                    else if (time_set_change) begin
                        time_set_next_state <= STATE_TIME_SET_5H;
                        bcd <= 16'b0000_0101_0000_0000;
                        enable <= 1;
                        load <= 1;
                    end else begin
                        bcd <= 16'b0000_0011_0000_0000;
                        enable <= 1;
                        load <= 0;
                    end
                end

                STATE_TIME_SET_5H: begin
                    if (timer_disable) begin
                        time_set_next_state <= STATE_NO_SET;
                        load <= 0;
                        enable <= 0;
                        bcd <= 16'b0000_0000_0000_0000;
                    end
                    else if (time_set_change) begin
                        time_set_next_state <= STATE_NO_SET;
                        bcd <= 16'b0000_0000_0000_0000;
                        enable <= 1;
                        load <= 0;
                    end else begin
                        bcd <= 16'b0000_0101_0000_0000;
                        enable <= 1;
                        load <= 0;
                    end
                end

                default: time_set_next_state <= STATE_NO_SET;
            endcase
        end
    end
endmodule
////////////////////////////////////////////////////////////////////////////////
module fanBackLightControl(
    input clk, reset_p,
    input bklgt_change,
    input bklgt_disable,
    output back_light_pwm
);

    parameter STATE_NO_SET   = 4'b0001;
    parameter STATE_LGT_SET1 = 4'b0010;
    parameter STATE_LGT_SET2 = 4'b0100;
    parameter STATE_LGT_SET3 = 4'b1000;
    
    reg [3:0] lgt_set_state, lgt_set_next_state;
    reg [11:0] cnt;


    pwm #(.PWM_FREQ(100_00), .PWM_RESOLUTION(4096), .BIT_RESOLUTION(12)) led_back_light(.i_clk(clk), .i_reset(reset_p), .i_duty(cnt), .o_pwm(back_light_pwm));

    always @(negedge clk or posedge reset_p) begin
        if (reset_p)
            lgt_set_state <= STATE_NO_SET;
        else
            lgt_set_state <= lgt_set_next_state;
    end

    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            lgt_set_next_state <= STATE_NO_SET;
            cnt <= 0;
        end else begin
            case (lgt_set_state)
                STATE_NO_SET: begin
                    if (bklgt_disable) begin
                        lgt_set_next_state <= STATE_NO_SET;
                        cnt <= 0;
                    end
                    else if (bklgt_change) begin
                        lgt_set_next_state <= STATE_LGT_SET1;
                        cnt <= 1365;
                    end else begin
                        cnt <= 0;
                    end
                end

                STATE_LGT_SET1: begin
                    if (bklgt_disable) begin
                        lgt_set_next_state <= STATE_NO_SET;
                        cnt <= 0;
                    end
                    else if (bklgt_change) begin
                        lgt_set_next_state <= STATE_LGT_SET2;
                        cnt <= 2730;
                    end else begin
                        cnt <= 1365;
                    end
                end

                STATE_LGT_SET2: begin
                    if (bklgt_disable) begin
                        lgt_set_next_state <= STATE_NO_SET;
                        cnt <= 0;
                    end
                    else if (bklgt_change) begin
                        lgt_set_next_state <= STATE_LGT_SET3;
                        cnt <= 4095;
                    end else begin
                        cnt <= 2730;
                    end
                end

                STATE_LGT_SET3: begin
                    if (bklgt_disable) begin
                        lgt_set_next_state <= STATE_NO_SET;
                        cnt <= 0;
                    end
                    else if (bklgt_change) begin
                        lgt_set_next_state <= STATE_NO_SET;
                        cnt <= 0;
                    end else begin
                        cnt <= 4095;
                    end
                end

                default: lgt_set_next_state <= STATE_NO_SET;
            endcase
        end
    end
endmodule
////////////////////////////////////////////////////////////////////////////////
module fanPowerControl(
    input clk, reset_p,
    input power_change,
    input power_disable,
    output reg [11:0] duty,
    output [3:0] state
);

    parameter POWOFF = 4'b0001;
    parameter POWLOW = 4'b0010;
    parameter POWMID = 4'b0100;
    parameter POWMAX = 4'b1000;
    
    reg [3:0] power_set_state, power_set_next_state;
    
    assign state = power_set_state;
    

    always @(negedge clk or posedge reset_p) begin
        if (reset_p)
            power_set_state <= POWOFF;
        else
            power_set_state <= power_set_next_state;
    end

    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            power_set_next_state <= POWOFF;
            duty <= 0;
        end else begin
            case (power_set_state)
                POWOFF: begin
                    if(power_disable) power_set_next_state <= POWOFF;
                    else begin
                        if (power_change) begin
                        power_set_next_state <= POWLOW;
                    end else begin
                        duty <= 0;
                    end
                    end
                   
                end

                POWLOW: begin
                    if(power_disable) power_set_next_state <= POWOFF;
                    else begin
                    if (power_change) begin
                        power_set_next_state <= POWMID;
                    end else begin
                        duty <= 1500;
                    end
                    end

                end

                POWMID: begin
                    if(power_disable) power_set_next_state <= POWOFF;
                    else begin
                    if (power_change) begin
                        power_set_next_state <= POWMAX;
                    end else begin
                        duty <= 2730;
                        
                    end
                    end

                end

                POWMAX: begin
                    if(power_disable) power_set_next_state <= POWOFF;
                    else begin
                    if (power_change) begin
                        power_set_next_state <= POWOFF;
                    end else begin
                        duty <= 4095;
                    end
                    end
                end

                default: power_set_next_state <= POWOFF;
            endcase
        end
    end
endmodule
////////////////////////////////////////////////////////////////////////////////
module ultrasonic (
    input clk, reset_p,
    input echo,                     // From Sensor to MCU
    output reg trig,                // From MCU to Sensor
    output reg [9:0] distance);
   


    reg [9:0] count;    
    parameter S_IDLE        = 3'b001;
    parameter TRIG          = 3'b010;
    parameter ECHO          = 3'b100;
                             
    parameter S_WAIT_PEDGE  = 2'b01;
    parameter S_WAIT_NEDGE  = 2'b10;

    reg [19:0] count_usec;
    wire clk_usec;

    reg count_usec_e;
    // clock_div_100 clk_us(.clk(clk), .reset_p(reset_p), .clk_div_100(clk_usec));
    clock_div_100               clk_us(
        .i_clk                  (clk),
        .i_reset                (reset_p),
        .o_cp                   (),
        .o_tick_posedge         (),
        .o_tick_negedge         (clk_usec)
    );

    reg cnt_e;
    wire [11:0] cm;

    // sr_04_div_58 clk_cm(.clk(clk), .reset_p(reset_p), .clk_usec(clk_usec), .cnt_e(cnt_e), .cm(cm));
    clock_div_58                clk_58(
        .i_clk                  (clk),
        .i_reset                (reset_p),
        .i_cp                   (clk_usec),
        .o_cp                   (o_cp),
        .o_tick_posedge         (o_tick_posedge),
        .o_tick_negedge         (o_tick_negedge)
    );

    always @(negedge clk or posedge reset_p) begin
        if (reset_p)
            count_usec = 0;
        else if (clk_usec && count_usec_e)
            count_usec = count_usec + 1;
        else if (count_usec_e == 0)
            count_usec = 0;
    end

 
    wire echo_nedge, echo_pedge;
    edge_detector_p ed(
        .i_clk(clk), .i_reset(reset_p), .i_cp(echo),
        .o_negedge(echo_nedge), .o_posedge(echo_pedge));

    reg [2:0] state, next_state;
    reg [1:0] read_state;

    always @(negedge clk or posedge reset_p) begin
        if (reset_p)
            state <= S_IDLE;
        else
            state <= next_state;
    end


    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            count_usec_e <= 0;
            next_state <= S_IDLE;
            read_state <= S_WAIT_PEDGE;
            cnt_e <= 0;
        end else begin
            case (state)
                S_IDLE: begin
                    if (count_usec < 22'd100_000) begin       // if manage this number, you can set sensor lunch time faster or not. but 60ms is the minimum value (1_000_000 this value is 1s)
                        count_usec_e <= 1;
                        trig <= 0;
                    end else begin
                        next_state <= TRIG;
                        count_usec_e <= 0;
                        trig <= 1;
                    end
                end
                    TRIG: begin
                    if (count_usec < 22'd10) begin
                        count_usec_e <= 1;
                        trig <= 1;
                    end else begin
                        next_state <= ECHO;
                        count_usec_e <= 0;
                        trig <= 0;
                    end
                end
                ECHO: begin
                    case(read_state)
                        S_WAIT_PEDGE:begin
                            if(echo_pedge)begin
                            read_state = S_WAIT_NEDGE;
                            cnt_e = 1;
                            end
                        end
                        S_WAIT_NEDGE:begin
                            if(echo_nedge)begin
                                    next_state = S_IDLE;
                                    distance = cm;
                                    cnt_e = 0;
                                    read_state = S_WAIT_PEDGE;      
                                    // read_state and next_state are other register
                            end
                            else count_usec_e = 1; 
                        end
                    endcase
                end
                default: next_state <= S_IDLE;
            endcase
        end
    end
endmodule
////////////////////////////////////////////////////////////////////////////////
module i2c_master (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire        [6 : 0]     i_slave_addr,
    input       wire                    i_rw,
    input       wire                    i_start,
    input       wire        [7 : 0]     i_data,
    output      wire                    o_scl,
    output      wire                    o_sda
);

    localparam  [6 : 0]     IDLE    = 7'b000_0001 << 0;
    localparam  [6 : 0]     START   = 7'b000_0001 << 1;
    localparam  [6 : 0]     SLVSEL  = 7'b000_0001 << 2;
    localparam  [6 : 0]     WAITACK = 7'b000_0001 << 3;
    localparam  [6 : 0]     TX      = 7'b000_0001 << 4;
    localparam  [6 : 0]     SDAHALT = 7'b000_0001 << 5;
    localparam  [6 : 0]     DONE    = 7'b000_0001 << 6;

    wire [7 : 0]    w_slave_addr_rw;
    wire            w_tick_usec_posedge;
    reg             r_en_scl;
    reg [2 : 0]     r_count_usec_5_tick;
    reg             r_scl;
    reg             r_sda;

    wire            w_start_posedge;
    wire            w_scl_posedge;
    wire            w_scl_negedge;

    reg [6 : 0]     present_state;
    reg [6 : 0]     next_state;

    reg [2 : 0]     r_bit_count;

    reg             r_tx_flag;

    clock_div_100                       USEC_TICK(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_cp                           (),
        .o_tick_posedge                 (w_tick_usec_posedge),
        .o_tick_negedge                 ()
    );

    edge_detector_n                     ED_I2C_START(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (i_start),
        .o_posedge                      (w_start_posedge),
        .o_negedge                      ()
    );

    edge_detector_n                     ED_SCL(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (r_scl),
        .o_posedge                      (w_scl_posedge),
        .o_negedge                      (w_scl_negedge)
    );

    always @(posedge i_clk or posedge i_reset) begin : SET_SCL_10_US
        if (i_reset) begin
            r_count_usec_5_tick     <=      0;
            r_scl                   <=      1;
        end
        else if (r_en_scl) begin
            if (w_tick_usec_posedge) begin
                if (r_count_usec_5_tick >= 5 - 1) begin
                    r_count_usec_5_tick     <=      0;
                    r_scl                   <=      ~r_scl;
                end
                else begin
                    r_count_usec_5_tick     <=      r_count_usec_5_tick + 1;
                end
            end
        end
        else if (!r_en_scl) begin
            r_count_usec_5_tick     <=      0;
            r_scl                   <=      1;
        end
    end

    always @(negedge i_clk or posedge i_reset) begin : STATE_TRANSITION
        if (i_reset) begin
            present_state <= IDLE;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @(posedge i_clk or posedge i_reset) begin : DETERMINE_STATE_AND_OUTPUT
        if (i_reset) begin
            next_state <= IDLE;
            r_en_scl <= 0;
            r_sda <= 1;
            r_bit_count <= 7;
            r_tx_flag <= 0;
        end
        else begin
            case (present_state)
                IDLE        : begin
                    r_en_scl <= 0;
                    r_sda <= 1;
                    if (w_start_posedge) begin
                        next_state <= START;
                    end
                end

                START       : begin
                    r_sda <= 0;
                    r_en_scl <= 1;
                    next_state <= SLVSEL;
                end

                SLVSEL      : begin
                    if (w_scl_negedge) begin
                        r_sda <= w_slave_addr_rw[r_bit_count];
                    end
                    else if (w_scl_posedge) begin
                        if (r_bit_count == 0) begin
                            r_bit_count <= 7;
                            next_state <= WAITACK;
                        end
                        else begin
                            r_bit_count <= r_bit_count - 1;
                        end
                    end
                end

                WAITACK     : begin
                    if (w_scl_negedge) begin
                        r_sda <= 1'bz;
                    end
                    else if (w_scl_posedge) begin
                        if (r_tx_flag) begin
                            r_tx_flag <= 0;
                            next_state <= SDAHALT;
                        end
                        else if (!r_tx_flag) begin
                            r_tx_flag <= 1;
                            next_state <= TX;
                        end
                    end
                end

                TX          : begin
                    if (w_scl_negedge) begin
                        r_sda <= i_data[r_bit_count];
                    end
                    else if (w_scl_posedge) begin
                        if (r_bit_count == 0) begin
                            r_bit_count <= 7;
                            next_state <= WAITACK;
                        end
                        else begin
                            r_bit_count <= r_bit_count - 1;
                        end
                    end
                end

                SDAHALT     : begin
                    if (w_scl_negedge) begin
                        r_sda <= 0;
                    end
                    else if (w_scl_posedge) begin
                        next_state <= DONE;
                    end
                end

                DONE        : begin
                    if (r_count_usec_5_tick >= 3) begin
                        r_en_scl <= 0;
                        r_sda <= 1;
                        next_state <= IDLE;
                    end
                end
            endcase
        end
    end

    assign w_slave_addr_rw = {i_slave_addr, i_rw};
    assign o_scl = r_scl;
    assign o_sda = r_sda;
    
endmodule  
////////////////////////////////////////////////////////////////////////////////
module i2cLcdController (
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire        [6 : 0]     i_slave_addr,
    input       wire        [7 : 0]     i_tx_buf,
    input       wire                    i_tx,
    input       wire                    i_rs,
    output      wire                    o_scl,
    output      wire                    o_sda,
    output      wire                    o_busy
);

    localparam [6 : 0]                  I2C_LCD_SLV_ADDR    =   7'h27;
    localparam                          I2C_LCD_WRITE_ONLY  =   1'b0;

    localparam  [5 : 0]                 IDLE            = 6'b00_0001 << 0;
    localparam  [5 : 0]                 HIGH_NIBBLE     = 6'b00_0001 << 1;
    localparam  [5 : 0]                 EN_HIGH_NIBBLE  = 6'b00_0001 << 2;
    localparam  [5 : 0]                 LOW_NIBBLE      = 6'b00_0001 << 3;
    localparam  [5 : 0]                 EN_LOW_NIBBLE   = 6'b00_0001 << 4;
    localparam  [5 : 0]                 DONE            = 6'b00_0001 << 5;

    wire                                w_tick_usec_posedge;
    reg                                 r_en_count_usec;
    reg         [21 : 0]                r_count_usec;
    wire                                w_tx_posedge;
    reg         [7 : 0]                 r_tx_buf;
    
    reg         [5 : 0]                 present_state;
    reg         [5 : 0]                 next_state;

    reg                                 r_busy;
    reg                                 r_i2c_start;

    clock_div_100                       USEC_TICK(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_cp                           (),
        .o_tick_posedge                 (w_tick_usec_posedge),
        .o_tick_negedge                 ()
    );

    edge_detector_n                     ED_I2C_TX(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (i_tx),
        .o_posedge                      (w_tx_posedge),
        .o_negedge                      ()
    );

    i2c_master                          INST_I2C_MASTER(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_slave_addr                   (i_slave_addr),
        .i_rw                           (1'b0),
        .i_start                        (r_i2c_start),
        .i_data                         (r_tx_buf),
        .o_scl                          (o_scl),
        .o_sda                          (o_sda)
    );

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_count_usec <= 0;
        end
        else begin
            if (r_en_count_usec && w_tick_usec_posedge) begin
                r_count_usec <= r_count_usec + 1;
            end
            else if (!r_en_count_usec) begin
                r_count_usec <= 0;
            end
        end
    end

    always @(negedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            present_state <= IDLE;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            next_state <= IDLE;
            r_busy <= 0;
        end
        else begin
            case (present_state)

                IDLE            :   begin
                    if (w_tx_posedge) begin
                        next_state <= HIGH_NIBBLE;
                        r_busy <= 1;
                    end
                end

                HIGH_NIBBLE     :   begin
                    if (r_count_usec <= 22'd200) begin
                        r_tx_buf <= {i_tx_buf[7 : 4], 1'b1, 2'b00, i_rs}; // DATA[3 : 0], BACK_LIGHT, ENABLE, R/W, RS
                        r_i2c_start <= 1;
                        r_en_count_usec <= 1;
                    end
                    else begin
                        next_state <= EN_HIGH_NIBBLE;
                        r_i2c_start <= 0;
                        r_en_count_usec <= 0;
                    end
                end

                EN_HIGH_NIBBLE  :   begin
                    if (r_count_usec <= 22'd200) begin
                        r_tx_buf <= {i_tx_buf[7 : 4], 1'b1, 2'b10, i_rs}; // DATA[3 : 0], BACK_LIGHT, ENABLE, R/W, RS
                        r_i2c_start <= 1;
                        r_en_count_usec <= 1;
                    end
                    else begin
                        next_state <= LOW_NIBBLE;
                        r_i2c_start <= 0;
                        r_en_count_usec <= 0;
                    end
                end

                LOW_NIBBLE      :   begin
                    if (r_count_usec <= 22'd200) begin
                        r_tx_buf <= {i_tx_buf[3 : 0], 1'b1, 2'b00, i_rs}; // DATA[3 : 0], BACK_LIGHT, ENABLE, R/W, RS
                        r_i2c_start <= 1;
                        r_en_count_usec <= 1;
                    end
                    else begin
                        next_state <= EN_LOW_NIBBLE;
                        r_i2c_start <= 0;
                        r_en_count_usec <= 0;
                    end
                end

                EN_LOW_NIBBLE   :   begin
                    if (r_count_usec <= 22'd200) begin
                        r_tx_buf <= {i_tx_buf[3 : 0], 1'b1, 2'b10, i_rs}; // DATA[3 : 0], BACK_LIGHT, ENABLE, R/W, RS
                        r_i2c_start <= 1;
                        r_en_count_usec <= 1;
                    end
                    else begin
                        next_state <= DONE;
                        r_i2c_start <= 0;
                        r_en_count_usec <= 0;
                    end
                end

                DONE            :   begin
                    if (r_count_usec <= 22'd200) begin
                        r_tx_buf <= {i_tx_buf[3 : 0], 1'b1, 2'b00, i_rs}; // DATA[3 : 0], BACK_LIGHT, ENABLE, R/W, RS
                        r_i2c_start <= 1;
                        r_en_count_usec <= 1;
                    end
                    else begin
                        next_state <= IDLE;
                        r_i2c_start <= 0;
                        r_en_count_usec <= 0;
                        r_busy <= 0;
                    end
                end

                default         :   begin

                end
            endcase
        end
    end

    assign o_busy = r_busy;
    
endmodule
////////////////////////////////////////////////////////////////////////////////
module stepperMotorControl #(
    parameter                           DELAY_PER_STEP_US   =       900
)(
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_enable,
    input       wire                    i_direction,
    output      wire        [3 : 0]     o_phase
);

    localparam              [3 : 0]     SEQ_0   =   4'b1000;
    localparam              [3 : 0]     SEQ_1   =   4'b1100;
    localparam              [3 : 0]     SEQ_2   =   4'b0100;
    localparam              [3 : 0]     SEQ_3   =   4'b0110;
    localparam              [3 : 0]     SEQ_4   =   4'b0010;
    localparam              [3 : 0]     SEQ_5   =   4'b0011;
    localparam              [3 : 0]     SEQ_6   =   4'b0001;
    localparam              [3 : 0]     SEQ_7   =   4'b1001;

    reg                     [3 : 0]     present_state;
    reg                     [3 : 0]     next_state;

    wire                                w_tick_usec_posedge;

    reg                     [9 : 0]     r_count_usec;
    reg                                 r_en_unit_step;

    clock_div_100                       USEC(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .o_cp                           (),
        .o_tick_posedge                 (w_tick_usec_posedge),
        .o_tick_negedge                 ()
    );

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_count_usec <= 0;
            r_en_unit_step <= 0;
        end
        else begin
            if (i_enable && w_tick_usec_posedge) begin
                if (r_count_usec >= DELAY_PER_STEP_US - 1) begin
                    r_count_usec <= 0;
                    r_en_unit_step <= 1;
                end
                else begin
                    r_count_usec <= r_count_usec + 1;
                    r_en_unit_step <= 0;
                end
            end
            else begin
                r_count_usec <= r_count_usec;
                r_en_unit_step <= 0;
            end
        end
    end

    always @(negedge i_clk or posedge i_reset) begin : STATE_TRANSITION
        if (i_reset) begin
            present_state <= SEQ_0;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            next_state <= SEQ_0;
        end
        else if (r_en_unit_step) begin
            case (present_state)
                SEQ_0  : begin if (i_direction) next_state <= SEQ_1; else if (!i_direction) next_state <= SEQ_7; end
                SEQ_1  : begin if (i_direction) next_state <= SEQ_2; else if (!i_direction) next_state <= SEQ_0; end
                SEQ_2  : begin if (i_direction) next_state <= SEQ_3; else if (!i_direction) next_state <= SEQ_1; end
                SEQ_3  : begin if (i_direction) next_state <= SEQ_4; else if (!i_direction) next_state <= SEQ_2; end
                SEQ_4  : begin if (i_direction) next_state <= SEQ_5; else if (!i_direction) next_state <= SEQ_3; end
                SEQ_5  : begin if (i_direction) next_state <= SEQ_6; else if (!i_direction) next_state <= SEQ_4; end
                SEQ_6  : begin if (i_direction) next_state <= SEQ_7; else if (!i_direction) next_state <= SEQ_5; end
                SEQ_7  : begin if (i_direction) next_state <= SEQ_0; else if (!i_direction) next_state <= SEQ_6; end
            endcase
        end
    end

    assign o_phase = present_state;

endmodule
////////////////////////////////////////////////////////////////////////////////
module uart_rx #(
    parameter                           BAUD_RATE       =       9600,
    parameter                           DATA_BITS       =       8,
    parameter                           STOP_BITS       =       1,
    parameter                           PARITY          =       0
)(
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_data,
    output      wire        [7 : 0]     o_data,
    output      wire                    o_valid
);
    localparam              [2 : 0]     IDLE    =   3'b001 << 0;
    localparam              [2 : 0]     RX      =   3'b001 << 1;
    localparam              [2 : 0]     DONE    =   3'b001 << 2;

    reg                     [2 : 0]     present_state;
    reg                     [2 : 0]     next_state;

    reg                     [7 : 0]     r_rx_buffer;
    reg                                 r_valid;

    reg                     [15 : 0]    r_count_9600_baud_rate;
    reg                                 r_en_counter_9600_baud_rate;
    reg                                 r_next_bit;
    wire                                w_next_bit_posedge;

    reg                     [3 : 0]     r_count_frame;
    reg                                 r_en_counter_frame;

    wire                                w_input_data_posedge;
    wire                                w_input_data_negedge;
    wire                                w_tick_usec_posedge;

    edge_detector_n                     ED_INPUT_DATA(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (i_data),
        .o_posedge                      (w_input_data_posedge),
        .o_negedge                      (w_input_data_negedge)
    );
    
    edge_detector_n                     ED_NEXT_BIT(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (r_next_bit),
        .o_posedge                      (w_next_bit_posedge),
        .o_negedge                      ()
    );

    always @(posedge i_clk or posedge i_reset) begin : BAUD_COUNTER
        if (i_reset) begin
            r_count_9600_baud_rate <= 0;
            r_next_bit <= 0;
        end
        else begin
            if (r_en_counter_9600_baud_rate) begin
                if (r_count_9600_baud_rate >= 10417 - 1) begin
                    r_count_9600_baud_rate <= 0;
                    r_next_bit <= 1;
                end
                else begin
                    r_count_9600_baud_rate <= r_count_9600_baud_rate + 1;
                    r_next_bit <= 0;
                end
            end
            else if (!r_en_counter_9600_baud_rate) begin
                r_count_9600_baud_rate <= 0;
                r_next_bit <= 0;
            end
        end
    end

    always @(posedge i_clk or posedge i_reset) begin : SHIFT_BUFFERING
        if (i_reset) begin
            r_count_frame <= 0;
            r_rx_buffer <= 0;
        end
        else if (r_en_counter_frame && w_next_bit_posedge) begin
            r_count_frame <= r_count_frame + 1;
            r_rx_buffer[r_count_frame] <= i_data;
        end
        else if (!r_en_counter_frame) begin
            r_count_frame <= 0;
        end
    end

    always @(negedge i_clk or posedge i_reset) begin : STATE_TRANSITION
        if (i_reset) begin
            present_state <= IDLE;
        end
        else begin
            present_state <= next_state;
        end
    end

    always @(posedge i_clk or posedge i_reset) begin : DETERMINE_STATE_AND_OUTPUT
        if (i_reset) begin
            next_state <= IDLE;
            r_valid <= 0;
            r_en_counter_9600_baud_rate <= 0;
            r_en_counter_frame <= 0;
        end
        else begin
            case (present_state)
            
                IDLE    : begin
                    if (w_input_data_negedge) begin
                        next_state <= RX;
                    end
                    r_valid <= 0;
                end
                
                RX      : begin
                    if (r_count_frame >= 8 - 1 && w_input_data_posedge) begin
                        next_state <= DONE;
                        r_en_counter_9600_baud_rate <= 0;
                        r_en_counter_frame <= 0;
                        r_valid <= 1;
                    end
                    else begin
                        r_en_counter_9600_baud_rate <= 1;
                        r_en_counter_frame <= 1;
                    end
                end
                
                DONE    : begin
                    next_state <= IDLE;
                    r_valid <= 0;
                end
            endcase
        end
    end

    assign o_valid = r_valid;
    assign o_data = r_rx_buffer;
    
endmodule
////////////////////////////////////////////////////////////////////////////////
module jointControl #(
    parameter               [7 : 0]     JOINT_DEG_MARGIN        =   8'd10
)(
    input       wire                    i_clk,
    input       wire                    i_reset,
    input       wire                    i_enable,
    input       wire                    i_direction,        // 1 : CW | 0 : CCW
    output      wire        [7 : 0]     o_joint_angle,
    output      wire                    o_pwm
);

    localparam                          SERVO_MAX               =   12'd410;
    localparam                          SERVO_NEUTRAL           =   12'd308;
    localparam                          SERVO_MIN               =   12'd205;
    localparam                          SERVO_1_DEGREE          =   12'd2;
    localparam                          SERVO_10_DEGREE         =   12'd11;

    localparam              [7 : 0]     SERVO_MAX_DEG           =   8'd180;
    localparam              [7 : 0]     SERVO_NEU_DEG           =   8'd90;
    localparam              [7 : 0]     SERVO_MIN_DEG           =   8'd0;

    reg                     [11 : 0]    r_duty;
    reg                     [7 : 0]     r_deg;

    reg                     [20 : 0]    delay_counter;
    wire                                w_delay_counter_posedge;
    
    edge_detector_n                     ED_DELAY_COUNTER(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_cp                           (delay_counter[19]),
        .o_posedge                      (w_delay_counter_posedge),
        .o_negedge                      ()
    );

    SG90_Control                        SERVO_JOINT(
        .i_clk                          (i_clk),
        .i_reset                        (i_reset),
        .i_duty                         (r_duty),
        .o_pwm                          (o_pwm)
    );

    always @(negedge i_clk or posedge i_reset) begin : DELAY_COUNTER
        if (i_reset) begin
            delay_counter <= 0;
        end
        else begin
            delay_counter <= delay_counter + 1;
        end
    end

    always @(posedge i_clk or posedge i_reset) begin : DETERMINE_DUTY_AND_DEGREE
        if (i_reset) begin
            r_duty <= SERVO_NEUTRAL;
            r_deg <= SERVO_NEU_DEG;
        end
        else if (i_enable && w_delay_counter_posedge) begin : WORK
            if (i_direction) begin : WORK_CW
                if (r_deg < SERVO_MAX_DEG) begin
                    r_duty <= r_duty + SERVO_1_DEGREE;
                    r_deg <= r_deg + 1;
                end
            end
            else if (!i_direction) begin : WORK_CCW
                if (r_deg > SERVO_MIN_DEG) begin
                    r_duty <= r_duty - SERVO_1_DEGREE;
                    r_deg <= r_deg - 1;
                end
            end
        end
        else begin : NOT_WORK
            r_duty <= r_duty;
            r_deg <= r_deg;
        end
    end

    assign o_joint_angle = r_deg;

endmodule
////////////////////////////////////////////////////////////////////////////////
module manipulatorSolver #(
    parameter                           [7 : 0]         L1  =   10,
    parameter                           [7 : 0]         L2  =   10
)(
    input       wire                                    i_clk,
    input       wire                                    i_reset,
    input       wire                    [7  : 0]        i_coord_x,
    input       wire                    [7  : 0]        i_coord_y,
    output      wire        signed      [31 : 0]        o_q_theta_1,
    output      wire        signed      [31 : 0]        o_q_theta_2
);

    ////////////////////////////////////////////////////////////////////////
    // Parameter Declaration
    // Wire Declaration
    
        localparam  signed      [15 : 0]    Q_RAD_2_DEG = 16'd14667;
        localparam  signed      [15 : 0]    Q_2PI       = 16'd1608;


            wire    signed  [15 : 0]    w_q_coord_x;
            wire    signed  [15 : 0]    w_q_coord_y;
            wire    signed  [15 : 0]    w_q_L1;
            wire    signed  [15 : 0]    w_q_L2;
            wire    signed  [31 : 0]    w_q_coord_x_sq;
            wire    signed  [31 : 0]    w_q_coord_y_sq;
            wire    signed  [31 : 0]    w_q_L1_sq;
            wire    signed  [31 : 0]    w_q_L2_sq;
            wire    signed  [31 : 0]    w_sq_numerator;
            wire    signed  [63 : 0]    w_sq_numerator_extended;
            wire    signed  [31 : 0]    w_sq_denominator;
            wire    signed  [63 : 0]    w_cos_theta_2_temp;
            wire    signed  [15 : 0]    w_cos_theta_2;

    ////////////////////////////////////////////////////////////////////////
    // Mapping Binary Format to Q8.8 Format

        Q8_8_Mapper                         Q_COORD_X(
            .i_binVal                       (i_coord_x),
            .o_qVal                         (w_q_coord_x)
        );
        
        Q8_8_Mapper                         Q_COORD_Y(
            .i_binVal                       (i_coord_y),
            .o_qVal                         (w_q_coord_y)
        );
        
        Q8_8_Mapper                         Q_L1(
            .i_binVal                       (L1),
            .o_qVal                         (w_q_L1)
        );
        
        Q8_8_Mapper                         Q_L2(
            .i_binVal                       (L2),
            .o_qVal                         (w_q_L2)
        );

    ////////////////////////////////////////////////////////////////////////
    // Calculating T1 = cos(Theta2) = (x^2 + y^2 - L1^2 - L2^2) / (2 * L1 * L2)
        assign w_q_coord_x_sq           = w_q_coord_x*w_q_coord_x;
        assign w_q_coord_y_sq           = w_q_coord_y*w_q_coord_y;

        assign w_q_L1_sq                = w_q_L1*w_q_L1;
        assign w_q_L2_sq                = w_q_L2*w_q_L2;

        assign w_sq_numerator           = w_q_coord_x_sq + w_q_coord_y_sq - w_q_L1_sq - w_q_L2_sq;
        assign w_sq_denominator         = (w_q_L1 * w_q_L2) << 1;
        assign w_sq_numerator_extended  = w_sq_numerator << 16;

        assign w_cos_theta_2_temp       = (w_sq_denominator != 0) ? (w_sq_numerator_extended / w_sq_denominator) : (0);
        assign w_cos_theta_2            = w_cos_theta_2_temp[23 : 8];

    ////////////////////////////////////////////////////////////////////////
    // Calculating Theta2 = arccos(T1)

                wire    signed  [15 : 0]    w_q_theta_2_rad;

        arccos_LUT                          ARCCOS(
            .i_reset                        (i_reset),
            .i_cosVal_q8_8                  (w_cos_theta_2),
            .o_radVal_q8_8                  (w_q_theta_2_rad)
        );

    ////////////////////////////////////////////////////////////////////////
    // Calculating sin(Theta2)

                wire    signed  [15 : 0]    w_q_sin_theta_2;

        sin_LUT                             SIN(
            .i_reset                        (i_reset),
            .i_radVal_q8_8                  (w_q_theta_2_rad),
            .o_sinVal_q8_8                  (w_q_sin_theta_2)
        );

    ////////////////////////////////////////////////////////////////////////
    // Calculating Y / X

                wire    signed  [31 : 0]    w_q_coord_y_extended;
                wire    signed  [31 : 0]    w_q_y_over_x_temp;
                wire    signed  [15 : 0]    w_q_y_over_x;

        assign w_q_coord_y_extended = (w_q_coord_y << 16);
        assign w_q_y_over_x_temp = (w_q_coord_x != 0) ? (w_q_coord_y_extended / w_q_coord_x) : (0);
        assign w_q_y_over_x = w_q_y_over_x_temp[23 : 8];

    ////////////////////////////////////////////////////////////////////////
    // Calculating L2 * sin(Theta2)
    
                wire    signed  [31 : 0]    w_sin_theta_2_numerator;

        assign w_sin_theta_2_numerator = w_q_sin_theta_2 * w_q_L2;

    ////////////////////////////////////////////////////////////////////////
    // Calculating cos(Theta2) * L2 + L1
    
                wire    signed  [31 : 0]    w_cos_theta_2_denominator;
                wire    signed  [31 : 0]    w_q_L1_extended;

        assign w_q_L1_extended = w_q_L1 << 8;
        assign w_cos_theta_2_denominator = w_cos_theta_2 * w_q_L2 + w_q_L1_extended;

    ////////////////////////////////////////////////////////////////////////
    // Calculating T2 = L2 * sin(Theta2) / cos(Theta2) * L2 + L1

                wire    signed  [31 : 0]    w_T2_temp;
                wire    signed  [63 : 0]    w_sin_theta_2_numerator_extended;
                wire    signed  [15 : 0]    w_T2;

        assign w_sin_theta_2_numerator_extended = w_sin_theta_2_numerator << 16;
        assign w_T2_temp = w_sin_theta_2_numerator_extended / w_cos_theta_2_denominator;
        assign w_T2 = w_T2_temp[23 : 8];
    
    ////////////////////////////////////////////////////////////////////////
    // Calculating arcTan(Y / X)

                wire    signed  [15 : 0]    w_arctan_y_over_x;

        arctan_LUT                          ARCTAN_Y_OVER_X(
            .i_reset                        (i_reset),
            .i_tanVal_q8_8                  (w_q_y_over_x),
            .o_radVal_q8_8                  (w_arctan_y_over_x)
        );

    ////////////////////////////////////////////////////////////////////////
    // Calculating arcTan(T2) = arcTan(L2 * sin(Theta2) / (cos(Theta2) * L2 + L1))

                wire    signed  [15 : 0]    w_arctan_T2;
    
        arctan_LUT                          ARCTAN_T2(
            .i_reset                        (i_reset),
            .i_tanVal_q8_8                  (w_T2),
            .o_radVal_q8_8                  (w_arctan_T2)
        );

    ////////////////////////////////////////////////////////////////////////
    // Calculating Theta1 = arcTan(Y / X) - arcTan(L2 * sin(Theta2) / (cos(Theta2) * L2 + L1))

                wire    signed  [15 : 0]    w_q_theta_1_rad;

        assign w_q_theta_1_rad = w_arctan_y_over_x - w_arctan_T2;

    ////////////////////////////////////////////////////////////////////////
    // Mapping radian to degree, deg = rad * 180 / PI = rad * 57.29296875

                wire    signed  [63 : 0]    w_q_theta_1_deg_temp;
                wire    signed  [63 : 0]    w_q_theta_2_deg_temp;

                wire    signed  [31 : 0]    w_q_theta_1_deg;
                wire    signed  [31 : 0]    w_q_theta_2_deg;

        assign w_q_theta_1_deg_temp = w_q_theta_1_rad * Q_RAD_2_DEG << 16;
        assign w_q_theta_2_deg_temp = w_q_theta_2_rad * Q_RAD_2_DEG << 16;

        assign w_q_theta_1_deg = {w_q_theta_1_deg_temp[63 - 16 -: 16], w_q_theta_1_deg_temp[31 -: 16]};
        assign w_q_theta_2_deg = {w_q_theta_2_deg_temp[63 - 16 -: 16], w_q_theta_2_deg_temp[31 -: 16]};

    ////////////////////////////////////////////////////////////////////////
    // Mapping Degree of Q Value to Degree of Decimal Value

                wire    signed  [15 : 0]    w_theta_1_deg;
                wire    signed  [15 : 0]    w_theta_2_deg;

        BIN_Mapper                              #(
            .INTEGER_WIDTH                      (16)
        )                                       THETA_1_Q_TO_BIN(
            .i_qVal                             (w_q_theta_1_deg),
            .o_binVal                           (w_theta_1_deg)
        );
        
        BIN_Mapper                              #(
            .INTEGER_WIDTH                      (16)
        )                                       THETA_2_Q_TO_BIN(
            .i_qVal                             (w_q_theta_2_deg),
            .o_binVal                           (w_theta_2_deg)
        );

    assign o_q_theta_1 = w_q_theta_1_deg;
    assign o_q_theta_2 = w_q_theta_2_deg;
    ////////////////////////////////////////////////////////////////////////
endmodule