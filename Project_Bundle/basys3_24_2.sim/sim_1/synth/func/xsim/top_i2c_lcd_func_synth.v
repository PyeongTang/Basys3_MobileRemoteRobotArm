// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Aug 14 14:09:31 2024
// Host        : LeeJP running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/work/Harman_4_LJP/Basys3/basys3_24_2/basys3_24_2.sim/sim_1/synth/func/xsim/top_i2c_lcd_func_synth.v
// Design      : top_i2c_lcd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module buttonControl
   (r_init_flag_reg,
    \present_state_reg[1] ,
    \present_state_reg[1]_0 ,
    CLK,
    AR,
    i_btn_u_IBUF,
    r_init_flag,
    Q,
    D,
    r_count_usec_reg,
    \next_state_reg[0] ,
    \next_state_reg[0]_0 ,
    \next_state_reg[0]_1 ,
    \next_state_reg[0]_2 );
  output r_init_flag_reg;
  output \present_state_reg[1] ;
  output \present_state_reg[1]_0 ;
  input CLK;
  input [0:0]AR;
  input i_btn_u_IBUF;
  input r_init_flag;
  input [2:0]Q;
  input [2:0]D;
  input [0:0]r_count_usec_reg;
  input \next_state_reg[0] ;
  input \next_state_reg[0]_0 ;
  input \next_state_reg[0]_1 ;
  input \next_state_reg[0]_2 ;

  wire [0:0]AR;
  wire CLK;
  wire [2:0]D;
  wire [2:0]Q;
  wire i_btn_u_IBUF;
  wire i_cp;
  wire \next_state_reg[0] ;
  wire \next_state_reg[0]_0 ;
  wire \next_state_reg[0]_1 ;
  wire \next_state_reg[0]_2 ;
  wire \present_state_reg[1] ;
  wire \present_state_reg[1]_0 ;
  wire [0:0]r_count_usec_reg;
  wire r_debounced_btn;
  wire \r_delay_counter[0]_i_2_n_0 ;
  wire r_delay_counter_posedge;
  wire \r_delay_counter_reg[0]_i_1_n_0 ;
  wire \r_delay_counter_reg[0]_i_1_n_1 ;
  wire \r_delay_counter_reg[0]_i_1_n_2 ;
  wire \r_delay_counter_reg[0]_i_1_n_3 ;
  wire \r_delay_counter_reg[0]_i_1_n_4 ;
  wire \r_delay_counter_reg[0]_i_1_n_5 ;
  wire \r_delay_counter_reg[0]_i_1_n_6 ;
  wire \r_delay_counter_reg[0]_i_1_n_7 ;
  wire \r_delay_counter_reg[12]_i_1_n_0 ;
  wire \r_delay_counter_reg[12]_i_1_n_1 ;
  wire \r_delay_counter_reg[12]_i_1_n_2 ;
  wire \r_delay_counter_reg[12]_i_1_n_3 ;
  wire \r_delay_counter_reg[12]_i_1_n_4 ;
  wire \r_delay_counter_reg[12]_i_1_n_5 ;
  wire \r_delay_counter_reg[12]_i_1_n_6 ;
  wire \r_delay_counter_reg[12]_i_1_n_7 ;
  wire \r_delay_counter_reg[16]_i_1_n_7 ;
  wire \r_delay_counter_reg[4]_i_1_n_0 ;
  wire \r_delay_counter_reg[4]_i_1_n_1 ;
  wire \r_delay_counter_reg[4]_i_1_n_2 ;
  wire \r_delay_counter_reg[4]_i_1_n_3 ;
  wire \r_delay_counter_reg[4]_i_1_n_4 ;
  wire \r_delay_counter_reg[4]_i_1_n_5 ;
  wire \r_delay_counter_reg[4]_i_1_n_6 ;
  wire \r_delay_counter_reg[4]_i_1_n_7 ;
  wire \r_delay_counter_reg[8]_i_1_n_0 ;
  wire \r_delay_counter_reg[8]_i_1_n_1 ;
  wire \r_delay_counter_reg[8]_i_1_n_2 ;
  wire \r_delay_counter_reg[8]_i_1_n_3 ;
  wire \r_delay_counter_reg[8]_i_1_n_4 ;
  wire \r_delay_counter_reg[8]_i_1_n_5 ;
  wire \r_delay_counter_reg[8]_i_1_n_6 ;
  wire \r_delay_counter_reg[8]_i_1_n_7 ;
  wire \r_delay_counter_reg_n_0_[0] ;
  wire \r_delay_counter_reg_n_0_[10] ;
  wire \r_delay_counter_reg_n_0_[11] ;
  wire \r_delay_counter_reg_n_0_[12] ;
  wire \r_delay_counter_reg_n_0_[13] ;
  wire \r_delay_counter_reg_n_0_[14] ;
  wire \r_delay_counter_reg_n_0_[15] ;
  wire \r_delay_counter_reg_n_0_[1] ;
  wire \r_delay_counter_reg_n_0_[2] ;
  wire \r_delay_counter_reg_n_0_[3] ;
  wire \r_delay_counter_reg_n_0_[4] ;
  wire \r_delay_counter_reg_n_0_[5] ;
  wire \r_delay_counter_reg_n_0_[6] ;
  wire \r_delay_counter_reg_n_0_[7] ;
  wire \r_delay_counter_reg_n_0_[8] ;
  wire \r_delay_counter_reg_n_0_[9] ;
  wire r_init_flag;
  wire r_init_flag_reg;
  wire [3:0]\NLW_r_delay_counter_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_r_delay_counter_reg[16]_i_1_O_UNCONNECTED ;

  edge_detector_n_7 ED_BTN
       (.AR(AR),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .\next_state_reg[0] (\next_state_reg[0] ),
        .\next_state_reg[0]_0 (\next_state_reg[0]_0 ),
        .\next_state_reg[0]_1 (\next_state_reg[0]_1 ),
        .\next_state_reg[0]_2 (\next_state_reg[0]_2 ),
        .\present_state_reg[1] (\present_state_reg[1] ),
        .\present_state_reg[1]_0 (\present_state_reg[1]_0 ),
        .r_count_usec_reg(r_count_usec_reg),
        .r_debounced_btn(r_debounced_btn),
        .r_init_flag(r_init_flag),
        .r_init_flag_reg(r_init_flag_reg));
  edge_detector_n_8 ED_DELAY_COUNTER
       (.AR(AR),
        .CLK(CLK),
        .S(i_cp),
        .r_delay_counter_posedge(r_delay_counter_posedge));
  FDCE #(
    .INIT(1'b0)) 
    r_debounced_btn_reg
       (.C(CLK),
        .CE(r_delay_counter_posedge),
        .CLR(AR),
        .D(i_btn_u_IBUF),
        .Q(r_debounced_btn));
  LUT1 #(
    .INIT(2'h1)) 
    \r_delay_counter[0]_i_2 
       (.I0(\r_delay_counter_reg_n_0_[0] ),
        .O(\r_delay_counter[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[0]_i_1_n_7 ),
        .Q(\r_delay_counter_reg_n_0_[0] ),
        .R(1'b0));
  CARRY4 \r_delay_counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\r_delay_counter_reg[0]_i_1_n_0 ,\r_delay_counter_reg[0]_i_1_n_1 ,\r_delay_counter_reg[0]_i_1_n_2 ,\r_delay_counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\r_delay_counter_reg[0]_i_1_n_4 ,\r_delay_counter_reg[0]_i_1_n_5 ,\r_delay_counter_reg[0]_i_1_n_6 ,\r_delay_counter_reg[0]_i_1_n_7 }),
        .S({\r_delay_counter_reg_n_0_[3] ,\r_delay_counter_reg_n_0_[2] ,\r_delay_counter_reg_n_0_[1] ,\r_delay_counter[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[8]_i_1_n_5 ),
        .Q(\r_delay_counter_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[8]_i_1_n_4 ),
        .Q(\r_delay_counter_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[12]_i_1_n_7 ),
        .Q(\r_delay_counter_reg_n_0_[12] ),
        .R(1'b0));
  CARRY4 \r_delay_counter_reg[12]_i_1 
       (.CI(\r_delay_counter_reg[8]_i_1_n_0 ),
        .CO({\r_delay_counter_reg[12]_i_1_n_0 ,\r_delay_counter_reg[12]_i_1_n_1 ,\r_delay_counter_reg[12]_i_1_n_2 ,\r_delay_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_delay_counter_reg[12]_i_1_n_4 ,\r_delay_counter_reg[12]_i_1_n_5 ,\r_delay_counter_reg[12]_i_1_n_6 ,\r_delay_counter_reg[12]_i_1_n_7 }),
        .S({\r_delay_counter_reg_n_0_[15] ,\r_delay_counter_reg_n_0_[14] ,\r_delay_counter_reg_n_0_[13] ,\r_delay_counter_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[12]_i_1_n_6 ),
        .Q(\r_delay_counter_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[12]_i_1_n_5 ),
        .Q(\r_delay_counter_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[12]_i_1_n_4 ),
        .Q(\r_delay_counter_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[16]_i_1_n_7 ),
        .Q(i_cp),
        .R(1'b0));
  CARRY4 \r_delay_counter_reg[16]_i_1 
       (.CI(\r_delay_counter_reg[12]_i_1_n_0 ),
        .CO(\NLW_r_delay_counter_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_r_delay_counter_reg[16]_i_1_O_UNCONNECTED [3:1],\r_delay_counter_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,i_cp}));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[0]_i_1_n_6 ),
        .Q(\r_delay_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[0]_i_1_n_5 ),
        .Q(\r_delay_counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[0]_i_1_n_4 ),
        .Q(\r_delay_counter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[4]_i_1_n_7 ),
        .Q(\r_delay_counter_reg_n_0_[4] ),
        .R(1'b0));
  CARRY4 \r_delay_counter_reg[4]_i_1 
       (.CI(\r_delay_counter_reg[0]_i_1_n_0 ),
        .CO({\r_delay_counter_reg[4]_i_1_n_0 ,\r_delay_counter_reg[4]_i_1_n_1 ,\r_delay_counter_reg[4]_i_1_n_2 ,\r_delay_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_delay_counter_reg[4]_i_1_n_4 ,\r_delay_counter_reg[4]_i_1_n_5 ,\r_delay_counter_reg[4]_i_1_n_6 ,\r_delay_counter_reg[4]_i_1_n_7 }),
        .S({\r_delay_counter_reg_n_0_[7] ,\r_delay_counter_reg_n_0_[6] ,\r_delay_counter_reg_n_0_[5] ,\r_delay_counter_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[4]_i_1_n_6 ),
        .Q(\r_delay_counter_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[4]_i_1_n_5 ),
        .Q(\r_delay_counter_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[4]_i_1_n_4 ),
        .Q(\r_delay_counter_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[8]_i_1_n_7 ),
        .Q(\r_delay_counter_reg_n_0_[8] ),
        .R(1'b0));
  CARRY4 \r_delay_counter_reg[8]_i_1 
       (.CI(\r_delay_counter_reg[4]_i_1_n_0 ),
        .CO({\r_delay_counter_reg[8]_i_1_n_0 ,\r_delay_counter_reg[8]_i_1_n_1 ,\r_delay_counter_reg[8]_i_1_n_2 ,\r_delay_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\r_delay_counter_reg[8]_i_1_n_4 ,\r_delay_counter_reg[8]_i_1_n_5 ,\r_delay_counter_reg[8]_i_1_n_6 ,\r_delay_counter_reg[8]_i_1_n_7 }),
        .S({\r_delay_counter_reg_n_0_[11] ,\r_delay_counter_reg_n_0_[10] ,\r_delay_counter_reg_n_0_[9] ,\r_delay_counter_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \r_delay_counter_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_delay_counter_reg[8]_i_1_n_6 ),
        .Q(\r_delay_counter_reg_n_0_[9] ),
        .R(1'b0));
endmodule

module clock_div_100
   (O,
    r_cp_z_reg,
    r_cp_z_reg_0,
    r_cp_z_reg_1,
    r_cp_z_reg_2,
    r_cp_z_reg_3,
    r_cp_z_reg_4,
    CLK,
    AR,
    r_count_usec_reg,
    r_en_count_usec);
  output [3:0]O;
  output [3:0]r_cp_z_reg;
  output [3:0]r_cp_z_reg_0;
  output [3:0]r_cp_z_reg_1;
  output [3:0]r_cp_z_reg_2;
  output [1:0]r_cp_z_reg_3;
  output r_cp_z_reg_4;
  input CLK;
  input [0:0]AR;
  input [21:0]r_count_usec_reg;
  input r_en_count_usec;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]O;
  wire [4:0]p_0_in;
  wire \r_count[4]_i_2_n_0 ;
  wire \r_count[5]_i_1_n_0 ;
  wire \r_count[6]_i_1_n_0 ;
  wire \r_count[6]_i_2_n_0 ;
  wire [6:0]r_count_reg;
  wire [21:0]r_count_usec_reg;
  wire [3:0]r_cp_z_reg;
  wire [3:0]r_cp_z_reg_0;
  wire [3:0]r_cp_z_reg_1;
  wire [3:0]r_cp_z_reg_2;
  wire [1:0]r_cp_z_reg_3;
  wire r_cp_z_reg_4;
  wire r_en_count_usec;

  edge_detector_n ED_OUTPUT_TICK
       (.AR(AR),
        .CLK(CLK),
        .O(O),
        .Q(r_count_reg[6:1]),
        .r_count_usec_reg(r_count_usec_reg),
        .r_cp_z_reg_0(r_cp_z_reg),
        .r_cp_z_reg_1(r_cp_z_reg_0),
        .r_cp_z_reg_2(r_cp_z_reg_1),
        .r_cp_z_reg_3(r_cp_z_reg_2),
        .r_cp_z_reg_4(r_cp_z_reg_3),
        .r_cp_z_reg_5(r_cp_z_reg_4),
        .r_en_count_usec(r_en_count_usec));
  LUT2 #(
    .INIT(4'h1)) 
    \r_count[0]_i_1 
       (.I0(r_count_reg[0]),
        .I1(\r_count[4]_i_2_n_0 ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \r_count[1]_i_1 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(\r_count[4]_i_2_n_0 ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \r_count[2]_i_1 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .I2(r_count_reg[2]),
        .I3(\r_count[4]_i_2_n_0 ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \r_count[3]_i_1 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[3]),
        .I4(\r_count[4]_i_2_n_0 ),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \r_count[4]_i_1 
       (.I0(r_count_reg[2]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[1]),
        .I3(r_count_reg[3]),
        .I4(r_count_reg[4]),
        .I5(\r_count[4]_i_2_n_0 ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'hFEFF000000000000)) 
    \r_count[4]_i_2 
       (.I0(r_count_reg[4]),
        .I1(r_count_reg[3]),
        .I2(r_count_reg[2]),
        .I3(\r_count[6]_i_2_n_0 ),
        .I4(r_count_reg[6]),
        .I5(r_count_reg[5]),
        .O(\r_count[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h515555750C000000)) 
    \r_count[5]_i_1 
       (.I0(r_count_reg[6]),
        .I1(r_count_reg[3]),
        .I2(\r_count[6]_i_2_n_0 ),
        .I3(r_count_reg[2]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[5]),
        .O(\r_count[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF04FF20000000)) 
    \r_count[6]_i_1 
       (.I0(r_count_reg[3]),
        .I1(\r_count[6]_i_2_n_0 ),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[5]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[6]),
        .O(\r_count[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \r_count[6]_i_2 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .O(\r_count[6]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[0]),
        .Q(r_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[1]),
        .Q(r_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[2]),
        .Q(r_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[3]),
        .Q(r_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[4]),
        .Q(r_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[5]_i_1_n_0 ),
        .Q(r_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[6]_i_1_n_0 ),
        .Q(r_count_reg[6]));
endmodule

(* ORIG_REF_NAME = "clock_div_100" *) 
module clock_div_100_1
   (O,
    r_cp_z_reg,
    r_cp_z_reg_0,
    r_cp_z_reg_1,
    r_cp_z_reg_2,
    r_cp_z_reg_3,
    r_cp_z_reg_4,
    CLK,
    AR,
    r_count_usec_reg,
    r_i2c_start);
  output [3:0]O;
  output [3:0]r_cp_z_reg;
  output [3:0]r_cp_z_reg_0;
  output [3:0]r_cp_z_reg_1;
  output [3:0]r_cp_z_reg_2;
  output [1:0]r_cp_z_reg_3;
  output r_cp_z_reg_4;
  input CLK;
  input [0:0]AR;
  input [21:0]r_count_usec_reg;
  input r_i2c_start;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]O;
  wire [4:0]p_0_in__0;
  wire \r_count[4]_i_2__0_n_0 ;
  wire \r_count[5]_i_1__0_n_0 ;
  wire \r_count[6]_i_1__0_n_0 ;
  wire \r_count[6]_i_2__0_n_0 ;
  wire [6:0]r_count_reg;
  wire [21:0]r_count_usec_reg;
  wire [3:0]r_cp_z_reg;
  wire [3:0]r_cp_z_reg_0;
  wire [3:0]r_cp_z_reg_1;
  wire [3:0]r_cp_z_reg_2;
  wire [1:0]r_cp_z_reg_3;
  wire r_cp_z_reg_4;
  wire r_i2c_start;

  edge_detector_n_2 ED_OUTPUT_TICK
       (.AR(AR),
        .CLK(CLK),
        .O(O),
        .Q(r_count_reg[6:1]),
        .r_count_usec_reg(r_count_usec_reg),
        .r_cp_z_reg_0(r_cp_z_reg),
        .r_cp_z_reg_1(r_cp_z_reg_0),
        .r_cp_z_reg_2(r_cp_z_reg_1),
        .r_cp_z_reg_3(r_cp_z_reg_2),
        .r_cp_z_reg_4(r_cp_z_reg_3),
        .r_cp_z_reg_5(r_cp_z_reg_4),
        .r_i2c_start(r_i2c_start));
  LUT2 #(
    .INIT(4'h1)) 
    \r_count[0]_i_1__0 
       (.I0(r_count_reg[0]),
        .I1(\r_count[4]_i_2__0_n_0 ),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \r_count[1]_i_1__0 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(\r_count[4]_i_2__0_n_0 ),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \r_count[2]_i_1__0 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .I2(r_count_reg[2]),
        .I3(\r_count[4]_i_2__0_n_0 ),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \r_count[3]_i_1__0 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[3]),
        .I4(\r_count[4]_i_2__0_n_0 ),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \r_count[4]_i_1__0 
       (.I0(r_count_reg[2]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[1]),
        .I3(r_count_reg[3]),
        .I4(r_count_reg[4]),
        .I5(\r_count[4]_i_2__0_n_0 ),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'hFEFF000000000000)) 
    \r_count[4]_i_2__0 
       (.I0(r_count_reg[4]),
        .I1(r_count_reg[3]),
        .I2(r_count_reg[2]),
        .I3(\r_count[6]_i_2__0_n_0 ),
        .I4(r_count_reg[6]),
        .I5(r_count_reg[5]),
        .O(\r_count[4]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h515555750C000000)) 
    \r_count[5]_i_1__0 
       (.I0(r_count_reg[6]),
        .I1(r_count_reg[3]),
        .I2(\r_count[6]_i_2__0_n_0 ),
        .I3(r_count_reg[2]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[5]),
        .O(\r_count[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00FF04FF20000000)) 
    \r_count[6]_i_1__0 
       (.I0(r_count_reg[3]),
        .I1(\r_count[6]_i_2__0_n_0 ),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[5]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[6]),
        .O(\r_count[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \r_count[6]_i_2__0 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .O(\r_count[6]_i_2__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__0[0]),
        .Q(r_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__0[1]),
        .Q(r_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__0[2]),
        .Q(r_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__0[3]),
        .Q(r_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__0[4]),
        .Q(r_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[5]_i_1__0_n_0 ),
        .Q(r_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[6]_i_1__0_n_0 ),
        .Q(r_count_reg[6]));
endmodule

(* ORIG_REF_NAME = "clock_div_100" *) 
module clock_div_100_5
   (r_cp,
    r_cp_z,
    \r_count_usec_5_tick_reg[2] ,
    CLK,
    AR,
    r_count_usec_5_tick,
    r_scl_reg,
    o_scl_OBUF);
  output r_cp;
  output r_cp_z;
  output \r_count_usec_5_tick_reg[2] ;
  input CLK;
  input [0:0]AR;
  input [0:0]r_count_usec_5_tick;
  input r_scl_reg;
  input o_scl_OBUF;

  wire [0:0]AR;
  wire CLK;
  wire o_scl_OBUF;
  wire [4:0]p_0_in__1;
  wire \r_count[4]_i_2__1_n_0 ;
  wire \r_count[5]_i_1__1_n_0 ;
  wire \r_count[6]_i_1__1_n_0 ;
  wire \r_count[6]_i_2__1_n_0 ;
  wire [6:0]r_count_reg;
  wire [0:0]r_count_usec_5_tick;
  wire \r_count_usec_5_tick_reg[2] ;
  wire r_cp;
  wire r_cp_z;
  wire r_scl_reg;

  edge_detector_n_6 ED_OUTPUT_TICK
       (.AR(AR),
        .CLK(CLK),
        .Q(r_count_reg[6:1]),
        .o_scl_OBUF(o_scl_OBUF),
        .r_count_usec_5_tick(r_count_usec_5_tick),
        .\r_count_usec_5_tick_reg[2] (\r_count_usec_5_tick_reg[2] ),
        .r_cp(r_cp),
        .r_cp_z(r_cp_z),
        .r_scl_reg(r_scl_reg));
  LUT2 #(
    .INIT(4'h1)) 
    \r_count[0]_i_1__1 
       (.I0(r_count_reg[0]),
        .I1(\r_count[4]_i_2__1_n_0 ),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \r_count[1]_i_1__1 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(\r_count[4]_i_2__1_n_0 ),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \r_count[2]_i_1__1 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .I2(r_count_reg[2]),
        .I3(\r_count[4]_i_2__1_n_0 ),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \r_count[3]_i_1__1 
       (.I0(r_count_reg[1]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[3]),
        .I4(\r_count[4]_i_2__1_n_0 ),
        .O(p_0_in__1[3]));
  LUT6 #(
    .INIT(64'h000000007FFF8000)) 
    \r_count[4]_i_1__1 
       (.I0(r_count_reg[2]),
        .I1(r_count_reg[0]),
        .I2(r_count_reg[1]),
        .I3(r_count_reg[3]),
        .I4(r_count_reg[4]),
        .I5(\r_count[4]_i_2__1_n_0 ),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'hFEFF000000000000)) 
    \r_count[4]_i_2__1 
       (.I0(r_count_reg[4]),
        .I1(r_count_reg[3]),
        .I2(r_count_reg[2]),
        .I3(\r_count[6]_i_2__1_n_0 ),
        .I4(r_count_reg[6]),
        .I5(r_count_reg[5]),
        .O(\r_count[4]_i_2__1_n_0 ));
  LUT6 #(
    .INIT(64'h515555750C000000)) 
    \r_count[5]_i_1__1 
       (.I0(r_count_reg[6]),
        .I1(r_count_reg[3]),
        .I2(\r_count[6]_i_2__1_n_0 ),
        .I3(r_count_reg[2]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[5]),
        .O(\r_count[5]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF04FF20000000)) 
    \r_count[6]_i_1__1 
       (.I0(r_count_reg[3]),
        .I1(\r_count[6]_i_2__1_n_0 ),
        .I2(r_count_reg[2]),
        .I3(r_count_reg[5]),
        .I4(r_count_reg[4]),
        .I5(r_count_reg[6]),
        .O(\r_count[6]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \r_count[6]_i_2__1 
       (.I0(r_count_reg[0]),
        .I1(r_count_reg[1]),
        .O(\r_count[6]_i_2__1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__1[0]),
        .Q(r_count_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__1[1]),
        .Q(r_count_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__1[2]),
        .Q(r_count_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__1[3]),
        .Q(r_count_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in__1[4]),
        .Q(r_count_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[5]_i_1__1_n_0 ),
        .Q(r_count_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count[6]_i_1__1_n_0 ),
        .Q(r_count_reg[6]));
endmodule

module edge_detector_n
   (O,
    r_cp_z_reg_0,
    r_cp_z_reg_1,
    r_cp_z_reg_2,
    r_cp_z_reg_3,
    r_cp_z_reg_4,
    r_cp_z_reg_5,
    CLK,
    AR,
    r_count_usec_reg,
    r_en_count_usec,
    Q);
  output [3:0]O;
  output [3:0]r_cp_z_reg_0;
  output [3:0]r_cp_z_reg_1;
  output [3:0]r_cp_z_reg_2;
  output [3:0]r_cp_z_reg_3;
  output [1:0]r_cp_z_reg_4;
  output r_cp_z_reg_5;
  input CLK;
  input [0:0]AR;
  input [21:0]r_count_usec_reg;
  input r_en_count_usec;
  input [5:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]O;
  wire [5:0]Q;
  wire p_0_out;
  wire \r_count_usec[0]_i_3__0_n_0 ;
  wire \r_count_usec[0]_i_4__0_n_0 ;
  wire \r_count_usec[0]_i_5__0_n_0 ;
  wire \r_count_usec[0]_i_6__0_n_0 ;
  wire \r_count_usec[0]_i_7__0_n_0 ;
  wire \r_count_usec[12]_i_2__0_n_0 ;
  wire \r_count_usec[12]_i_3__0_n_0 ;
  wire \r_count_usec[12]_i_4__0_n_0 ;
  wire \r_count_usec[12]_i_5__0_n_0 ;
  wire \r_count_usec[16]_i_2__0_n_0 ;
  wire \r_count_usec[16]_i_3__0_n_0 ;
  wire \r_count_usec[16]_i_4__0_n_0 ;
  wire \r_count_usec[16]_i_5__0_n_0 ;
  wire \r_count_usec[20]_i_2__0_n_0 ;
  wire \r_count_usec[20]_i_3__0_n_0 ;
  wire \r_count_usec[4]_i_2__0_n_0 ;
  wire \r_count_usec[4]_i_3__0_n_0 ;
  wire \r_count_usec[4]_i_4__0_n_0 ;
  wire \r_count_usec[4]_i_5__0_n_0 ;
  wire \r_count_usec[8]_i_2__0_n_0 ;
  wire \r_count_usec[8]_i_3__0_n_0 ;
  wire \r_count_usec[8]_i_4__0_n_0 ;
  wire \r_count_usec[8]_i_5__0_n_0 ;
  wire [21:0]r_count_usec_reg;
  wire \r_count_usec_reg[0]_i_2__0_n_0 ;
  wire \r_count_usec_reg[0]_i_2__0_n_1 ;
  wire \r_count_usec_reg[0]_i_2__0_n_2 ;
  wire \r_count_usec_reg[0]_i_2__0_n_3 ;
  wire \r_count_usec_reg[12]_i_1__0_n_0 ;
  wire \r_count_usec_reg[12]_i_1__0_n_1 ;
  wire \r_count_usec_reg[12]_i_1__0_n_2 ;
  wire \r_count_usec_reg[12]_i_1__0_n_3 ;
  wire \r_count_usec_reg[16]_i_1__0_n_0 ;
  wire \r_count_usec_reg[16]_i_1__0_n_1 ;
  wire \r_count_usec_reg[16]_i_1__0_n_2 ;
  wire \r_count_usec_reg[16]_i_1__0_n_3 ;
  wire \r_count_usec_reg[20]_i_1__0_n_3 ;
  wire \r_count_usec_reg[4]_i_1__0_n_0 ;
  wire \r_count_usec_reg[4]_i_1__0_n_1 ;
  wire \r_count_usec_reg[4]_i_1__0_n_2 ;
  wire \r_count_usec_reg[4]_i_1__0_n_3 ;
  wire \r_count_usec_reg[8]_i_1__0_n_0 ;
  wire \r_count_usec_reg[8]_i_1__0_n_1 ;
  wire \r_count_usec_reg[8]_i_1__0_n_2 ;
  wire \r_count_usec_reg[8]_i_1__0_n_3 ;
  wire r_cp;
  wire r_cp_z;
  wire [3:0]r_cp_z_reg_0;
  wire [3:0]r_cp_z_reg_1;
  wire [3:0]r_cp_z_reg_2;
  wire [3:0]r_cp_z_reg_3;
  wire [1:0]r_cp_z_reg_4;
  wire r_cp_z_reg_5;
  wire r_en_count_usec;
  wire [3:1]\NLW_r_count_usec_reg[20]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_r_count_usec_reg[20]_i_1__0_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h4F)) 
    \r_count_usec[0]_i_1__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_en_count_usec),
        .O(r_cp_z_reg_5));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[0]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[0]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_4__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[3]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[0]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_5__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[2]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[0]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_6__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[1]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[0]_i_6__0_n_0 ));
  LUT4 #(
    .INIT(16'hDF00)) 
    \r_count_usec[0]_i_7__0 
       (.I0(r_count_usec_reg[0]),
        .I1(r_cp_z),
        .I2(r_cp),
        .I3(r_en_count_usec),
        .O(\r_count_usec[0]_i_7__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_2__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[15]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[12]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[14]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[12]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_4__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[13]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[12]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_5__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[12]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[12]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_2__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[19]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[16]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[18]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[16]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_4__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[17]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[16]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_5__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[16]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[16]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[20]_i_2__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[21]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[20]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[20]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[20]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[20]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_2__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[7]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[4]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[6]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[4]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_4__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[5]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[4]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_5__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[4]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[4]_i_5__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_2__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[11]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[8]_i_2__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_3__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[10]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[8]_i_3__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_4__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[9]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[8]_i_4__0_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_5__0 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[8]),
        .I3(r_en_count_usec),
        .O(\r_count_usec[8]_i_5__0_n_0 ));
  CARRY4 \r_count_usec_reg[0]_i_2__0 
       (.CI(1'b0),
        .CO({\r_count_usec_reg[0]_i_2__0_n_0 ,\r_count_usec_reg[0]_i_2__0_n_1 ,\r_count_usec_reg[0]_i_2__0_n_2 ,\r_count_usec_reg[0]_i_2__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\r_count_usec[0]_i_3__0_n_0 }),
        .O(O),
        .S({\r_count_usec[0]_i_4__0_n_0 ,\r_count_usec[0]_i_5__0_n_0 ,\r_count_usec[0]_i_6__0_n_0 ,\r_count_usec[0]_i_7__0_n_0 }));
  CARRY4 \r_count_usec_reg[12]_i_1__0 
       (.CI(\r_count_usec_reg[8]_i_1__0_n_0 ),
        .CO({\r_count_usec_reg[12]_i_1__0_n_0 ,\r_count_usec_reg[12]_i_1__0_n_1 ,\r_count_usec_reg[12]_i_1__0_n_2 ,\r_count_usec_reg[12]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_2),
        .S({\r_count_usec[12]_i_2__0_n_0 ,\r_count_usec[12]_i_3__0_n_0 ,\r_count_usec[12]_i_4__0_n_0 ,\r_count_usec[12]_i_5__0_n_0 }));
  CARRY4 \r_count_usec_reg[16]_i_1__0 
       (.CI(\r_count_usec_reg[12]_i_1__0_n_0 ),
        .CO({\r_count_usec_reg[16]_i_1__0_n_0 ,\r_count_usec_reg[16]_i_1__0_n_1 ,\r_count_usec_reg[16]_i_1__0_n_2 ,\r_count_usec_reg[16]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_3),
        .S({\r_count_usec[16]_i_2__0_n_0 ,\r_count_usec[16]_i_3__0_n_0 ,\r_count_usec[16]_i_4__0_n_0 ,\r_count_usec[16]_i_5__0_n_0 }));
  CARRY4 \r_count_usec_reg[20]_i_1__0 
       (.CI(\r_count_usec_reg[16]_i_1__0_n_0 ),
        .CO({\NLW_r_count_usec_reg[20]_i_1__0_CO_UNCONNECTED [3:1],\r_count_usec_reg[20]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_r_count_usec_reg[20]_i_1__0_O_UNCONNECTED [3:2],r_cp_z_reg_4}),
        .S({1'b0,1'b0,\r_count_usec[20]_i_2__0_n_0 ,\r_count_usec[20]_i_3__0_n_0 }));
  CARRY4 \r_count_usec_reg[4]_i_1__0 
       (.CI(\r_count_usec_reg[0]_i_2__0_n_0 ),
        .CO({\r_count_usec_reg[4]_i_1__0_n_0 ,\r_count_usec_reg[4]_i_1__0_n_1 ,\r_count_usec_reg[4]_i_1__0_n_2 ,\r_count_usec_reg[4]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_0),
        .S({\r_count_usec[4]_i_2__0_n_0 ,\r_count_usec[4]_i_3__0_n_0 ,\r_count_usec[4]_i_4__0_n_0 ,\r_count_usec[4]_i_5__0_n_0 }));
  CARRY4 \r_count_usec_reg[8]_i_1__0 
       (.CI(\r_count_usec_reg[4]_i_1__0_n_0 ),
        .CO({\r_count_usec_reg[8]_i_1__0_n_0 ,\r_count_usec_reg[8]_i_1__0_n_1 ,\r_count_usec_reg[8]_i_1__0_n_2 ,\r_count_usec_reg[8]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_1),
        .S({\r_count_usec[8]_i_2__0_n_0 ,\r_count_usec[8]_i_3__0_n_0 ,\r_count_usec[8]_i_4__0_n_0 ,\r_count_usec[8]_i_5__0_n_0 }));
  LUT6 #(
    .INIT(64'hFFFEAAAAAAAAAAAA)) 
    r_cp_i_1
       (.I0(Q[5]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(p_0_out));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_out),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_0
   (E,
    \present_state_reg[0] ,
    r_cp_reg_0,
    CLK,
    AR,
    \next_state_reg[0] ,
    r_busy_reg,
    r_busy_reg_0,
    Q,
    r_busy_reg_1);
  output [0:0]E;
  output \present_state_reg[0] ;
  input r_cp_reg_0;
  input CLK;
  input [0:0]AR;
  input \next_state_reg[0] ;
  input r_busy_reg;
  input r_busy_reg_0;
  input [1:0]Q;
  input r_busy_reg_1;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [1:0]Q;
  wire \next_state[5]_i_2_n_0 ;
  wire \next_state_reg[0] ;
  wire \present_state_reg[0] ;
  wire r_busy_i_2_n_0;
  wire r_busy_reg;
  wire r_busy_reg_0;
  wire r_busy_reg_1;
  wire r_cp;
  wire r_cp_reg_0;
  wire r_cp_z;

  LUT3 #(
    .INIT(8'hAB)) 
    \next_state[5]_i_1 
       (.I0(\next_state[5]_i_2_n_0 ),
        .I1(\next_state_reg[0] ),
        .I2(r_busy_reg),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \next_state[5]_i_2 
       (.I0(r_busy_reg_0),
        .I1(Q[1]),
        .I2(r_cp),
        .I3(r_cp_z),
        .I4(Q[0]),
        .O(\next_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFFA020A000)) 
    r_busy_i_1
       (.I0(r_busy_i_2_n_0),
        .I1(r_busy_reg),
        .I2(r_busy_reg_0),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(r_busy_reg_1),
        .O(\present_state_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    r_busy_i_2
       (.I0(Q[1]),
        .I1(r_cp),
        .I2(r_cp_z),
        .O(r_busy_i_2_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp_reg_0),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_2
   (O,
    r_cp_z_reg_0,
    r_cp_z_reg_1,
    r_cp_z_reg_2,
    r_cp_z_reg_3,
    r_cp_z_reg_4,
    r_cp_z_reg_5,
    CLK,
    AR,
    r_count_usec_reg,
    r_i2c_start,
    Q);
  output [3:0]O;
  output [3:0]r_cp_z_reg_0;
  output [3:0]r_cp_z_reg_1;
  output [3:0]r_cp_z_reg_2;
  output [3:0]r_cp_z_reg_3;
  output [1:0]r_cp_z_reg_4;
  output r_cp_z_reg_5;
  input CLK;
  input [0:0]AR;
  input [21:0]r_count_usec_reg;
  input r_i2c_start;
  input [5:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire [3:0]O;
  wire [5:0]Q;
  wire \r_count_usec[0]_i_3_n_0 ;
  wire \r_count_usec[0]_i_4_n_0 ;
  wire \r_count_usec[0]_i_5_n_0 ;
  wire \r_count_usec[0]_i_6_n_0 ;
  wire \r_count_usec[0]_i_7_n_0 ;
  wire \r_count_usec[12]_i_2_n_0 ;
  wire \r_count_usec[12]_i_3_n_0 ;
  wire \r_count_usec[12]_i_4_n_0 ;
  wire \r_count_usec[12]_i_5_n_0 ;
  wire \r_count_usec[16]_i_2_n_0 ;
  wire \r_count_usec[16]_i_3_n_0 ;
  wire \r_count_usec[16]_i_4_n_0 ;
  wire \r_count_usec[16]_i_5_n_0 ;
  wire \r_count_usec[20]_i_2_n_0 ;
  wire \r_count_usec[20]_i_3_n_0 ;
  wire \r_count_usec[4]_i_2_n_0 ;
  wire \r_count_usec[4]_i_3_n_0 ;
  wire \r_count_usec[4]_i_4_n_0 ;
  wire \r_count_usec[4]_i_5_n_0 ;
  wire \r_count_usec[8]_i_2_n_0 ;
  wire \r_count_usec[8]_i_3_n_0 ;
  wire \r_count_usec[8]_i_4_n_0 ;
  wire \r_count_usec[8]_i_5_n_0 ;
  wire [21:0]r_count_usec_reg;
  wire \r_count_usec_reg[0]_i_2_n_0 ;
  wire \r_count_usec_reg[0]_i_2_n_1 ;
  wire \r_count_usec_reg[0]_i_2_n_2 ;
  wire \r_count_usec_reg[0]_i_2_n_3 ;
  wire \r_count_usec_reg[12]_i_1_n_0 ;
  wire \r_count_usec_reg[12]_i_1_n_1 ;
  wire \r_count_usec_reg[12]_i_1_n_2 ;
  wire \r_count_usec_reg[12]_i_1_n_3 ;
  wire \r_count_usec_reg[16]_i_1_n_0 ;
  wire \r_count_usec_reg[16]_i_1_n_1 ;
  wire \r_count_usec_reg[16]_i_1_n_2 ;
  wire \r_count_usec_reg[16]_i_1_n_3 ;
  wire \r_count_usec_reg[20]_i_1_n_3 ;
  wire \r_count_usec_reg[4]_i_1_n_0 ;
  wire \r_count_usec_reg[4]_i_1_n_1 ;
  wire \r_count_usec_reg[4]_i_1_n_2 ;
  wire \r_count_usec_reg[4]_i_1_n_3 ;
  wire \r_count_usec_reg[8]_i_1_n_0 ;
  wire \r_count_usec_reg[8]_i_1_n_1 ;
  wire \r_count_usec_reg[8]_i_1_n_2 ;
  wire \r_count_usec_reg[8]_i_1_n_3 ;
  wire r_cp;
  wire r_cp_i_1__0_n_0;
  wire r_cp_z;
  wire [3:0]r_cp_z_reg_0;
  wire [3:0]r_cp_z_reg_1;
  wire [3:0]r_cp_z_reg_2;
  wire [3:0]r_cp_z_reg_3;
  wire [1:0]r_cp_z_reg_4;
  wire r_cp_z_reg_5;
  wire r_i2c_start;
  wire [3:1]\NLW_r_count_usec_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_r_count_usec_reg[20]_i_1_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h4F)) 
    \r_count_usec[0]_i_1 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_i2c_start),
        .O(r_cp_z_reg_5));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[0]),
        .I3(r_i2c_start),
        .O(\r_count_usec[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_4 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[3]),
        .I3(r_i2c_start),
        .O(\r_count_usec[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_5 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[2]),
        .I3(r_i2c_start),
        .O(\r_count_usec[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[0]_i_6 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[1]),
        .I3(r_i2c_start),
        .O(\r_count_usec[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hDF00)) 
    \r_count_usec[0]_i_7 
       (.I0(r_count_usec_reg[0]),
        .I1(r_cp_z),
        .I2(r_cp),
        .I3(r_i2c_start),
        .O(\r_count_usec[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_2 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[15]),
        .I3(r_i2c_start),
        .O(\r_count_usec[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[14]),
        .I3(r_i2c_start),
        .O(\r_count_usec[12]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_4 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[13]),
        .I3(r_i2c_start),
        .O(\r_count_usec[12]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[12]_i_5 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[12]),
        .I3(r_i2c_start),
        .O(\r_count_usec[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_2 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[19]),
        .I3(r_i2c_start),
        .O(\r_count_usec[16]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[18]),
        .I3(r_i2c_start),
        .O(\r_count_usec[16]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_4 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[17]),
        .I3(r_i2c_start),
        .O(\r_count_usec[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[16]_i_5 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[16]),
        .I3(r_i2c_start),
        .O(\r_count_usec[16]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[20]_i_2 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[21]),
        .I3(r_i2c_start),
        .O(\r_count_usec[20]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[20]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[20]),
        .I3(r_i2c_start),
        .O(\r_count_usec[20]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_2 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[7]),
        .I3(r_i2c_start),
        .O(\r_count_usec[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[6]),
        .I3(r_i2c_start),
        .O(\r_count_usec[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_4 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[5]),
        .I3(r_i2c_start),
        .O(\r_count_usec[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[4]_i_5 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[4]),
        .I3(r_i2c_start),
        .O(\r_count_usec[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_2 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[11]),
        .I3(r_i2c_start),
        .O(\r_count_usec[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_3 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[10]),
        .I3(r_i2c_start),
        .O(\r_count_usec[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_4 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[9]),
        .I3(r_i2c_start),
        .O(\r_count_usec[8]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFB00)) 
    \r_count_usec[8]_i_5 
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(r_count_usec_reg[8]),
        .I3(r_i2c_start),
        .O(\r_count_usec[8]_i_5_n_0 ));
  CARRY4 \r_count_usec_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\r_count_usec_reg[0]_i_2_n_0 ,\r_count_usec_reg[0]_i_2_n_1 ,\r_count_usec_reg[0]_i_2_n_2 ,\r_count_usec_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\r_count_usec[0]_i_3_n_0 }),
        .O(O),
        .S({\r_count_usec[0]_i_4_n_0 ,\r_count_usec[0]_i_5_n_0 ,\r_count_usec[0]_i_6_n_0 ,\r_count_usec[0]_i_7_n_0 }));
  CARRY4 \r_count_usec_reg[12]_i_1 
       (.CI(\r_count_usec_reg[8]_i_1_n_0 ),
        .CO({\r_count_usec_reg[12]_i_1_n_0 ,\r_count_usec_reg[12]_i_1_n_1 ,\r_count_usec_reg[12]_i_1_n_2 ,\r_count_usec_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_2),
        .S({\r_count_usec[12]_i_2_n_0 ,\r_count_usec[12]_i_3_n_0 ,\r_count_usec[12]_i_4_n_0 ,\r_count_usec[12]_i_5_n_0 }));
  CARRY4 \r_count_usec_reg[16]_i_1 
       (.CI(\r_count_usec_reg[12]_i_1_n_0 ),
        .CO({\r_count_usec_reg[16]_i_1_n_0 ,\r_count_usec_reg[16]_i_1_n_1 ,\r_count_usec_reg[16]_i_1_n_2 ,\r_count_usec_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_3),
        .S({\r_count_usec[16]_i_2_n_0 ,\r_count_usec[16]_i_3_n_0 ,\r_count_usec[16]_i_4_n_0 ,\r_count_usec[16]_i_5_n_0 }));
  CARRY4 \r_count_usec_reg[20]_i_1 
       (.CI(\r_count_usec_reg[16]_i_1_n_0 ),
        .CO({\NLW_r_count_usec_reg[20]_i_1_CO_UNCONNECTED [3:1],\r_count_usec_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_r_count_usec_reg[20]_i_1_O_UNCONNECTED [3:2],r_cp_z_reg_4}),
        .S({1'b0,1'b0,\r_count_usec[20]_i_2_n_0 ,\r_count_usec[20]_i_3_n_0 }));
  CARRY4 \r_count_usec_reg[4]_i_1 
       (.CI(\r_count_usec_reg[0]_i_2_n_0 ),
        .CO({\r_count_usec_reg[4]_i_1_n_0 ,\r_count_usec_reg[4]_i_1_n_1 ,\r_count_usec_reg[4]_i_1_n_2 ,\r_count_usec_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_0),
        .S({\r_count_usec[4]_i_2_n_0 ,\r_count_usec[4]_i_3_n_0 ,\r_count_usec[4]_i_4_n_0 ,\r_count_usec[4]_i_5_n_0 }));
  CARRY4 \r_count_usec_reg[8]_i_1 
       (.CI(\r_count_usec_reg[4]_i_1_n_0 ),
        .CO({\r_count_usec_reg[8]_i_1_n_0 ,\r_count_usec_reg[8]_i_1_n_1 ,\r_count_usec_reg[8]_i_1_n_2 ,\r_count_usec_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(r_cp_z_reg_1),
        .S({\r_count_usec[8]_i_2_n_0 ,\r_count_usec[8]_i_3_n_0 ,\r_count_usec[8]_i_4_n_0 ,\r_count_usec[8]_i_5_n_0 }));
  LUT6 #(
    .INIT(64'hFFFEAAAAAAAAAAAA)) 
    r_cp_i_1__0
       (.I0(Q[5]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(r_cp_i_1__0_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp_i_1__0_n_0),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_3
   (r_cp_z_reg_0,
    r_cp_reg_0,
    r_i2c_start,
    CLK,
    AR,
    Q,
    r_en_scl_reg,
    r_en_scl_reg_0,
    r_en_scl_reg_1,
    \next_state_reg[0] ,
    \next_state_reg[0]_0 ,
    \next_state_reg[0]_1 );
  output r_cp_z_reg_0;
  output r_cp_reg_0;
  input r_i2c_start;
  input CLK;
  input [0:0]AR;
  input [1:0]Q;
  input r_en_scl_reg;
  input r_en_scl_reg_0;
  input r_en_scl_reg_1;
  input \next_state_reg[0] ;
  input \next_state_reg[0]_0 ;
  input \next_state_reg[0]_1 ;

  wire [0:0]AR;
  wire CLK;
  wire [1:0]Q;
  wire \next_state_reg[0] ;
  wire \next_state_reg[0]_0 ;
  wire \next_state_reg[0]_1 ;
  wire r_cp;
  wire r_cp_reg_0;
  wire r_cp_z;
  wire r_cp_z_reg_0;
  wire r_en_scl_reg;
  wire r_en_scl_reg_0;
  wire r_en_scl_reg_1;
  wire r_i2c_start;

  LUT6 #(
    .INIT(64'h88F8000088880000)) 
    \next_state[6]_i_3 
       (.I0(\next_state_reg[0] ),
        .I1(\next_state_reg[0]_0 ),
        .I2(r_cp),
        .I3(r_cp_z),
        .I4(\next_state_reg[0]_1 ),
        .I5(Q[0]),
        .O(r_cp_reg_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_i2c_start),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
  LUT6 #(
    .INIT(64'h04FFFFFF04000000)) 
    r_en_scl_i_1
       (.I0(r_cp_z),
        .I1(r_cp),
        .I2(Q[1]),
        .I3(r_en_scl_reg),
        .I4(r_en_scl_reg_0),
        .I5(r_en_scl_reg_1),
        .O(r_cp_z_reg_0));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_4
   (r_sda_tristate_oe_reg,
    \present_state_reg[3] ,
    \present_state_reg[0] ,
    E,
    r_bit_count,
    o_scl_OBUF,
    CLK,
    AR,
    Q,
    o_sda_OBUFT_inst_i_1,
    r_sda,
    o_sda_OBUF,
    r_tx_flag_reg,
    r_tx_flag_reg_0,
    r_tx_flag_reg_1,
    \next_state_reg[0] ,
    \next_state_reg[0]_0 ,
    \next_state_reg[0]_1 ,
    r_sda_tristate_oe_reg_0,
    D,
    r_sda_tristate_oe_reg_1,
    \r_bit_count_reg[0] );
  output r_sda_tristate_oe_reg;
  output \present_state_reg[3] ;
  output \present_state_reg[0] ;
  output [0:0]E;
  output r_bit_count;
  input o_scl_OBUF;
  input CLK;
  input [0:0]AR;
  input [6:0]Q;
  input o_sda_OBUFT_inst_i_1;
  input r_sda;
  input o_sda_OBUF;
  input r_tx_flag_reg;
  input r_tx_flag_reg_0;
  input r_tx_flag_reg_1;
  input \next_state_reg[0] ;
  input \next_state_reg[0]_0 ;
  input \next_state_reg[0]_1 ;
  input r_sda_tristate_oe_reg_0;
  input [0:0]D;
  input r_sda_tristate_oe_reg_1;
  input \r_bit_count_reg[0] ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire [6:0]Q;
  wire \next_state_reg[0] ;
  wire \next_state_reg[0]_0 ;
  wire \next_state_reg[0]_1 ;
  wire o_scl_OBUF;
  wire o_sda_OBUF;
  wire o_sda_OBUFT_inst_i_1;
  wire o_sda_OBUFT_inst_i_3_n_0;
  wire o_sda_OBUFT_inst_i_4_n_0;
  wire \present_state_reg[0] ;
  wire \present_state_reg[3] ;
  wire r_bit_count;
  wire \r_bit_count_reg[0] ;
  wire r_cp;
  wire r_cp_z;
  wire r_sda;
  wire r_sda_tristate_oe_i_3_n_0;
  wire r_sda_tristate_oe_i_7_n_0;
  wire r_sda_tristate_oe_i_9_n_0;
  wire r_sda_tristate_oe_reg;
  wire r_sda_tristate_oe_reg_0;
  wire r_sda_tristate_oe_reg_1;
  wire r_tx_flag_i_3_n_0;
  wire r_tx_flag_reg;
  wire r_tx_flag_reg_0;
  wire r_tx_flag_reg_1;

  LUT5 #(
    .INIT(32'hFFFF2000)) 
    \next_state[6]_i_1 
       (.I0(\next_state_reg[0] ),
        .I1(r_cp_z),
        .I2(r_cp),
        .I3(\next_state_reg[0]_0 ),
        .I4(\next_state_reg[0]_1 ),
        .O(E));
  LUT1 #(
    .INIT(2'h1)) 
    o_sda_OBUFT_inst_i_2
       (.I0(o_sda_OBUFT_inst_i_3_n_0),
        .O(\present_state_reg[0] ));
  LUT4 #(
    .INIT(16'hEFE0)) 
    o_sda_OBUFT_inst_i_3
       (.I0(o_sda_OBUFT_inst_i_4_n_0),
        .I1(Q[0]),
        .I2(r_sda_tristate_oe_i_3_n_0),
        .I3(o_sda_OBUFT_inst_i_1),
        .O(o_sda_OBUFT_inst_i_3_n_0));
  LUT6 #(
    .INIT(64'h0000000002FE0202)) 
    o_sda_OBUFT_inst_i_4
       (.I0(r_sda_tristate_oe_reg_0),
        .I1(D),
        .I2(Q[5]),
        .I3(r_cp),
        .I4(r_cp_z),
        .I5(Q[3]),
        .O(o_sda_OBUFT_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000600000000)) 
    \r_bit_count[2]_i_2 
       (.I0(Q[2]),
        .I1(Q[4]),
        .I2(r_tx_flag_reg_0),
        .I3(\r_bit_count_reg[0] ),
        .I4(Q[0]),
        .I5(r_tx_flag_i_3_n_0),
        .O(r_bit_count));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(o_scl_OBUF),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
  LUT3 #(
    .INIT(8'hB8)) 
    r_sda_tristate_oe_i_1
       (.I0(r_sda),
        .I1(r_sda_tristate_oe_i_3_n_0),
        .I2(o_sda_OBUF),
        .O(r_sda_tristate_oe_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF03280000)) 
    r_sda_tristate_oe_i_3
       (.I0(r_sda_tristate_oe_reg_0),
        .I1(Q[6]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(r_sda_tristate_oe_reg_1),
        .I5(r_sda_tristate_oe_i_7_n_0),
        .O(r_sda_tristate_oe_i_3_n_0));
  LUT5 #(
    .INIT(32'h00020228)) 
    r_sda_tristate_oe_i_7
       (.I0(r_sda_tristate_oe_i_9_n_0),
        .I1(Q[5]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[2]),
        .O(r_sda_tristate_oe_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000004)) 
    r_sda_tristate_oe_i_9
       (.I0(Q[0]),
        .I1(r_cp_z),
        .I2(r_cp),
        .I3(Q[6]),
        .I4(Q[1]),
        .O(r_sda_tristate_oe_i_9_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000040)) 
    r_tx_flag_i_1
       (.I0(r_tx_flag_reg),
        .I1(r_tx_flag_i_3_n_0),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(r_tx_flag_reg_0),
        .I5(r_tx_flag_reg_1),
        .O(\present_state_reg[3] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    r_tx_flag_i_3
       (.I0(r_cp),
        .I1(r_cp_z),
        .O(r_tx_flag_i_3_n_0));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_6
   (r_cp,
    r_cp_z,
    \r_count_usec_5_tick_reg[2] ,
    CLK,
    AR,
    Q,
    r_count_usec_5_tick,
    r_scl_reg,
    o_scl_OBUF);
  output r_cp;
  output r_cp_z;
  output \r_count_usec_5_tick_reg[2] ;
  input CLK;
  input [0:0]AR;
  input [5:0]Q;
  input [0:0]r_count_usec_5_tick;
  input r_scl_reg;
  input o_scl_OBUF;

  wire [0:0]AR;
  wire CLK;
  wire [5:0]Q;
  wire o_scl_OBUF;
  wire [0:0]r_count_usec_5_tick;
  wire \r_count_usec_5_tick_reg[2] ;
  wire r_cp;
  wire r_cp_i_1__1_n_0;
  wire r_cp_z;
  wire r_scl_reg;

  LUT6 #(
    .INIT(64'hFFFEAAAAAAAAAAAA)) 
    r_cp_i_1__1
       (.I0(Q[5]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(r_cp_i_1__1_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp_i_1__1_n_0),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
  LUT5 #(
    .INIT(32'hF7FF08FF)) 
    r_scl_i_1
       (.I0(r_count_usec_5_tick),
        .I1(r_cp),
        .I2(r_cp_z),
        .I3(r_scl_reg),
        .I4(o_scl_OBUF),
        .O(\r_count_usec_5_tick_reg[2] ));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_7
   (r_init_flag_reg,
    \present_state_reg[1] ,
    \present_state_reg[1]_0 ,
    r_debounced_btn,
    CLK,
    AR,
    r_init_flag,
    Q,
    D,
    r_count_usec_reg,
    \next_state_reg[0] ,
    \next_state_reg[0]_0 ,
    \next_state_reg[0]_1 ,
    \next_state_reg[0]_2 );
  output r_init_flag_reg;
  output \present_state_reg[1] ;
  output \present_state_reg[1]_0 ;
  input r_debounced_btn;
  input CLK;
  input [0:0]AR;
  input r_init_flag;
  input [2:0]Q;
  input [2:0]D;
  input [0:0]r_count_usec_reg;
  input \next_state_reg[0] ;
  input \next_state_reg[0]_0 ;
  input \next_state_reg[0]_1 ;
  input \next_state_reg[0]_2 ;

  wire [0:0]AR;
  wire CLK;
  wire [2:0]D;
  wire [2:0]Q;
  wire \next_state[2]_i_2_n_0 ;
  wire \next_state[2]_i_6_n_0 ;
  wire \next_state_reg[0] ;
  wire \next_state_reg[0]_0 ;
  wire \next_state_reg[0]_1 ;
  wire \next_state_reg[0]_2 ;
  wire \present_state_reg[1] ;
  wire \present_state_reg[1]_0 ;
  wire [0:0]r_count_usec_reg;
  wire r_cp;
  wire r_cp_z;
  wire r_debounced_btn;
  wire r_init_flag;
  wire r_init_flag_reg;

  LUT4 #(
    .INIT(16'hEFE0)) 
    \next_state[0]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(\next_state[2]_i_2_n_0 ),
        .I3(D[0]),
        .O(\present_state_reg[1]_0 ));
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \next_state[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(r_init_flag),
        .I3(\next_state[2]_i_2_n_0 ),
        .I4(D[1]),
        .O(\present_state_reg[1] ));
  LUT5 #(
    .INIT(32'h02FF0200)) 
    \next_state[2]_i_1 
       (.I0(r_init_flag),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\next_state[2]_i_2_n_0 ),
        .I4(D[2]),
        .O(r_init_flag_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF200)) 
    \next_state[2]_i_2 
       (.I0(r_count_usec_reg),
        .I1(\next_state_reg[0] ),
        .I2(\next_state_reg[0]_0 ),
        .I3(\next_state_reg[0]_1 ),
        .I4(\next_state[2]_i_6_n_0 ),
        .I5(\next_state_reg[0]_2 ),
        .O(\next_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \next_state[2]_i_6 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(r_init_flag),
        .I3(r_cp_z),
        .I4(Q[0]),
        .I5(r_cp),
        .O(\next_state[2]_i_6_n_0 ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_debounced_btn),
        .Q(r_cp));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_cp),
        .Q(r_cp_z));
endmodule

(* ORIG_REF_NAME = "edge_detector_n" *) 
module edge_detector_n_8
   (r_delay_counter_posedge,
    S,
    CLK,
    AR);
  output r_delay_counter_posedge;
  input [0:0]S;
  input CLK;
  input [0:0]AR;

  wire [0:0]AR;
  wire \BTN_D_CTRL/ED_DELAY_COUNTER/r_cp ;
  wire \BTN_D_CTRL/ED_DELAY_COUNTER/r_cp_z ;
  wire CLK;
  wire [0:0]S;
  wire r_delay_counter_posedge;

  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(S),
        .Q(\BTN_D_CTRL/ED_DELAY_COUNTER/r_cp ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    r_cp_z_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\BTN_D_CTRL/ED_DELAY_COUNTER/r_cp ),
        .Q(\BTN_D_CTRL/ED_DELAY_COUNTER/r_cp_z ));
  LUT2 #(
    .INIT(4'h2)) 
    r_debounced_btn_i_1
       (.I0(\BTN_D_CTRL/ED_DELAY_COUNTER/r_cp ),
        .I1(\BTN_D_CTRL/ED_DELAY_COUNTER/r_cp_z ),
        .O(r_delay_counter_posedge));
endmodule

module i2cLcdController
   (o_scl_OBUF,
    o_sda_OBUF,
    o_led_busy_OBUF,
    \r_count_init_cmd_reg[1] ,
    \r_count_init_cmd_reg[0] ,
    r_busy_reg_0,
    E,
    \present_state_reg[0]_0 ,
    \present_state_reg[0]_1 ,
    \present_state_reg[0]_2 ,
    \present_state_reg[0]_3 ,
    \present_state_reg[0]_4 ,
    CLK,
    AR,
    r_cp_reg,
    r_count_init_cmd,
    r_init_flag_reg,
    Q,
    \r_tx_buf_reg[6]_0 ,
    data2,
    r_init_flag,
    o_sda_OBUFT_inst_i_1);
  output o_scl_OBUF;
  output o_sda_OBUF;
  output o_led_busy_OBUF;
  output \r_count_init_cmd_reg[1] ;
  output \r_count_init_cmd_reg[0] ;
  output r_busy_reg_0;
  output [0:0]E;
  output \present_state_reg[0]_0 ;
  output \present_state_reg[0]_1 ;
  output \present_state_reg[0]_2 ;
  output \present_state_reg[0]_3 ;
  output \present_state_reg[0]_4 ;
  input CLK;
  input [0:0]AR;
  input r_cp_reg;
  input [2:0]r_count_init_cmd;
  input r_init_flag_reg;
  input [2:0]Q;
  input [6:0]\r_tx_buf_reg[6]_0 ;
  input [0:0]data2;
  input r_init_flag;
  input o_sda_OBUFT_inst_i_1;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire ED_I2C_TX_n_1;
  wire [2:0]Q;
  wire USEC_TICK_n_0;
  wire USEC_TICK_n_1;
  wire USEC_TICK_n_10;
  wire USEC_TICK_n_11;
  wire USEC_TICK_n_12;
  wire USEC_TICK_n_13;
  wire USEC_TICK_n_14;
  wire USEC_TICK_n_15;
  wire USEC_TICK_n_16;
  wire USEC_TICK_n_17;
  wire USEC_TICK_n_18;
  wire USEC_TICK_n_19;
  wire USEC_TICK_n_2;
  wire USEC_TICK_n_20;
  wire USEC_TICK_n_21;
  wire USEC_TICK_n_22;
  wire USEC_TICK_n_3;
  wire USEC_TICK_n_4;
  wire USEC_TICK_n_5;
  wire USEC_TICK_n_6;
  wire USEC_TICK_n_7;
  wire USEC_TICK_n_8;
  wire USEC_TICK_n_9;
  wire [0:0]data2;
  wire next_state;
  wire \next_state[1]_i_1__0_n_0 ;
  wire \next_state[5]_i_3_n_0 ;
  wire \next_state[5]_i_4_n_0 ;
  wire \next_state[5]_i_5_n_0 ;
  wire \next_state[5]_i_6_n_0 ;
  wire \next_state[5]_i_7_n_0 ;
  wire \next_state[5]_i_8_n_0 ;
  wire \next_state_reg_n_0_[0] ;
  wire \next_state_reg_n_0_[1] ;
  wire \next_state_reg_n_0_[2] ;
  wire \next_state_reg_n_0_[3] ;
  wire \next_state_reg_n_0_[4] ;
  wire \next_state_reg_n_0_[5] ;
  wire o_led_busy_OBUF;
  wire o_scl_OBUF;
  wire o_sda_OBUF;
  wire o_sda_OBUFT_inst_i_1;
  wire [5:0]present_state;
  wire \present_state_reg[0]_0 ;
  wire \present_state_reg[0]_1 ;
  wire \present_state_reg[0]_2 ;
  wire \present_state_reg[0]_3 ;
  wire \present_state_reg[0]_4 ;
  wire r_busy_i_3_n_0;
  wire r_busy_reg_0;
  wire [2:0]r_count_init_cmd;
  wire \r_count_init_cmd[2]_i_2_n_0 ;
  wire \r_count_init_cmd_reg[0] ;
  wire \r_count_init_cmd_reg[1] ;
  wire [21:0]r_count_usec_reg;
  wire r_cp_reg;
  wire r_en_count_usec_i_1_n_0;
  wire r_i2c_start;
  wire r_init_flag;
  wire r_init_flag_reg;
  wire r_tx_buf;
  wire [7:0]r_tx_buf0_in;
  wire \r_tx_buf[6]_i_2__0_n_0 ;
  wire [7:0]r_tx_buf__0;
  wire [6:0]\r_tx_buf_reg[6]_0 ;

  edge_detector_n_0 ED_I2C_TX
       (.AR(AR),
        .CLK(CLK),
        .E(next_state),
        .Q({present_state[5],present_state[0]}),
        .\next_state_reg[0] (\next_state[5]_i_3_n_0 ),
        .\present_state_reg[0] (ED_I2C_TX_n_1),
        .r_busy_reg(\next_state[5]_i_4_n_0 ),
        .r_busy_reg_0(r_busy_i_3_n_0),
        .r_busy_reg_1(o_led_busy_OBUF),
        .r_cp_reg_0(r_cp_reg));
  i2c_master INST_I2C_MASTER
       (.AR(AR),
        .CLK(CLK),
        .Q({r_tx_buf__0[7:2],r_tx_buf__0[0]}),
        .o_scl_OBUF(o_scl_OBUF),
        .o_sda_OBUF(o_sda_OBUF),
        .o_sda_OBUFT_inst_i_1(o_sda_OBUFT_inst_i_1),
        .\present_state_reg[0]_0 (\present_state_reg[0]_4 ),
        .r_i2c_start(r_i2c_start));
  clock_div_100_1 USEC_TICK
       (.AR(AR),
        .CLK(CLK),
        .O({USEC_TICK_n_0,USEC_TICK_n_1,USEC_TICK_n_2,USEC_TICK_n_3}),
        .r_count_usec_reg(r_count_usec_reg),
        .r_cp_z_reg({USEC_TICK_n_4,USEC_TICK_n_5,USEC_TICK_n_6,USEC_TICK_n_7}),
        .r_cp_z_reg_0({USEC_TICK_n_8,USEC_TICK_n_9,USEC_TICK_n_10,USEC_TICK_n_11}),
        .r_cp_z_reg_1({USEC_TICK_n_12,USEC_TICK_n_13,USEC_TICK_n_14,USEC_TICK_n_15}),
        .r_cp_z_reg_2({USEC_TICK_n_16,USEC_TICK_n_17,USEC_TICK_n_18,USEC_TICK_n_19}),
        .r_cp_z_reg_3({USEC_TICK_n_20,USEC_TICK_n_21}),
        .r_cp_z_reg_4(USEC_TICK_n_22),
        .r_i2c_start(r_i2c_start));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \next_state[1]_i_1__0 
       (.I0(present_state[4]),
        .I1(present_state[3]),
        .I2(present_state[1]),
        .I3(present_state[2]),
        .I4(present_state[5]),
        .O(\next_state[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h1040004000400040)) 
    \next_state[2]_i_7 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(o_led_busy_OBUF),
        .I3(Q[1]),
        .I4(r_count_init_cmd[1]),
        .I5(r_count_init_cmd[2]),
        .O(\present_state_reg[0]_3 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFEEB)) 
    \next_state[5]_i_3 
       (.I0(present_state[0]),
        .I1(present_state[4]),
        .I2(present_state[3]),
        .I3(present_state[5]),
        .I4(present_state[2]),
        .I5(present_state[1]),
        .O(\next_state[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000000000007F)) 
    \next_state[5]_i_4 
       (.I0(\next_state[5]_i_5_n_0 ),
        .I1(r_count_usec_reg[6]),
        .I2(r_count_usec_reg[7]),
        .I3(\next_state[5]_i_6_n_0 ),
        .I4(\next_state[5]_i_7_n_0 ),
        .I5(\next_state[5]_i_8_n_0 ),
        .O(\next_state[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEFEFEFEFEEE)) 
    \next_state[5]_i_5 
       (.I0(r_count_usec_reg[5]),
        .I1(r_count_usec_reg[4]),
        .I2(r_count_usec_reg[3]),
        .I3(r_count_usec_reg[2]),
        .I4(r_count_usec_reg[1]),
        .I5(r_count_usec_reg[0]),
        .O(\next_state[5]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \next_state[5]_i_6 
       (.I0(r_count_usec_reg[14]),
        .I1(r_count_usec_reg[11]),
        .I2(r_count_usec_reg[17]),
        .I3(r_count_usec_reg[9]),
        .O(\next_state[5]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \next_state[5]_i_7 
       (.I0(r_count_usec_reg[20]),
        .I1(r_count_usec_reg[16]),
        .I2(r_count_usec_reg[19]),
        .I3(r_count_usec_reg[13]),
        .O(\next_state[5]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \next_state[5]_i_8 
       (.I0(r_count_usec_reg[21]),
        .I1(r_count_usec_reg[18]),
        .I2(r_count_usec_reg[8]),
        .I3(r_count_usec_reg[12]),
        .I4(r_count_usec_reg[10]),
        .I5(r_count_usec_reg[15]),
        .O(\next_state[5]_i_8_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_state_reg[0] 
       (.C(CLK),
        .CE(next_state),
        .D(present_state[5]),
        .PRE(AR),
        .Q(\next_state_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[1] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\next_state[1]_i_1__0_n_0 ),
        .Q(\next_state_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[2] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(present_state[1]),
        .Q(\next_state_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[3] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(present_state[2]),
        .Q(\next_state_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[4] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(present_state[3]),
        .Q(\next_state_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[5] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(present_state[4]),
        .Q(\next_state_reg_n_0_[5] ));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\next_state_reg_n_0_[0] ),
        .PRE(AR),
        .Q(present_state[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[1] ),
        .Q(present_state[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[2] ),
        .Q(present_state[2]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[3] ),
        .Q(present_state[3]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[4] ),
        .Q(present_state[4]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[5] ),
        .Q(present_state[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    r_busy_i_3
       (.I0(present_state[2]),
        .I1(present_state[1]),
        .I2(present_state[3]),
        .I3(present_state[4]),
        .O(r_busy_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    r_busy_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(ED_I2C_TX_n_1),
        .Q(o_led_busy_OBUF));
  LUT3 #(
    .INIT(8'h34)) 
    \r_count_init_cmd[0]_i_1 
       (.I0(o_led_busy_OBUF),
        .I1(\r_count_init_cmd[2]_i_2_n_0 ),
        .I2(r_count_init_cmd[0]),
        .O(r_busy_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h1F20)) 
    \r_count_init_cmd[1]_i_1 
       (.I0(r_count_init_cmd[0]),
        .I1(o_led_busy_OBUF),
        .I2(\r_count_init_cmd[2]_i_2_n_0 ),
        .I3(r_count_init_cmd[1]),
        .O(\r_count_init_cmd_reg[0] ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h07FF0800)) 
    \r_count_init_cmd[2]_i_1 
       (.I0(r_count_init_cmd[1]),
        .I1(r_count_init_cmd[0]),
        .I2(o_led_busy_OBUF),
        .I3(\r_count_init_cmd[2]_i_2_n_0 ),
        .I4(r_count_init_cmd[2]),
        .O(\r_count_init_cmd_reg[1] ));
  LUT6 #(
    .INIT(64'h0000000000001B00)) 
    \r_count_init_cmd[2]_i_2 
       (.I0(o_led_busy_OBUF),
        .I1(r_cp_reg),
        .I2(r_init_flag_reg),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[0]),
        .O(\r_count_init_cmd[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[0] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_3),
        .Q(r_count_usec_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[10] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_9),
        .Q(r_count_usec_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[11] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_8),
        .Q(r_count_usec_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[12] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_15),
        .Q(r_count_usec_reg[12]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[13] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_14),
        .Q(r_count_usec_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[14] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_13),
        .Q(r_count_usec_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[15] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_12),
        .Q(r_count_usec_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[16] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_19),
        .Q(r_count_usec_reg[16]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[17] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_18),
        .Q(r_count_usec_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[18] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_17),
        .Q(r_count_usec_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[19] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_16),
        .Q(r_count_usec_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[1] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_2),
        .Q(r_count_usec_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[20] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_21),
        .Q(r_count_usec_reg[20]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[21] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_20),
        .Q(r_count_usec_reg[21]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[2] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_1),
        .Q(r_count_usec_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[3] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_0),
        .Q(r_count_usec_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[4] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_7),
        .Q(r_count_usec_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[5] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_6),
        .Q(r_count_usec_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[6] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_5),
        .Q(r_count_usec_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[7] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_4),
        .Q(r_count_usec_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[8] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_11),
        .Q(r_count_usec_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[9] 
       (.C(CLK),
        .CE(USEC_TICK_n_22),
        .CLR(AR),
        .D(USEC_TICK_n_10),
        .Q(r_count_usec_reg[9]));
  LUT3 #(
    .INIT(8'hB8)) 
    r_en_count_usec_i_1
       (.I0(r_i2c_start),
        .I1(\next_state[5]_i_3_n_0 ),
        .I2(\next_state[5]_i_4_n_0 ),
        .O(r_en_count_usec_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    r_en_count_usec_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(r_en_count_usec_i_1_n_0),
        .Q(r_i2c_start));
  LUT6 #(
    .INIT(64'hFFFFFFFF00401040)) 
    r_init_flag_i_1
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(o_led_busy_OBUF),
        .I3(Q[1]),
        .I4(r_init_flag_reg),
        .I5(r_init_flag),
        .O(\present_state_reg[0]_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00001100)) 
    r_rs_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(r_cp_reg),
        .I3(Q[2]),
        .I4(o_led_busy_OBUF),
        .I5(data2),
        .O(\present_state_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \r_tx_buf[0]_i_1 
       (.I0(data2),
        .I1(present_state[5]),
        .I2(present_state[2]),
        .I3(present_state[1]),
        .I4(present_state[3]),
        .I5(present_state[4]),
        .O(r_tx_buf0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_tx_buf[2]_i_1__0 
       (.I0(present_state[2]),
        .I1(present_state[4]),
        .O(r_tx_buf0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \r_tx_buf[3]_i_1 
       (.I0(present_state[5]),
        .I1(present_state[2]),
        .I2(present_state[1]),
        .I3(present_state[3]),
        .I4(present_state[4]),
        .O(r_tx_buf0_in[3]));
  LUT5 #(
    .INIT(32'hFFF44444)) 
    \r_tx_buf[4]_i_1 
       (.I0(\r_tx_buf[6]_i_2__0_n_0 ),
        .I1(\r_tx_buf_reg[6]_0 [0]),
        .I2(present_state[1]),
        .I3(present_state[2]),
        .I4(\r_tx_buf_reg[6]_0 [4]),
        .O(r_tx_buf0_in[4]));
  LUT5 #(
    .INIT(32'hFFF44444)) 
    \r_tx_buf[5]_i_1 
       (.I0(\r_tx_buf[6]_i_2__0_n_0 ),
        .I1(\r_tx_buf_reg[6]_0 [1]),
        .I2(present_state[1]),
        .I3(present_state[2]),
        .I4(\r_tx_buf_reg[6]_0 [5]),
        .O(r_tx_buf0_in[5]));
  LUT6 #(
    .INIT(64'h0000000000023030)) 
    \r_tx_buf[6]_i_1 
       (.I0(r_init_flag_reg),
        .I1(o_led_busy_OBUF),
        .I2(Q[2]),
        .I3(r_cp_reg),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(E));
  LUT5 #(
    .INIT(32'hFFF44444)) 
    \r_tx_buf[6]_i_1__0 
       (.I0(\r_tx_buf[6]_i_2__0_n_0 ),
        .I1(\r_tx_buf_reg[6]_0 [2]),
        .I2(present_state[1]),
        .I3(present_state[2]),
        .I4(\r_tx_buf_reg[6]_0 [6]),
        .O(r_tx_buf0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \r_tx_buf[6]_i_2__0 
       (.I0(present_state[5]),
        .I1(present_state[3]),
        .I2(present_state[4]),
        .O(\r_tx_buf[6]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \r_tx_buf[7]_i_1 
       (.I0(\next_state[5]_i_4_n_0 ),
        .I1(\next_state[5]_i_3_n_0 ),
        .O(r_tx_buf));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hAAA8)) 
    \r_tx_buf[7]_i_2 
       (.I0(\r_tx_buf_reg[6]_0 [3]),
        .I1(present_state[4]),
        .I2(present_state[3]),
        .I3(present_state[5]),
        .O(r_tx_buf0_in[7]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[0] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[0]),
        .Q(r_tx_buf__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[2] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[2]),
        .Q(r_tx_buf__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[3] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[3]),
        .Q(r_tx_buf__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[4] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[4]),
        .Q(r_tx_buf__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[5] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[5]),
        .Q(r_tx_buf__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[6] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[6]),
        .Q(r_tx_buf__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[7] 
       (.C(CLK),
        .CE(r_tx_buf),
        .CLR(AR),
        .D(r_tx_buf0_in[7]),
        .Q(r_tx_buf__0[7]));
  LUT5 #(
    .INIT(32'hFBBF0110)) 
    r_tx_i_1
       (.I0(Q[0]),
        .I1(o_led_busy_OBUF),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(r_cp_reg),
        .O(\present_state_reg[0]_0 ));
endmodule

module i2c_master
   (o_scl_OBUF,
    o_sda_OBUF,
    \present_state_reg[0]_0 ,
    CLK,
    AR,
    r_i2c_start,
    o_sda_OBUFT_inst_i_1,
    Q);
  output o_scl_OBUF;
  output o_sda_OBUF;
  output \present_state_reg[0]_0 ;
  input CLK;
  input [0:0]AR;
  input r_i2c_start;
  input o_sda_OBUFT_inst_i_1;
  input [6:0]Q;

  wire [0:0]AR;
  wire CLK;
  wire ED_I2C_START_n_0;
  wire ED_I2C_START_n_1;
  wire \ED_OUTPUT_TICK/r_cp ;
  wire \ED_OUTPUT_TICK/r_cp_z ;
  wire ED_SCL_n_0;
  wire ED_SCL_n_1;
  wire [6:0]Q;
  wire SCL_n_2;
  wire next_state;
  wire \next_state[1]_i_1__1_n_0 ;
  wire \next_state[3]_i_1_n_0 ;
  wire \next_state[4]_i_1_n_0 ;
  wire \next_state[5]_i_1__0_n_0 ;
  wire \next_state[6]_i_2_n_0 ;
  wire \next_state[6]_i_4_n_0 ;
  wire next_state__1_n_0;
  wire next_state__2_n_0;
  wire next_state__3_n_0;
  wire \next_state_reg_n_0_[0] ;
  wire \next_state_reg_n_0_[1] ;
  wire \next_state_reg_n_0_[2] ;
  wire \next_state_reg_n_0_[3] ;
  wire \next_state_reg_n_0_[4] ;
  wire \next_state_reg_n_0_[5] ;
  wire \next_state_reg_n_0_[6] ;
  wire o_scl_OBUF;
  wire o_sda_OBUF;
  wire o_sda_OBUFT_inst_i_1;
  wire \present_state_reg[0]_0 ;
  wire \present_state_reg_n_0_[0] ;
  wire \present_state_reg_n_0_[1] ;
  wire \present_state_reg_n_0_[2] ;
  wire \present_state_reg_n_0_[3] ;
  wire \present_state_reg_n_0_[4] ;
  wire \present_state_reg_n_0_[5] ;
  wire \present_state_reg_n_0_[6] ;
  wire r_bit_count;
  wire \r_bit_count[0]_i_1_n_0 ;
  wire \r_bit_count[1]_i_1_n_0 ;
  wire \r_bit_count[2]_i_1_n_0 ;
  wire \r_bit_count[2]_i_3_n_0 ;
  wire \r_bit_count_reg_n_0_[0] ;
  wire \r_bit_count_reg_n_0_[1] ;
  wire \r_bit_count_reg_n_0_[2] ;
  wire [2:2]r_count_usec_5_tick;
  wire \r_count_usec_5_tick[0]_i_1_n_0 ;
  wire \r_count_usec_5_tick[1]_i_1_n_0 ;
  wire \r_count_usec_5_tick[2]_i_1_n_0 ;
  wire \r_count_usec_5_tick_reg_n_0_[0] ;
  wire \r_count_usec_5_tick_reg_n_0_[1] ;
  wire r_en_scl_i_2_n_0;
  wire r_en_scl_i_3_n_0;
  wire r_en_scl_reg_n_0;
  wire r_i2c_start;
  wire r_sda;
  wire r_sda_tristate_oe_i_4_n_0;
  wire r_sda_tristate_oe_i_5_n_0;
  wire r_sda_tristate_oe_i_6_n_0;
  wire r_sda_tristate_oe_i_8_n_0;
  wire r_tx_flag_i_2_n_0;
  wire r_tx_flag_i_4_n_0;
  wire r_tx_flag_reg_n_0;

  edge_detector_n_3 ED_I2C_START
       (.AR(AR),
        .CLK(CLK),
        .Q({\present_state_reg_n_0_[6] ,\present_state_reg_n_0_[0] }),
        .\next_state_reg[0] (\next_state[6]_i_4_n_0 ),
        .\next_state_reg[0]_0 (r_tx_flag_i_4_n_0),
        .\next_state_reg[0]_1 (next_state__3_n_0),
        .r_cp_reg_0(ED_I2C_START_n_1),
        .r_cp_z_reg_0(ED_I2C_START_n_0),
        .r_en_scl_reg(r_en_scl_i_2_n_0),
        .r_en_scl_reg_0(r_en_scl_i_3_n_0),
        .r_en_scl_reg_1(r_en_scl_reg_n_0),
        .r_i2c_start(r_i2c_start));
  edge_detector_n_4 ED_SCL
       (.AR(AR),
        .CLK(CLK),
        .D(\next_state[3]_i_1_n_0 ),
        .E(next_state),
        .Q({\present_state_reg_n_0_[6] ,\present_state_reg_n_0_[5] ,\present_state_reg_n_0_[4] ,\present_state_reg_n_0_[3] ,\present_state_reg_n_0_[2] ,\present_state_reg_n_0_[1] ,\present_state_reg_n_0_[0] }),
        .\next_state_reg[0] (\next_state[6]_i_2_n_0 ),
        .\next_state_reg[0]_0 (next_state__3_n_0),
        .\next_state_reg[0]_1 (ED_I2C_START_n_1),
        .o_scl_OBUF(o_scl_OBUF),
        .o_sda_OBUF(o_sda_OBUF),
        .o_sda_OBUFT_inst_i_1(o_sda_OBUFT_inst_i_1),
        .\present_state_reg[0] (\present_state_reg[0]_0 ),
        .\present_state_reg[3] (ED_SCL_n_1),
        .r_bit_count(r_bit_count),
        .\r_bit_count_reg[0] (\r_bit_count[2]_i_3_n_0 ),
        .r_sda(r_sda),
        .r_sda_tristate_oe_reg(ED_SCL_n_0),
        .r_sda_tristate_oe_reg_0(\next_state[6]_i_4_n_0 ),
        .r_sda_tristate_oe_reg_1(r_en_scl_i_2_n_0),
        .r_tx_flag_reg(r_tx_flag_i_2_n_0),
        .r_tx_flag_reg_0(r_tx_flag_i_4_n_0),
        .r_tx_flag_reg_1(r_tx_flag_reg_n_0));
  clock_div_100_5 SCL
       (.AR(AR),
        .CLK(CLK),
        .o_scl_OBUF(o_scl_OBUF),
        .r_count_usec_5_tick(r_count_usec_5_tick),
        .\r_count_usec_5_tick_reg[2] (SCL_n_2),
        .r_cp(\ED_OUTPUT_TICK/r_cp ),
        .r_cp_z(\ED_OUTPUT_TICK/r_cp_z ),
        .r_scl_reg(r_en_scl_reg_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \next_state[1]_i_1__1 
       (.I0(\present_state_reg_n_0_[2] ),
        .I1(\present_state_reg_n_0_[4] ),
        .I2(\present_state_reg_n_0_[3] ),
        .I3(\present_state_reg_n_0_[5] ),
        .I4(\present_state_reg_n_0_[6] ),
        .I5(\present_state_reg_n_0_[1] ),
        .O(\next_state[1]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \next_state[3]_i_1 
       (.I0(\present_state_reg_n_0_[2] ),
        .I1(\present_state_reg_n_0_[4] ),
        .O(\next_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \next_state[4]_i_1 
       (.I0(\present_state_reg_n_0_[3] ),
        .I1(r_tx_flag_reg_n_0),
        .O(\next_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \next_state[5]_i_1__0 
       (.I0(\present_state_reg_n_0_[3] ),
        .I1(r_tx_flag_reg_n_0),
        .O(\next_state[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0010)) 
    \next_state[6]_i_2 
       (.I0(\r_bit_count_reg_n_0_[0] ),
        .I1(\r_bit_count_reg_n_0_[1] ),
        .I2(\next_state[3]_i_1_n_0 ),
        .I3(\r_bit_count_reg_n_0_[2] ),
        .I4(\present_state_reg_n_0_[5] ),
        .I5(\present_state_reg_n_0_[3] ),
        .O(\next_state[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \next_state[6]_i_4 
       (.I0(\r_count_usec_5_tick_reg_n_0_[1] ),
        .I1(\r_count_usec_5_tick_reg_n_0_[0] ),
        .I2(r_count_usec_5_tick),
        .O(\next_state[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0116)) 
    next_state__1
       (.I0(\present_state_reg_n_0_[3] ),
        .I1(\present_state_reg_n_0_[4] ),
        .I2(\present_state_reg_n_0_[5] ),
        .I3(\present_state_reg_n_0_[6] ),
        .O(next_state__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFEE8)) 
    next_state__2
       (.I0(\present_state_reg_n_0_[3] ),
        .I1(\present_state_reg_n_0_[4] ),
        .I2(\present_state_reg_n_0_[5] ),
        .I3(\present_state_reg_n_0_[6] ),
        .O(next_state__2_n_0));
  LUT5 #(
    .INIT(32'h00000116)) 
    next_state__3
       (.I0(\present_state_reg_n_0_[0] ),
        .I1(\present_state_reg_n_0_[1] ),
        .I2(\present_state_reg_n_0_[2] ),
        .I3(next_state__1_n_0),
        .I4(next_state__2_n_0),
        .O(next_state__3_n_0));
  FDPE #(
    .INIT(1'b1)) 
    \next_state_reg[0] 
       (.C(CLK),
        .CE(next_state),
        .D(\present_state_reg_n_0_[6] ),
        .PRE(AR),
        .Q(\next_state_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[1] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\next_state[1]_i_1__1_n_0 ),
        .Q(\next_state_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[2] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\present_state_reg_n_0_[1] ),
        .Q(\next_state_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[3] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\next_state[3]_i_1_n_0 ),
        .Q(\next_state_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[4] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\next_state[4]_i_1_n_0 ),
        .Q(\next_state_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[5] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\next_state[5]_i_1__0_n_0 ),
        .Q(\next_state_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[6] 
       (.C(CLK),
        .CE(next_state),
        .CLR(AR),
        .D(\present_state_reg_n_0_[5] ),
        .Q(\next_state_reg_n_0_[6] ));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\next_state_reg_n_0_[0] ),
        .PRE(AR),
        .Q(\present_state_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[1] ),
        .Q(\present_state_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[2] ),
        .Q(\present_state_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[3] ),
        .Q(\present_state_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[4] ),
        .Q(\present_state_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[5] ),
        .Q(\present_state_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\next_state_reg_n_0_[6] ),
        .Q(\present_state_reg_n_0_[6] ));
  LUT2 #(
    .INIT(4'h6)) 
    \r_bit_count[0]_i_1 
       (.I0(r_bit_count),
        .I1(\r_bit_count_reg_n_0_[0] ),
        .O(\r_bit_count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \r_bit_count[1]_i_1 
       (.I0(\r_bit_count_reg_n_0_[0] ),
        .I1(r_bit_count),
        .I2(\r_bit_count_reg_n_0_[1] ),
        .O(\r_bit_count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEF10)) 
    \r_bit_count[2]_i_1 
       (.I0(\r_bit_count_reg_n_0_[1] ),
        .I1(\r_bit_count_reg_n_0_[0] ),
        .I2(r_bit_count),
        .I3(\r_bit_count_reg_n_0_[2] ),
        .O(\r_bit_count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_bit_count[2]_i_3 
       (.I0(\present_state_reg_n_0_[3] ),
        .I1(\present_state_reg_n_0_[5] ),
        .O(\r_bit_count[2]_i_3_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \r_bit_count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_bit_count[0]_i_1_n_0 ),
        .PRE(AR),
        .Q(\r_bit_count_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \r_bit_count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_bit_count[1]_i_1_n_0 ),
        .PRE(AR),
        .Q(\r_bit_count_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \r_bit_count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\r_bit_count[2]_i_1_n_0 ),
        .PRE(AR),
        .Q(\r_bit_count_reg_n_0_[2] ));
  LUT5 #(
    .INIT(32'hCF001000)) 
    \r_count_usec_5_tick[0]_i_1 
       (.I0(r_count_usec_5_tick),
        .I1(\ED_OUTPUT_TICK/r_cp_z ),
        .I2(\ED_OUTPUT_TICK/r_cp ),
        .I3(r_en_scl_reg_n_0),
        .I4(\r_count_usec_5_tick_reg_n_0_[0] ),
        .O(\r_count_usec_5_tick[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF1FF000004000000)) 
    \r_count_usec_5_tick[1]_i_1 
       (.I0(r_count_usec_5_tick),
        .I1(\r_count_usec_5_tick_reg_n_0_[0] ),
        .I2(\ED_OUTPUT_TICK/r_cp_z ),
        .I3(\ED_OUTPUT_TICK/r_cp ),
        .I4(r_en_scl_reg_n_0),
        .I5(\r_count_usec_5_tick_reg_n_0_[1] ),
        .O(\r_count_usec_5_tick[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF000008000000)) 
    \r_count_usec_5_tick[2]_i_1 
       (.I0(\r_count_usec_5_tick_reg_n_0_[1] ),
        .I1(\r_count_usec_5_tick_reg_n_0_[0] ),
        .I2(\ED_OUTPUT_TICK/r_cp_z ),
        .I3(\ED_OUTPUT_TICK/r_cp ),
        .I4(r_en_scl_reg_n_0),
        .I5(r_count_usec_5_tick),
        .O(\r_count_usec_5_tick[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_5_tick_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count_usec_5_tick[0]_i_1_n_0 ),
        .Q(\r_count_usec_5_tick_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_5_tick_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count_usec_5_tick[1]_i_1_n_0 ),
        .Q(\r_count_usec_5_tick_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_5_tick_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(\r_count_usec_5_tick[2]_i_1_n_0 ),
        .Q(r_count_usec_5_tick));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    r_en_scl_i_2
       (.I0(\present_state_reg_n_0_[5] ),
        .I1(\present_state_reg_n_0_[3] ),
        .I2(\present_state_reg_n_0_[4] ),
        .I3(\present_state_reg_n_0_[2] ),
        .O(r_en_scl_i_2_n_0));
  LUT6 #(
    .INIT(64'h000000FF00F80000)) 
    r_en_scl_i_3
       (.I0(\r_count_usec_5_tick_reg_n_0_[1] ),
        .I1(\r_count_usec_5_tick_reg_n_0_[0] ),
        .I2(r_count_usec_5_tick),
        .I3(\present_state_reg_n_0_[1] ),
        .I4(\present_state_reg_n_0_[6] ),
        .I5(\present_state_reg_n_0_[0] ),
        .O(r_en_scl_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    r_en_scl_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(ED_I2C_START_n_0),
        .Q(r_en_scl_reg_n_0));
  FDPE #(
    .INIT(1'b1)) 
    r_scl_reg
       (.C(CLK),
        .CE(1'b1),
        .D(SCL_n_2),
        .PRE(AR),
        .Q(o_scl_OBUF));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAEA)) 
    r_sda_tristate_oe_i_2
       (.I0(r_sda_tristate_oe_i_4_n_0),
        .I1(\r_bit_count_reg_n_0_[0] ),
        .I2(\present_state_reg_n_0_[2] ),
        .I3(\r_bit_count_reg_n_0_[2] ),
        .I4(r_sda_tristate_oe_i_5_n_0),
        .I5(r_sda_tristate_oe_i_6_n_0),
        .O(r_sda));
  LUT6 #(
    .INIT(64'hAAAA0000C0000000)) 
    r_sda_tristate_oe_i_4
       (.I0(r_sda_tristate_oe_i_8_n_0),
        .I1(\r_bit_count_reg_n_0_[0] ),
        .I2(\r_bit_count_reg_n_0_[2] ),
        .I3(Q[4]),
        .I4(\present_state_reg_n_0_[4] ),
        .I5(\r_bit_count_reg_n_0_[1] ),
        .O(r_sda_tristate_oe_i_4_n_0));
  LUT6 #(
    .INIT(64'h1010100000001000)) 
    r_sda_tristate_oe_i_5
       (.I0(\r_bit_count_reg_n_0_[0] ),
        .I1(\r_bit_count_reg_n_0_[1] ),
        .I2(\present_state_reg_n_0_[4] ),
        .I3(Q[0]),
        .I4(\r_bit_count_reg_n_0_[2] ),
        .I5(Q[3]),
        .O(r_sda_tristate_oe_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAEAAAEAAAEA)) 
    r_sda_tristate_oe_i_6
       (.I0(\present_state_reg_n_0_[0] ),
        .I1(\present_state_reg_n_0_[2] ),
        .I2(\r_bit_count_reg_n_0_[1] ),
        .I3(\r_bit_count_reg_n_0_[0] ),
        .I4(\present_state_reg_n_0_[6] ),
        .I5(\next_state[6]_i_4_n_0 ),
        .O(r_sda_tristate_oe_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    r_sda_tristate_oe_i_8
       (.I0(Q[6]),
        .I1(Q[2]),
        .I2(\r_bit_count_reg_n_0_[0] ),
        .I3(Q[5]),
        .I4(\r_bit_count_reg_n_0_[2] ),
        .I5(Q[1]),
        .O(r_sda_tristate_oe_i_8_n_0));
  FDPE #(
    .INIT(1'b1)) 
    r_sda_tristate_oe_reg
       (.C(CLK),
        .CE(1'b1),
        .D(ED_SCL_n_0),
        .PRE(AR),
        .Q(o_sda_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    r_tx_flag_i_2
       (.I0(\present_state_reg_n_0_[4] ),
        .I1(\present_state_reg_n_0_[2] ),
        .I2(\present_state_reg_n_0_[5] ),
        .O(r_tx_flag_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    r_tx_flag_i_4
       (.I0(\present_state_reg_n_0_[1] ),
        .I1(\present_state_reg_n_0_[6] ),
        .O(r_tx_flag_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    r_tx_flag_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(ED_SCL_n_1),
        .Q(r_tx_flag_reg_n_0));
endmodule

(* IDLE = "6'b000001" *) (* INIT = "6'b000010" *) (* SLV_ADDR = "7'b0100111" *) 
(* TX_BYTE = "6'b000100" *) 
(* NotValidForBitStream *)
module top_i2c_lcd
   (i_clk,
    i_reset,
    i_btn_u,
    i_btn_l,
    i_btn_r,
    i_btn_d,
    o_scl,
    o_sda,
    o_led_busy);
  input i_clk;
  input i_reset;
  input i_btn_u;
  input i_btn_l;
  input i_btn_r;
  input i_btn_d;
  output o_scl;
  output o_sda;
  output o_led_busy;

  wire BTN_U_CTRL_n_0;
  wire BTN_U_CTRL_n_1;
  wire BTN_U_CTRL_n_2;
  wire TEXT_LCD_CTRL_n_10;
  wire TEXT_LCD_CTRL_n_11;
  wire TEXT_LCD_CTRL_n_3;
  wire TEXT_LCD_CTRL_n_4;
  wire TEXT_LCD_CTRL_n_5;
  wire TEXT_LCD_CTRL_n_6;
  wire TEXT_LCD_CTRL_n_7;
  wire TEXT_LCD_CTRL_n_8;
  wire TEXT_LCD_CTRL_n_9;
  wire USEC_TICK_n_0;
  wire USEC_TICK_n_1;
  wire USEC_TICK_n_10;
  wire USEC_TICK_n_11;
  wire USEC_TICK_n_12;
  wire USEC_TICK_n_13;
  wire USEC_TICK_n_14;
  wire USEC_TICK_n_15;
  wire USEC_TICK_n_16;
  wire USEC_TICK_n_17;
  wire USEC_TICK_n_18;
  wire USEC_TICK_n_19;
  wire USEC_TICK_n_2;
  wire USEC_TICK_n_20;
  wire USEC_TICK_n_21;
  wire USEC_TICK_n_22;
  wire USEC_TICK_n_3;
  wire USEC_TICK_n_4;
  wire USEC_TICK_n_5;
  wire USEC_TICK_n_6;
  wire USEC_TICK_n_7;
  wire USEC_TICK_n_8;
  wire USEC_TICK_n_9;
  wire [7:0]data2;
  wire i_btn_u;
  wire i_btn_u_IBUF;
  wire i_clk;
  wire i_clk_IBUF;
  wire i_clk_IBUF_BUFG;
  wire i_reset;
  wire i_reset_IBUF;
  wire next_state1;
  wire \next_state[2]_i_10_n_0 ;
  wire \next_state[2]_i_11_n_0 ;
  wire \next_state[2]_i_3_n_0 ;
  wire \next_state[2]_i_4_n_0 ;
  wire \next_state[2]_i_5_n_0 ;
  wire \next_state[2]_i_8_n_0 ;
  wire \next_state[2]_i_9_n_0 ;
  wire \next_state_reg_n_0_[0] ;
  wire \next_state_reg_n_0_[1] ;
  wire \next_state_reg_n_0_[2] ;
  wire o_led_busy;
  wire o_led_busy_OBUF;
  wire o_scl;
  wire o_scl_OBUF;
  wire o_sda;
  wire o_sda_OBUF;
  wire o_sda_OBUFT_inst_i_5_n_0;
  wire o_sda_TRI;
  wire [2:0]present_state;
  wire [2:0]r_count_init_cmd;
  wire [21:0]r_count_usec_reg;
  wire r_en_count_usec;
  wire r_en_count_usec_i_1__0_n_0;
  wire r_en_count_usec_i_3_n_0;
  wire r_en_count_usec_i_4_n_0;
  wire r_init_flag;
  wire \r_tx_buf[0]_i_1__0_n_0 ;
  wire \r_tx_buf[1]_i_1_n_0 ;
  wire \r_tx_buf[2]_i_1_n_0 ;
  wire \r_tx_buf[3]_i_1__0_n_0 ;
  wire \r_tx_buf[4]_i_1__0_n_0 ;
  wire \r_tx_buf[5]_i_1__0_n_0 ;
  wire \r_tx_buf[6]_i_2_n_0 ;
  wire \r_tx_buf_reg_n_0_[4] ;
  wire \r_tx_buf_reg_n_0_[5] ;
  wire \r_tx_buf_reg_n_0_[6] ;
  wire r_tx_reg_n_0;

  buttonControl BTN_U_CTRL
       (.AR(i_reset_IBUF),
        .CLK(i_clk_IBUF_BUFG),
        .D({\next_state_reg_n_0_[2] ,\next_state_reg_n_0_[1] ,\next_state_reg_n_0_[0] }),
        .Q(present_state),
        .i_btn_u_IBUF(i_btn_u_IBUF),
        .\next_state_reg[0] (\next_state[2]_i_3_n_0 ),
        .\next_state_reg[0]_0 (\next_state[2]_i_4_n_0 ),
        .\next_state_reg[0]_1 (\next_state[2]_i_5_n_0 ),
        .\next_state_reg[0]_2 (TEXT_LCD_CTRL_n_10),
        .\present_state_reg[1] (BTN_U_CTRL_n_1),
        .\present_state_reg[1]_0 (BTN_U_CTRL_n_2),
        .r_count_usec_reg(r_count_usec_reg[16]),
        .r_init_flag(r_init_flag),
        .r_init_flag_reg(BTN_U_CTRL_n_0));
  i2cLcdController TEXT_LCD_CTRL
       (.AR(i_reset_IBUF),
        .CLK(i_clk_IBUF_BUFG),
        .E(TEXT_LCD_CTRL_n_6),
        .Q(present_state),
        .data2(data2[0]),
        .o_led_busy_OBUF(o_led_busy_OBUF),
        .o_scl_OBUF(o_scl_OBUF),
        .o_sda_OBUF(o_sda_OBUF),
        .o_sda_OBUFT_inst_i_1(o_sda_OBUFT_inst_i_5_n_0),
        .\present_state_reg[0]_0 (TEXT_LCD_CTRL_n_7),
        .\present_state_reg[0]_1 (TEXT_LCD_CTRL_n_8),
        .\present_state_reg[0]_2 (TEXT_LCD_CTRL_n_9),
        .\present_state_reg[0]_3 (TEXT_LCD_CTRL_n_10),
        .\present_state_reg[0]_4 (TEXT_LCD_CTRL_n_11),
        .r_busy_reg_0(TEXT_LCD_CTRL_n_5),
        .r_count_init_cmd(r_count_init_cmd),
        .\r_count_init_cmd_reg[0] (TEXT_LCD_CTRL_n_4),
        .\r_count_init_cmd_reg[1] (TEXT_LCD_CTRL_n_3),
        .r_cp_reg(r_tx_reg_n_0),
        .r_init_flag(r_init_flag),
        .r_init_flag_reg(\r_tx_buf[6]_i_2_n_0 ),
        .\r_tx_buf_reg[6]_0 ({\r_tx_buf_reg_n_0_[6] ,\r_tx_buf_reg_n_0_[5] ,\r_tx_buf_reg_n_0_[4] ,data2[7:4]}));
  clock_div_100 USEC_TICK
       (.AR(i_reset_IBUF),
        .CLK(i_clk_IBUF_BUFG),
        .O({USEC_TICK_n_0,USEC_TICK_n_1,USEC_TICK_n_2,USEC_TICK_n_3}),
        .r_count_usec_reg(r_count_usec_reg),
        .r_cp_z_reg({USEC_TICK_n_4,USEC_TICK_n_5,USEC_TICK_n_6,USEC_TICK_n_7}),
        .r_cp_z_reg_0({USEC_TICK_n_8,USEC_TICK_n_9,USEC_TICK_n_10,USEC_TICK_n_11}),
        .r_cp_z_reg_1({USEC_TICK_n_12,USEC_TICK_n_13,USEC_TICK_n_14,USEC_TICK_n_15}),
        .r_cp_z_reg_2({USEC_TICK_n_16,USEC_TICK_n_17,USEC_TICK_n_18,USEC_TICK_n_19}),
        .r_cp_z_reg_3({USEC_TICK_n_20,USEC_TICK_n_21}),
        .r_cp_z_reg_4(USEC_TICK_n_22),
        .r_en_count_usec(r_en_count_usec));
  IBUF i_btn_u_IBUF_inst
       (.I(i_btn_u),
        .O(i_btn_u_IBUF));
  BUFG i_clk_IBUF_BUFG_inst
       (.I(i_clk_IBUF),
        .O(i_clk_IBUF_BUFG));
  IBUF i_clk_IBUF_inst
       (.I(i_clk),
        .O(i_clk_IBUF));
  IBUF i_reset_IBUF_inst
       (.I(i_reset),
        .O(i_reset_IBUF));
  LUT3 #(
    .INIT(8'hFE)) 
    \next_state[2]_i_10 
       (.I0(r_count_usec_reg[8]),
        .I1(r_count_usec_reg[10]),
        .I2(r_count_usec_reg[9]),
        .O(\next_state[2]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \next_state[2]_i_11 
       (.I0(r_count_usec_reg[14]),
        .I1(r_count_usec_reg[15]),
        .O(\next_state[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAABAFF)) 
    \next_state[2]_i_3 
       (.I0(r_en_count_usec_i_3_n_0),
        .I1(\next_state[2]_i_8_n_0 ),
        .I2(\next_state[2]_i_9_n_0 ),
        .I3(r_count_usec_reg[7]),
        .I4(\next_state[2]_i_10_n_0 ),
        .I5(\next_state[2]_i_11_n_0 ),
        .O(\next_state[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \next_state[2]_i_4 
       (.I0(r_count_usec_reg[20]),
        .I1(r_count_usec_reg[17]),
        .I2(r_count_usec_reg[19]),
        .I3(r_count_usec_reg[21]),
        .I4(r_count_usec_reg[18]),
        .O(\next_state[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \next_state[2]_i_5 
       (.I0(r_init_flag),
        .I1(present_state[2]),
        .I2(present_state[1]),
        .I3(present_state[0]),
        .O(\next_state[2]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \next_state[2]_i_8 
       (.I0(r_count_usec_reg[3]),
        .I1(r_count_usec_reg[0]),
        .I2(r_count_usec_reg[5]),
        .I3(r_count_usec_reg[1]),
        .O(\next_state[2]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \next_state[2]_i_9 
       (.I0(r_count_usec_reg[6]),
        .I1(r_count_usec_reg[4]),
        .I2(r_count_usec_reg[2]),
        .O(\next_state[2]_i_9_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \next_state_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(BTN_U_CTRL_n_2),
        .PRE(i_reset_IBUF),
        .Q(\next_state_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(BTN_U_CTRL_n_1),
        .Q(\next_state_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \next_state_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(BTN_U_CTRL_n_0),
        .Q(\next_state_reg_n_0_[2] ));
  OBUF o_led_busy_OBUF_inst
       (.I(o_led_busy_OBUF),
        .O(o_led_busy));
  OBUF o_scl_OBUF_inst
       (.I(o_scl_OBUF),
        .O(o_scl));
  OBUFT o_sda_OBUFT_inst
       (.I(o_sda_OBUF),
        .O(o_sda),
        .T(o_sda_TRI));
  FDCE #(
    .INIT(1'b0)) 
    o_sda_OBUFT_inst_i_1
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_11),
        .Q(o_sda_TRI));
  LUT1 #(
    .INIT(2'h1)) 
    o_sda_OBUFT_inst_i_5
       (.I0(o_sda_TRI),
        .O(o_sda_OBUFT_inst_i_5_n_0));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\next_state_reg_n_0_[0] ),
        .PRE(i_reset_IBUF),
        .Q(present_state[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(\next_state_reg_n_0_[1] ),
        .Q(present_state[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \present_state_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(\next_state_reg_n_0_[2] ),
        .Q(present_state[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_init_cmd_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_5),
        .Q(r_count_init_cmd[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_init_cmd_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_4),
        .Q(r_count_init_cmd[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_init_cmd_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_3),
        .Q(r_count_init_cmd[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_3),
        .Q(r_count_usec_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[10] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_9),
        .Q(r_count_usec_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[11] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_8),
        .Q(r_count_usec_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[12] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_15),
        .Q(r_count_usec_reg[12]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[13] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_14),
        .Q(r_count_usec_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[14] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_13),
        .Q(r_count_usec_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[15] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_12),
        .Q(r_count_usec_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[16] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_19),
        .Q(r_count_usec_reg[16]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[17] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_18),
        .Q(r_count_usec_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[18] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_17),
        .Q(r_count_usec_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[19] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_16),
        .Q(r_count_usec_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_2),
        .Q(r_count_usec_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[20] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_21),
        .Q(r_count_usec_reg[20]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[21] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_20),
        .Q(r_count_usec_reg[21]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_1),
        .Q(r_count_usec_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_0),
        .Q(r_count_usec_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_7),
        .Q(r_count_usec_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_6),
        .Q(r_count_usec_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_5),
        .Q(r_count_usec_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[7] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_4),
        .Q(r_count_usec_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[8] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_11),
        .Q(r_count_usec_reg[8]));
  FDCE #(
    .INIT(1'b0)) 
    \r_count_usec_reg[9] 
       (.C(i_clk_IBUF_BUFG),
        .CE(USEC_TICK_n_22),
        .CLR(i_reset_IBUF),
        .D(USEC_TICK_n_10),
        .Q(r_count_usec_reg[9]));
  LUT6 #(
    .INIT(64'hFFFEFFFF00020000)) 
    r_en_count_usec_i_1__0
       (.I0(next_state1),
        .I1(r_init_flag),
        .I2(present_state[2]),
        .I3(present_state[1]),
        .I4(present_state[0]),
        .I5(r_en_count_usec),
        .O(r_en_count_usec_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h00000000555555FD)) 
    r_en_count_usec_i_2
       (.I0(r_count_usec_reg[16]),
        .I1(r_en_count_usec_i_3_n_0),
        .I2(r_en_count_usec_i_4_n_0),
        .I3(r_count_usec_reg[15]),
        .I4(r_count_usec_reg[14]),
        .I5(\next_state[2]_i_4_n_0 ),
        .O(next_state1));
  LUT3 #(
    .INIT(8'h7F)) 
    r_en_count_usec_i_3
       (.I0(r_count_usec_reg[11]),
        .I1(r_count_usec_reg[13]),
        .I2(r_count_usec_reg[12]),
        .O(r_en_count_usec_i_3_n_0));
  LUT6 #(
    .INIT(64'h000000000001FFFF)) 
    r_en_count_usec_i_4
       (.I0(\next_state[2]_i_8_n_0 ),
        .I1(r_count_usec_reg[2]),
        .I2(r_count_usec_reg[4]),
        .I3(r_count_usec_reg[6]),
        .I4(r_count_usec_reg[7]),
        .I5(\next_state[2]_i_10_n_0 ),
        .O(r_en_count_usec_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    r_en_count_usec_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(r_en_count_usec_i_1__0_n_0),
        .Q(r_en_count_usec));
  FDCE #(
    .INIT(1'b0)) 
    r_init_flag_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_9),
        .Q(r_init_flag));
  FDCE #(
    .INIT(1'b0)) 
    r_rs_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_8),
        .Q(data2[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h1F)) 
    \r_tx_buf[0]_i_1__0 
       (.I0(r_count_init_cmd[0]),
        .I1(r_count_init_cmd[1]),
        .I2(present_state[1]),
        .O(\r_tx_buf[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h00D0)) 
    \r_tx_buf[1]_i_1 
       (.I0(r_count_init_cmd[2]),
        .I1(r_count_init_cmd[0]),
        .I2(present_state[1]),
        .I3(r_count_init_cmd[1]),
        .O(\r_tx_buf[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hE000)) 
    \r_tx_buf[2]_i_1 
       (.I0(r_count_init_cmd[2]),
        .I1(r_count_init_cmd[1]),
        .I2(r_count_init_cmd[0]),
        .I3(present_state[1]),
        .O(\r_tx_buf[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_tx_buf[3]_i_1__0 
       (.I0(r_count_init_cmd[1]),
        .I1(present_state[2]),
        .O(\r_tx_buf[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \r_tx_buf[4]_i_1__0 
       (.I0(present_state[2]),
        .I1(r_count_init_cmd[2]),
        .I2(r_count_init_cmd[1]),
        .O(\r_tx_buf[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h002A)) 
    \r_tx_buf[5]_i_1__0 
       (.I0(present_state[1]),
        .I1(r_count_init_cmd[1]),
        .I2(r_count_init_cmd[0]),
        .I3(r_count_init_cmd[2]),
        .O(\r_tx_buf[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \r_tx_buf[6]_i_2 
       (.I0(r_count_init_cmd[1]),
        .I1(r_count_init_cmd[2]),
        .O(\r_tx_buf[6]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[0] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[0]_i_1__0_n_0 ),
        .Q(data2[4]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[1] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[1]_i_1_n_0 ),
        .Q(data2[5]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[2] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[2]_i_1_n_0 ),
        .Q(data2[6]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[3] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[3]_i_1__0_n_0 ),
        .Q(data2[7]));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[4] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[4]_i_1__0_n_0 ),
        .Q(\r_tx_buf_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[5] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(\r_tx_buf[5]_i_1__0_n_0 ),
        .Q(\r_tx_buf_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \r_tx_buf_reg[6] 
       (.C(i_clk_IBUF_BUFG),
        .CE(TEXT_LCD_CTRL_n_6),
        .CLR(i_reset_IBUF),
        .D(present_state[2]),
        .Q(\r_tx_buf_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    r_tx_reg
       (.C(i_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(i_reset_IBUF),
        .D(TEXT_LCD_CTRL_n_7),
        .Q(r_tx_reg_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
