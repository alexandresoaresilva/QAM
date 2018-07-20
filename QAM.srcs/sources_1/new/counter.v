`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2018 03:44:47 PM
// Design Name: 
// Module Name: counter
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
//counts up to 100,000,000

module counter(
 input clock, reset, up_count,
    input [28:0] period,
    output reg [28:0] countedTo 
    );
        
//    initial 
//        countedTo <= 0;
    
    always@(posedge clock) begin
        if ( reset )
            countedTo <= 0;
        else begin
            case(up_count)
                1'b0: if ( period > 0 && ( countedTo > 0 ) )
                        countedTo <= countedTo - 1;
                      else
                        countedTo <= period;
                1'b1: if ( period >= 0 && ( countedTo < period-1 )  ) 
                        countedTo <= countedTo + 1;
                      else
                        countedTo <= 0;
            endcase
        end
    end
    
endmodule