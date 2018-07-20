`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2018 02:21:32 AM
// Design Name: 
// Module Name: conv_Hex_to_sin_Xperiods_tb
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


module conv_Hex_to_sin_Xperiods_tb();
    reg reset, clock;
    reg [3:0] hexNo;
    wire sin_wave;
    wire [7:0] debugDuty;
    wire [2:0] debug_periods;
    wire doneConverting;
   
    
    conv_Hex_to_sin_Xperiods uut(
        .reset(reset),
        .clock(clock),
        .hexNo(hexNo),
        .sin_wave(sin_wave),
        .doneConverting(doneConverting),
        .debugDuty(debugDuty),
        .debug_periods(debug_periods)
        );
        
        integer i;
                
        initial begin
            {clock, reset} = 0;
            #250
            reset = 1;
            #250
            reset = 0;
            for(i=0; i<16; i = i + 1) begin
                hexNo <= (4'hF & i);
                #16_000_000;
                //#32_000_000;
            end
            $finish;     
        end
        always #125 clock = ~clock;
endmodule