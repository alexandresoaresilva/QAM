`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2018 04:21:37 AM
// Design Name: 
// Module Name: separateASCII_to_hex_tb
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
module separateASCII_to_hex_tb();
    reg clock, reset;
    //output [11:0] sin_waveConst,
    wire sin_waveConst, doneConvertingConst; 
    wire [7:0] debugDuty;
    wire [8:0] index;
    wire [2:0] debugXPeriod;
    wire [3:0] debug_HexSending;
    parameter [32:0] time_spent = 336*16_000_000*2;
separateASCII_to_hex uut(
        .clock(clock),
        .reset(reset),
        .sin_waveConst(sin_waveConst),
        .doneConvertingConst(doneConvertingConst),
        .debugDuty(debugDuty),
        .index(index),
        .debugXPeriod(debugXPeriod),
        .debug_HexSending(debug_HexSending) );
        
initial begin
    {clock, reset} <= 0;
    #250
    reset <= 1;
    #250
    reset <= 0;
    #250
    #time_spent;
    $finish;
end

always #125 clock = ~clock;
endmodule