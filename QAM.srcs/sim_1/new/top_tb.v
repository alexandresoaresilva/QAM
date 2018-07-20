`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2018 12:55:33 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

reg CLK;                                
reg [4:0] BTN; 
wire [15:0] LED;
wire [7:0] JA;
parameter time_total = 160_000*2*336; //160 us per symbol, 2 symbols for one char, 336 chars
top uut(.CLK(CLK),.BTN(BTN), .LED(LED), .JA(JA) );
initial begin
    
    {CLK, BTN} = 0;
    #10
        BTN = 1;
    #360
        BTN = 0;
    #10
    #time_total;
    $finish;
end
always #5 CLK = ~CLK;
endmodule
