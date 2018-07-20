// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Jul 18 01:28:09 2018
// Host        : laptopASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Users/alexa/Documents/GitHub/QAM/QAM.sim/sim_1/synth/timing/xsim/PWM_tb_time_synth.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module PWM
   (sin_wave_8p,
    debugDuty,
    clk_out1,
    SR);
  output sin_wave_8p;
  input [0:0]debugDuty;
  input clk_out1;
  input [0:0]SR;

  wire PWM_counter_n_1;
  wire PWM_counter_n_10;
  wire PWM_counter_n_11;
  wire PWM_counter_n_12;
  wire PWM_counter_n_13;
  wire PWM_counter_n_14;
  wire PWM_counter_n_15;
  wire PWM_counter_n_16;
  wire PWM_counter_n_17;
  wire PWM_counter_n_18;
  wire PWM_counter_n_19;
  wire PWM_counter_n_2;
  wire PWM_counter_n_3;
  wire PWM_counter_n_4;
  wire PWM_counter_n_5;
  wire PWM_counter_n_6;
  wire PWM_counter_n_7;
  wire PWM_counter_n_9;
  wire [9:9]PWM_duty_reg;
  wire PWM_pulse0;
  wire PWM_pulse03_out;
  wire PWM_pulse11_in;
  wire PWM_pulse1_carry__0_n_0;
  wire PWM_pulse1_carry__0_n_1;
  wire PWM_pulse1_carry__0_n_2;
  wire PWM_pulse1_carry__0_n_3;
  wire PWM_pulse1_carry__1_n_0;
  wire PWM_pulse1_carry__1_n_1;
  wire PWM_pulse1_carry__1_n_2;
  wire PWM_pulse1_carry__1_n_3;
  wire PWM_pulse1_carry__2_n_3;
  wire PWM_pulse1_carry_n_0;
  wire PWM_pulse1_carry_n_1;
  wire PWM_pulse1_carry_n_2;
  wire PWM_pulse1_carry_n_3;
  wire [0:0]SR;
  wire clk_out1;
  wire [0:0]debugDuty;
  wire sin_wave_8p;
  wire [3:0]NLW_PWM_pulse1_carry_O_UNCONNECTED;
  wire [3:0]NLW_PWM_pulse1_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_PWM_pulse1_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_PWM_pulse1_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_PWM_pulse1_carry__2_O_UNCONNECTED;

  counter PWM_counter
       (.CO(PWM_pulse11_in),
        .DI({PWM_counter_n_1,PWM_counter_n_2,PWM_counter_n_3}),
        .PWM_duty_reg(PWM_duty_reg),
        .PWM_pulse0(PWM_pulse0),
        .PWM_pulse03_out(PWM_pulse03_out),
        .PWM_pulse_reg(PWM_counter_n_9),
        .PWM_pulse_reg_0({PWM_counter_n_10,PWM_counter_n_11,PWM_counter_n_12,PWM_counter_n_13}),
        .PWM_pulse_reg_1({PWM_counter_n_14,PWM_counter_n_15,PWM_counter_n_16,PWM_counter_n_17}),
        .PWM_pulse_reg_2({PWM_counter_n_18,PWM_counter_n_19}),
        .S({PWM_counter_n_4,PWM_counter_n_5,PWM_counter_n_6,PWM_counter_n_7}),
        .SR(SR),
        .clk_out1(clk_out1));
  FDRE #(
    .INIT(1'b0)) 
    \PWM_duty_reg_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(debugDuty),
        .Q(PWM_duty_reg),
        .R(1'b0));
  CARRY4 PWM_pulse1_carry
       (.CI(1'b0),
        .CO({PWM_pulse1_carry_n_0,PWM_pulse1_carry_n_1,PWM_pulse1_carry_n_2,PWM_pulse1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({PWM_counter_n_1,PWM_counter_n_2,1'b0,PWM_counter_n_3}),
        .O(NLW_PWM_pulse1_carry_O_UNCONNECTED[3:0]),
        .S({PWM_counter_n_4,PWM_counter_n_5,PWM_counter_n_6,PWM_counter_n_7}));
  CARRY4 PWM_pulse1_carry__0
       (.CI(PWM_pulse1_carry_n_0),
        .CO({PWM_pulse1_carry__0_n_0,PWM_pulse1_carry__0_n_1,PWM_pulse1_carry__0_n_2,PWM_pulse1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,PWM_counter_n_9}),
        .O(NLW_PWM_pulse1_carry__0_O_UNCONNECTED[3:0]),
        .S({PWM_counter_n_10,PWM_counter_n_11,PWM_counter_n_12,PWM_counter_n_13}));
  CARRY4 PWM_pulse1_carry__1
       (.CI(PWM_pulse1_carry__0_n_0),
        .CO({PWM_pulse1_carry__1_n_0,PWM_pulse1_carry__1_n_1,PWM_pulse1_carry__1_n_2,PWM_pulse1_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_PWM_pulse1_carry__1_O_UNCONNECTED[3:0]),
        .S({PWM_counter_n_14,PWM_counter_n_15,PWM_counter_n_16,PWM_counter_n_17}));
  CARRY4 PWM_pulse1_carry__2
       (.CI(PWM_pulse1_carry__1_n_0),
        .CO({NLW_PWM_pulse1_carry__2_CO_UNCONNECTED[3:2],PWM_pulse11_in,PWM_pulse1_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_PWM_pulse1_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,PWM_counter_n_18,PWM_counter_n_19}));
  FDSE #(
    .INIT(1'b1)) 
    PWM_pulse_reg
       (.C(clk_out1),
        .CE(PWM_pulse0),
        .D(1'b0),
        .Q(sin_wave_8p),
        .S(PWM_pulse03_out));
endmodule

module clk_wiz_0
   (clk_out1,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;


endmodule

module convertHex_to_sin8p
   (debugDuty,
    sin_wave_8p,
    SR,
    clk_out1);
  output [0:0]debugDuty;
  output sin_wave_8p;
  input [0:0]SR;
  input clk_out1;

  wire [0:0]SR;
  wire clk_out1;
  wire [0:0]debugDuty;
  wire sin_wave_8p;

  sin_wave_8periods sin8p
       (.SR(SR),
        .clk_out1(clk_out1),
        .debugDuty(debugDuty),
        .sin_wave_8p(sin_wave_8p));
endmodule

module counter
   (PWM_pulse03_out,
    DI,
    S,
    PWM_pulse0,
    PWM_pulse_reg,
    PWM_pulse_reg_0,
    PWM_pulse_reg_1,
    PWM_pulse_reg_2,
    SR,
    clk_out1,
    CO,
    PWM_duty_reg);
  output PWM_pulse03_out;
  output [2:0]DI;
  output [3:0]S;
  output PWM_pulse0;
  output [0:0]PWM_pulse_reg;
  output [3:0]PWM_pulse_reg_0;
  output [3:0]PWM_pulse_reg_1;
  output [1:0]PWM_pulse_reg_2;
  input [0:0]SR;
  input clk_out1;
  input [0:0]CO;
  input [0:0]PWM_duty_reg;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [0:0]PWM_duty_reg;
  wire PWM_pulse0;
  wire PWM_pulse03_out;
  wire PWM_pulse_i_3_n_0;
  wire PWM_pulse_i_4_n_0;
  wire [0:0]PWM_pulse_reg;
  wire [3:0]PWM_pulse_reg_0;
  wire [3:0]PWM_pulse_reg_1;
  wire [1:0]PWM_pulse_reg_2;
  wire [3:0]S;
  wire [0:0]SR;
  wire clk_out1;
  wire [26:1]countedTo0;
  wire \countedTo[0]_i_1_n_0 ;
  wire \countedTo[10]_i_1_n_0 ;
  wire \countedTo[11]_i_1_n_0 ;
  wire \countedTo[12]_i_1_n_0 ;
  wire \countedTo[13]_i_1_n_0 ;
  wire \countedTo[14]_i_1_n_0 ;
  wire \countedTo[15]_i_1_n_0 ;
  wire \countedTo[16]_i_1_n_0 ;
  wire \countedTo[17]_i_1_n_0 ;
  wire \countedTo[18]_i_1_n_0 ;
  wire \countedTo[19]_i_1_n_0 ;
  wire \countedTo[1]_i_1_n_0 ;
  wire \countedTo[20]_i_1_n_0 ;
  wire \countedTo[21]_i_1_n_0 ;
  wire \countedTo[22]_i_1_n_0 ;
  wire \countedTo[23]_i_1_n_0 ;
  wire \countedTo[24]_i_1_n_0 ;
  wire \countedTo[25]_i_1_n_0 ;
  wire \countedTo[26]_i_1_n_0 ;
  wire \countedTo[26]_i_3_n_0 ;
  wire \countedTo[26]_i_4_n_0 ;
  wire \countedTo[26]_i_5_n_0 ;
  wire \countedTo[26]_i_6_n_0 ;
  wire \countedTo[26]_i_7_n_0 ;
  wire \countedTo[26]_i_8_n_0 ;
  wire \countedTo[26]_i_9_n_0 ;
  wire \countedTo[2]_i_1_n_0 ;
  wire \countedTo[3]_i_1_n_0 ;
  wire \countedTo[4]_i_1_n_0 ;
  wire \countedTo[5]_i_1_n_0 ;
  wire \countedTo[6]_i_1_n_0 ;
  wire \countedTo[7]_i_1_n_0 ;
  wire \countedTo[8]_i_1_n_0 ;
  wire \countedTo[9]_i_1_n_0 ;
  wire \countedTo_reg[12]_i_2_n_0 ;
  wire \countedTo_reg[12]_i_2_n_1 ;
  wire \countedTo_reg[12]_i_2_n_2 ;
  wire \countedTo_reg[12]_i_2_n_3 ;
  wire \countedTo_reg[16]_i_2_n_0 ;
  wire \countedTo_reg[16]_i_2_n_1 ;
  wire \countedTo_reg[16]_i_2_n_2 ;
  wire \countedTo_reg[16]_i_2_n_3 ;
  wire \countedTo_reg[20]_i_2_n_0 ;
  wire \countedTo_reg[20]_i_2_n_1 ;
  wire \countedTo_reg[20]_i_2_n_2 ;
  wire \countedTo_reg[20]_i_2_n_3 ;
  wire \countedTo_reg[24]_i_2_n_0 ;
  wire \countedTo_reg[24]_i_2_n_1 ;
  wire \countedTo_reg[24]_i_2_n_2 ;
  wire \countedTo_reg[24]_i_2_n_3 ;
  wire \countedTo_reg[26]_i_2_n_3 ;
  wire \countedTo_reg[4]_i_2_n_0 ;
  wire \countedTo_reg[4]_i_2_n_1 ;
  wire \countedTo_reg[4]_i_2_n_2 ;
  wire \countedTo_reg[4]_i_2_n_3 ;
  wire \countedTo_reg[8]_i_2_n_0 ;
  wire \countedTo_reg[8]_i_2_n_1 ;
  wire \countedTo_reg[8]_i_2_n_2 ;
  wire \countedTo_reg[8]_i_2_n_3 ;
  wire [26:0]countedUpTo_wire;
  wire [3:1]\NLW_countedTo_reg[26]_i_2_CO_UNCONNECTED ;
  wire [3:2]\NLW_countedTo_reg[26]_i_2_O_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h2)) 
    PWM_pulse1_carry__0_i_1
       (.I0(PWM_duty_reg),
        .I1(countedUpTo_wire[9]),
        .O(PWM_pulse_reg));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__0_i_2
       (.I0(countedUpTo_wire[14]),
        .I1(countedUpTo_wire[15]),
        .O(PWM_pulse_reg_0[3]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__0_i_3
       (.I0(countedUpTo_wire[13]),
        .I1(countedUpTo_wire[12]),
        .O(PWM_pulse_reg_0[2]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__0_i_4
       (.I0(countedUpTo_wire[11]),
        .I1(countedUpTo_wire[10]),
        .O(PWM_pulse_reg_0[1]));
  LUT3 #(
    .INIT(8'h09)) 
    PWM_pulse1_carry__0_i_5
       (.I0(PWM_duty_reg),
        .I1(countedUpTo_wire[9]),
        .I2(countedUpTo_wire[8]),
        .O(PWM_pulse_reg_0[0]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__1_i_1
       (.I0(countedUpTo_wire[22]),
        .I1(countedUpTo_wire[23]),
        .O(PWM_pulse_reg_1[3]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__1_i_2
       (.I0(countedUpTo_wire[20]),
        .I1(countedUpTo_wire[21]),
        .O(PWM_pulse_reg_1[2]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__1_i_3
       (.I0(countedUpTo_wire[18]),
        .I1(countedUpTo_wire[19]),
        .O(PWM_pulse_reg_1[1]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__1_i_4
       (.I0(countedUpTo_wire[16]),
        .I1(countedUpTo_wire[17]),
        .O(PWM_pulse_reg_1[0]));
  LUT1 #(
    .INIT(2'h1)) 
    PWM_pulse1_carry__2_i_1
       (.I0(countedUpTo_wire[26]),
        .O(PWM_pulse_reg_2[1]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry__2_i_2
       (.I0(countedUpTo_wire[24]),
        .I1(countedUpTo_wire[25]),
        .O(PWM_pulse_reg_2[0]));
  LUT3 #(
    .INIT(8'h02)) 
    PWM_pulse1_carry_i_1
       (.I0(PWM_duty_reg),
        .I1(countedUpTo_wire[6]),
        .I2(countedUpTo_wire[7]),
        .O(DI[2]));
  LUT3 #(
    .INIT(8'h2A)) 
    PWM_pulse1_carry_i_2
       (.I0(PWM_duty_reg),
        .I1(countedUpTo_wire[4]),
        .I2(countedUpTo_wire[5]),
        .O(DI[1]));
  LUT3 #(
    .INIT(8'h02)) 
    PWM_pulse1_carry_i_3
       (.I0(PWM_duty_reg),
        .I1(countedUpTo_wire[0]),
        .I2(countedUpTo_wire[1]),
        .O(DI[0]));
  LUT3 #(
    .INIT(8'h09)) 
    PWM_pulse1_carry_i_4
       (.I0(countedUpTo_wire[6]),
        .I1(PWM_duty_reg),
        .I2(countedUpTo_wire[7]),
        .O(S[3]));
  LUT3 #(
    .INIT(8'h81)) 
    PWM_pulse1_carry_i_5
       (.I0(countedUpTo_wire[5]),
        .I1(countedUpTo_wire[4]),
        .I2(PWM_duty_reg),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse1_carry_i_6
       (.I0(countedUpTo_wire[3]),
        .I1(countedUpTo_wire[2]),
        .O(S[1]));
  LUT3 #(
    .INIT(8'h09)) 
    PWM_pulse1_carry_i_7
       (.I0(countedUpTo_wire[0]),
        .I1(PWM_duty_reg),
        .I2(countedUpTo_wire[1]),
        .O(S[0]));
  LUT6 #(
    .INIT(64'hAAAAAAA2AAAAAAAA)) 
    PWM_pulse_i_1
       (.I0(CO),
        .I1(PWM_pulse_i_3_n_0),
        .I2(countedUpTo_wire[5]),
        .I3(countedUpTo_wire[4]),
        .I4(PWM_pulse_i_4_n_0),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(PWM_pulse03_out));
  LUT6 #(
    .INIT(64'h0001555500000000)) 
    PWM_pulse_i_2
       (.I0(CO),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(PWM_pulse0));
  LUT2 #(
    .INIT(4'h1)) 
    PWM_pulse_i_3
       (.I0(countedUpTo_wire[9]),
        .I1(countedUpTo_wire[8]),
        .O(PWM_pulse_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFD)) 
    PWM_pulse_i_4
       (.I0(\countedTo[26]_i_5_n_0 ),
        .I1(countedUpTo_wire[10]),
        .I2(countedUpTo_wire[1]),
        .I3(countedUpTo_wire[0]),
        .I4(countedUpTo_wire[7]),
        .I5(countedUpTo_wire[6]),
        .O(PWM_pulse_i_4_n_0));
  LUT6 #(
    .INIT(64'h0001555500000000)) 
    \countedTo[0]_i_1 
       (.I0(countedUpTo_wire[0]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[10]_i_1 
       (.I0(countedTo0[10]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[11]_i_1 
       (.I0(countedTo0[11]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[12]_i_1 
       (.I0(countedTo0[12]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[13]_i_1 
       (.I0(countedTo0[13]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[14]_i_1 
       (.I0(countedTo0[14]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[15]_i_1 
       (.I0(countedTo0[15]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[16]_i_1 
       (.I0(countedTo0[16]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[17]_i_1 
       (.I0(countedTo0[17]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[18]_i_1 
       (.I0(countedTo0[18]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[19]_i_1 
       (.I0(countedTo0[19]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[1]_i_1 
       (.I0(countedTo0[1]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[20]_i_1 
       (.I0(countedTo0[20]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[21]_i_1 
       (.I0(countedTo0[21]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[22]_i_1 
       (.I0(countedTo0[22]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[23]_i_1 
       (.I0(countedTo0[23]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[24]_i_1 
       (.I0(countedTo0[24]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[25]_i_1 
       (.I0(countedTo0[25]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[26]_i_1 
       (.I0(countedTo0[26]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8080800080808080)) 
    \countedTo[26]_i_3 
       (.I0(countedUpTo_wire[7]),
        .I1(countedUpTo_wire[6]),
        .I2(countedUpTo_wire[5]),
        .I3(countedUpTo_wire[1]),
        .I4(countedUpTo_wire[4]),
        .I5(\countedTo[26]_i_5_n_0 ),
        .O(\countedTo[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \countedTo[26]_i_4 
       (.I0(\countedTo[26]_i_6_n_0 ),
        .I1(countedUpTo_wire[12]),
        .I2(countedUpTo_wire[13]),
        .I3(\countedTo[26]_i_7_n_0 ),
        .I4(\countedTo[26]_i_8_n_0 ),
        .I5(\countedTo[26]_i_9_n_0 ),
        .O(\countedTo[26]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \countedTo[26]_i_5 
       (.I0(countedUpTo_wire[3]),
        .I1(countedUpTo_wire[2]),
        .O(\countedTo[26]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \countedTo[26]_i_6 
       (.I0(countedUpTo_wire[18]),
        .I1(countedUpTo_wire[19]),
        .I2(countedUpTo_wire[16]),
        .I3(countedUpTo_wire[17]),
        .O(\countedTo[26]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \countedTo[26]_i_7 
       (.I0(countedUpTo_wire[23]),
        .I1(countedUpTo_wire[22]),
        .O(\countedTo[26]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \countedTo[26]_i_8 
       (.I0(countedUpTo_wire[14]),
        .I1(countedUpTo_wire[15]),
        .I2(countedUpTo_wire[20]),
        .I3(countedUpTo_wire[21]),
        .O(\countedTo[26]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \countedTo[26]_i_9 
       (.I0(countedUpTo_wire[24]),
        .I1(countedUpTo_wire[25]),
        .I2(countedUpTo_wire[26]),
        .I3(countedUpTo_wire[11]),
        .O(\countedTo[26]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[2]_i_1 
       (.I0(countedTo0[2]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[3]_i_1 
       (.I0(countedTo0[3]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[4]_i_1 
       (.I0(countedTo0[4]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[5]_i_1 
       (.I0(countedTo0[5]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[6]_i_1 
       (.I0(countedTo0[6]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[7]_i_1 
       (.I0(countedTo0[7]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[8]_i_1 
       (.I0(countedTo0[8]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002AAAA00000000)) 
    \countedTo[9]_i_1 
       (.I0(countedTo0[9]),
        .I1(\countedTo[26]_i_3_n_0 ),
        .I2(countedUpTo_wire[9]),
        .I3(countedUpTo_wire[8]),
        .I4(countedUpTo_wire[10]),
        .I5(\countedTo[26]_i_4_n_0 ),
        .O(\countedTo[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[0]_i_1_n_0 ),
        .Q(countedUpTo_wire[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[10] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[10]_i_1_n_0 ),
        .Q(countedUpTo_wire[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[11] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[11]_i_1_n_0 ),
        .Q(countedUpTo_wire[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[12] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[12]_i_1_n_0 ),
        .Q(countedUpTo_wire[12]),
        .R(SR));
  CARRY4 \countedTo_reg[12]_i_2 
       (.CI(\countedTo_reg[8]_i_2_n_0 ),
        .CO({\countedTo_reg[12]_i_2_n_0 ,\countedTo_reg[12]_i_2_n_1 ,\countedTo_reg[12]_i_2_n_2 ,\countedTo_reg[12]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[12:9]),
        .S(countedUpTo_wire[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[13] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[13]_i_1_n_0 ),
        .Q(countedUpTo_wire[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[14] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[14]_i_1_n_0 ),
        .Q(countedUpTo_wire[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[15] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[15]_i_1_n_0 ),
        .Q(countedUpTo_wire[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[16] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[16]_i_1_n_0 ),
        .Q(countedUpTo_wire[16]),
        .R(SR));
  CARRY4 \countedTo_reg[16]_i_2 
       (.CI(\countedTo_reg[12]_i_2_n_0 ),
        .CO({\countedTo_reg[16]_i_2_n_0 ,\countedTo_reg[16]_i_2_n_1 ,\countedTo_reg[16]_i_2_n_2 ,\countedTo_reg[16]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[16:13]),
        .S(countedUpTo_wire[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[17] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[17]_i_1_n_0 ),
        .Q(countedUpTo_wire[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[18] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[18]_i_1_n_0 ),
        .Q(countedUpTo_wire[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[19] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[19]_i_1_n_0 ),
        .Q(countedUpTo_wire[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[1]_i_1_n_0 ),
        .Q(countedUpTo_wire[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[20] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[20]_i_1_n_0 ),
        .Q(countedUpTo_wire[20]),
        .R(SR));
  CARRY4 \countedTo_reg[20]_i_2 
       (.CI(\countedTo_reg[16]_i_2_n_0 ),
        .CO({\countedTo_reg[20]_i_2_n_0 ,\countedTo_reg[20]_i_2_n_1 ,\countedTo_reg[20]_i_2_n_2 ,\countedTo_reg[20]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[20:17]),
        .S(countedUpTo_wire[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[21] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[21]_i_1_n_0 ),
        .Q(countedUpTo_wire[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[22] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[22]_i_1_n_0 ),
        .Q(countedUpTo_wire[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[23] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[23]_i_1_n_0 ),
        .Q(countedUpTo_wire[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[24] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[24]_i_1_n_0 ),
        .Q(countedUpTo_wire[24]),
        .R(SR));
  CARRY4 \countedTo_reg[24]_i_2 
       (.CI(\countedTo_reg[20]_i_2_n_0 ),
        .CO({\countedTo_reg[24]_i_2_n_0 ,\countedTo_reg[24]_i_2_n_1 ,\countedTo_reg[24]_i_2_n_2 ,\countedTo_reg[24]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[24:21]),
        .S(countedUpTo_wire[24:21]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[25] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[25]_i_1_n_0 ),
        .Q(countedUpTo_wire[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[26] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[26]_i_1_n_0 ),
        .Q(countedUpTo_wire[26]),
        .R(SR));
  CARRY4 \countedTo_reg[26]_i_2 
       (.CI(\countedTo_reg[24]_i_2_n_0 ),
        .CO({\NLW_countedTo_reg[26]_i_2_CO_UNCONNECTED [3:1],\countedTo_reg[26]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_countedTo_reg[26]_i_2_O_UNCONNECTED [3:2],countedTo0[26:25]}),
        .S({1'b0,1'b0,countedUpTo_wire[26:25]}));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[2]_i_1_n_0 ),
        .Q(countedUpTo_wire[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[3]_i_1_n_0 ),
        .Q(countedUpTo_wire[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[4]_i_1_n_0 ),
        .Q(countedUpTo_wire[4]),
        .R(SR));
  CARRY4 \countedTo_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\countedTo_reg[4]_i_2_n_0 ,\countedTo_reg[4]_i_2_n_1 ,\countedTo_reg[4]_i_2_n_2 ,\countedTo_reg[4]_i_2_n_3 }),
        .CYINIT(countedUpTo_wire[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[4:1]),
        .S(countedUpTo_wire[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[5] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[5]_i_1_n_0 ),
        .Q(countedUpTo_wire[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[6] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[6]_i_1_n_0 ),
        .Q(countedUpTo_wire[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[7] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[7]_i_1_n_0 ),
        .Q(countedUpTo_wire[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[8] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[8]_i_1_n_0 ),
        .Q(countedUpTo_wire[8]),
        .R(SR));
  CARRY4 \countedTo_reg[8]_i_2 
       (.CI(\countedTo_reg[4]_i_2_n_0 ),
        .CO({\countedTo_reg[8]_i_2_n_0 ,\countedTo_reg[8]_i_2_n_1 ,\countedTo_reg[8]_i_2_n_2 ,\countedTo_reg[8]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(countedTo0[8:5]),
        .S(countedUpTo_wire[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \countedTo_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\countedTo[9]_i_1_n_0 ),
        .Q(countedUpTo_wire[9]),
        .R(SR));
endmodule

module separateASCII_to_hex
   (debugDuty,
    sin_wave_8p,
    SR,
    clk_out1);
  output [0:0]debugDuty;
  output sin_wave_8p;
  input [0:0]SR;
  input clk_out1;

  wire [0:0]SR;
  wire clk_out1;
  wire [0:0]debugDuty;
  wire sin_wave_8p;

  convertHex_to_sin8p hexToSin8p
       (.SR(SR),
        .clk_out1(clk_out1),
        .debugDuty(debugDuty),
        .sin_wave_8p(sin_wave_8p));
endmodule

module sin_wave
   (debugDuty,
    sin_wave_8p,
    SR,
    clk_out1);
  output [0:0]debugDuty;
  output sin_wave_8p;
  input [0:0]SR;
  input clk_out1;

  wire [0:0]SR;
  wire clk_out1;
  wire [0:0]debugDuty;
  wire sin_wave_8p;

  FDRE #(
    .INIT(1'b0)) 
    \dutyCycle_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(1'b1),
        .Q(debugDuty),
        .R(SR));
  PWM sin_wavePWM
       (.SR(SR),
        .clk_out1(clk_out1),
        .debugDuty(debugDuty),
        .sin_wave_8p(sin_wave_8p));
endmodule

module sin_wave_8periods
   (debugDuty,
    sin_wave_8p,
    SR,
    clk_out1);
  output [0:0]debugDuty;
  output sin_wave_8p;
  input [0:0]SR;
  input clk_out1;

  wire [0:0]SR;
  wire clk_out1;
  wire [0:0]debugDuty;
  wire sin_wave_8p;

  sin_wave sin8periods
       (.SR(SR),
        .clk_out1(clk_out1),
        .debugDuty(debugDuty),
        .sin_wave_8p(sin_wave_8p));
endmodule

(* NotValidForBitStream *)
module top
   (CLK,
    BTN,
    LED,
    JA);
  input CLK;
  input [4:0]BTN;
  output [15:0]LED;
  output [7:0]JA;

  wire [4:0]BTN;
  wire [0:0]BTN_IBUF;
  wire CLK;
  wire [7:0]JA;
  wire [1:0]JA_OBUF;
  wire [15:0]LED;
  wire [1:1]LED_OBUF;
  wire NLW_newClockUt_locked_UNCONNECTED;

initial begin
 $sdf_annotate("PWM_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF \BTN_IBUF[0]_inst 
       (.I(BTN[0]),
        .O(BTN_IBUF));
  OBUF \JA_OBUF[0]_inst 
       (.I(JA_OBUF[0]),
        .O(JA[0]));
  OBUF \JA_OBUF[1]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[1]));
  OBUF \JA_OBUF[2]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[2]));
  OBUF \JA_OBUF[3]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[3]));
  OBUF \JA_OBUF[4]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[4]));
  OBUF \JA_OBUF[5]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[5]));
  OBUF \JA_OBUF[6]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[6]));
  OBUF \JA_OBUF[7]_inst 
       (.I(JA_OBUF[1]),
        .O(JA[7]));
  OBUF \LED_OBUF[0]_inst 
       (.I(1'b1),
        .O(LED[0]));
  OBUF \LED_OBUF[10]_inst 
       (.I(LED_OBUF),
        .O(LED[10]));
  OBUF \LED_OBUF[11]_inst 
       (.I(1'b0),
        .O(LED[11]));
  OBUF \LED_OBUF[12]_inst 
       (.I(1'b0),
        .O(LED[12]));
  OBUF \LED_OBUF[13]_inst 
       (.I(1'b0),
        .O(LED[13]));
  OBUF \LED_OBUF[14]_inst 
       (.I(1'b0),
        .O(LED[14]));
  OBUF \LED_OBUF[15]_inst 
       (.I(1'b0),
        .O(LED[15]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(1'b0),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(1'b0),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(1'b0),
        .O(LED[4]));
  OBUF \LED_OBUF[5]_inst 
       (.I(LED_OBUF),
        .O(LED[5]));
  OBUF \LED_OBUF[6]_inst 
       (.I(LED_OBUF),
        .O(LED[6]));
  OBUF \LED_OBUF[7]_inst 
       (.I(LED_OBUF),
        .O(LED[7]));
  OBUF \LED_OBUF[8]_inst 
       (.I(1'b0),
        .O(LED[8]));
  OBUF \LED_OBUF[9]_inst 
       (.I(1'b0),
        .O(LED[9]));
  separateASCII_to_hex const
       (.SR(BTN_IBUF),
        .clk_out1(JA_OBUF[0]),
        .debugDuty(LED_OBUF),
        .sin_wave_8p(JA_OBUF[1]));
  clk_wiz_0 newClockUt
       (.clk_in1(CLK),
        .clk_out1(JA_OBUF[0]),
        .locked(NLW_newClockUt_locked_UNCONNECTED),
        .reset(BTN_IBUF));
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
