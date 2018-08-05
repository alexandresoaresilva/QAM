`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2018 03:35:14 PM
// Design Name: 
// Module Name: top
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


module top( input CLK,
            input [4:0] BTN, [2:0]SW,
            output [15:0] LED, [7:0] JA,  [7:0] JB);
    wire newClock, locked;
    //wire clk_400MHz;
    wire buttons;
    
    //wire doneConvertingConst_wire; 
    wire [9:0] debugDuty_wire;
    wire [9:0] index;
    wire [3:0] debugXPeriod;
    wire sin_waveConst;
    wire [3:0] debug_HexSending_wire;
    wire [28:0]  countedUpTo_wire;
    reg reset_reg;
    
 separateASCII_to_hex const(
//         .clock(clk_400MHz),
         .clock(CLK),
         .reset(buttons),
         .sin_waveConst(sin_waveConst),
         .doneConvertingConst(LED[0]),
         .debugDuty(debugDuty_wire),
         .index(index),
         .debugXPeriod(debugXPeriod),
         .debug_HexSending(debug_HexSending_wire) );
    
//    clk_wiz_0 newClockUt (
//  // Clock out ports
//  .clk_out1(clk_400MHz),
//  // Status and control signals
//  .reset(1'b0),
//  .locked(locked),
// // Clock in ports
//  .clk_in1(CLK)
// );

//     defparam sin_wavePWM.PERIOD = 16;
//     PWM sin_wavePWM(
//         .clock(CLK),
//         .reset(buttons),
//         .dutyCycle(8),
//         .PWM_pulse(newClock)
//     //  .debug_counter(debugCustomClkCounter_wire)
//     );
    reg [63:0] counter;
    
    initial {counter, reset_reg} <= 1;
    
    always@(posedge CLK) begin //it executes the rest correctly
        if(buttons)
            counter <= 0;
        else
            counter <= counter + 1;
        if (counter > 64'd50 )
            reset_reg = 0;
    end
    //[63:0] s_axis_config_tdata INPUT
//   wire dds_stuff
    wire W_CLK_wire, FQ_UD_wire;
aDriver DDS(
    .reset(reset_reg | buttons), 
    .clock(CLK), 
    .freq_phase_select(SW[2:0]),
    .DATA(JB[7:0]), 
    .W_CLK(W_CLK_wire), 
    .FQ_UD(FQ_UD_wire)
    );

    assign LED[15:1] = 15'd0 | debugDuty_wire;
    assign buttons = 1'd0 ||(|BTN);
  //  assign newClock = clk_400MHz : 1'd0;
    //assign JA = {clk_400MHz, CLK, 4'd0, {2{sin_waveConst}}};
    assign JA = {1'b0,CLK, 2'd0,FQ_UD_wire, W_CLK_wire, {2{sin_waveConst}}};
    //assign newClock_wire = ~locked 
       
endmodule
