`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2018 01:54:00 PM
// Design Name: 
// Module Name: AD9850_program_tb
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


module AD9850_program_tb( );
reg reset, clock, freq_update;
reg [31:0] newFreq; 
reg [4:0] phase;
 
wire [7:0] DATA;
wire W_CLK;
wire FQ_UD;

AD_9850_program uut(
    .reset(reset), 
    .clock(clock), 
    .newFreq(newFreq), 
    .phase(phase), 
    .freq_update(freq_update),
    .DATA(DATA), 
    .W_CLK(W_CLK), 
    .FQ_UD(FQ_UD)
    );

        initial begin
            {clock, reset, freq_update,  newFreq, phase} = 0;
            #10
            reset <= 1;
            #10
            reset <= 0;
            #220
            newFreq <= 32'd1979120930; 
            phase <= 5'd8;
            freq_update <= 1;
            #100
            freq_update <= 0;
            #10000000
            $finish;
        end
        
        always #5 clock = ~clock;
endmodule
