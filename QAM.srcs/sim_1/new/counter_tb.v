`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2018 03:53:15 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb( );
    reg clock, reset, up_count;
    reg [26:0] period;
    wire [26:0] countedTo;
    
    counter uut( 
        .clock(clock), 
        .reset(reset), 
        .up_count(up_count), 
        .period(period), 
        .countedTo(countedTo) 
        );
    parameter [26:0] PERIOD = 27'd100_000_000;
    parameter [26:0] HALF_PERIOD = PERIOD >> 1;
    parameter [26:0] QUARTER_PERIOD = PERIOD >> 2;
    parameter [26:0] PERC75_PERIOD = QUARTER_PERIOD + HALF_PERIOD;
    //run for run 2500001000ns
    initial begin
        {clock, reset, up_count, period} = 0;
        #10
        reset = 1;
        #10
        //test
        up_count = 1;
        reset = 0;
        period = PERIOD;
        #1_000_000_000
        reset = 1;
        #10
        //test
        reset = 0;
        period = HALF_PERIOD;
        #500_000_010
        reset = 1;
        #10
        //test
        reset = 0;
        period = QUARTER_PERIOD;
        #250_000_010
        reset = 1;
        #10
        reset = 0;
        //test
        reset = 0;
        period = PERC75_PERIOD;
        #750_000_010
        reset = 1;
        #10
        reset = 0;
    end
    always #1.25 clock = ~clock;
endmodule
