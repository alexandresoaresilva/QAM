`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2018 06:57:30 PM
// Design Name: 
// Module Name: newClock
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


module newClock(
    input CLK,
    output new_clock
    );
    reg [1:0] delay_reg;
    reg [1:0] signal;
    initial begin 
        delay_reg <= 0;
        signal <= 0;
    end
    
    always@(posedge CLK) begin
        delay_reg <= !delay_reg;
        //signal <= !signal; 
    end
    
    always@(negedge CLK) begin
        signal[0] <= delay_reg;
        delay_reg <= !delay_reg; 
    end
    
    always@(posedge signal[0]) begin
        delay_reg <= !delay_reg; 
    end

    always@(posedge signal) begin
        delay_reg <= !delay_reg; 
    end    
endmodule
