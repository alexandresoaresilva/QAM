`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2018 04:47:34 PM
// Design Name: 
// Module Name: ad9850_driver_tb
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
module adDriver_Tb();

    reg reset; 
    reg clock; 
    reg [2:0] freq_phase_select;
    wire [7:0] DATA;
    wire W_CLK;
    wire FQ_UD;
    
 aDriver uut(
       .reset(reset),
       .clock(clock), 
       .freq_phase_select(freq_phase_select),
       .DATA(DATA), 
       .W_CLK(W_CLK), 
       .FQ_UD(FQ_UD)
       );
       
        initial begin
           {clock, reset, freq_phase_select} = 0;
           #10
           reset <= 1;
           #10
           reset <= 0;
           #20
           freq_phase_select <= 3'd1;
           #10000
           freq_phase_select <= 3'd2;
           #100000
           $finish;
       end
       
       always #5 clock = ~clock;
endmodule
