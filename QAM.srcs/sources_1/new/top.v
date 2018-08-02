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
            input [4:0] BTN, 
            output [15:0] LED, [7:0] JA );
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
//    reg [63:0] counter;
    
//    initial {counter, reset_reg} <= 1;
    
//    always@(posedge CLK) begin
//        if(buttons)
//            counter <= 0;
//        else
//            counter <= counter + 1;
//        if (counter > 64'd50 )
//            reset_reg = 0;
//    end
    //[63:0] s_axis_config_tdata INPUT
//   wire dds_stuff
//dds_compiler_test uut
//  (
//    .aclk(CLK), 
//    .s_axis_config_tvalid(),
//    .s_axis_config_tdata(), //(63 DOWNTO 0);
//    .s_axis_config_tlast(),// : IN STD_LOGIC;
//    .m_axis_data_tvalid(),// : OUT STD_LOGIC;
//    .m_axis_data_tdata(),// : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
//    .m_axis_phase_tvalid(),// : OUT STD_LOGIC;
//    .m_axis_phase_tdata(),// : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
//    .event_s_config_tlast_missing(),// : OUT STD_LOGIC;
//    .event_s_config_tlast_unexpected()// : OUT STD_LOGIC
//  );

    assign LED[15:1] = 15'd0 | debugDuty_wire;
    assign buttons = 1'd0 ||(|BTN);
  //  assign newClock = clk_400MHz : 1'd0;
    //assign JA = {clk_400MHz, CLK, 4'd0, {2{sin_waveConst}}};
    assign JA = {1'b0,CLK, 4'd0, {2{sin_waveConst}}};
    //assign newClock_wire = ~locked 
       
endmodule
