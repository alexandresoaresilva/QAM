`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2018 02:30:11 AM
// Design Name: 
// Module Name: sin_wave_Xperiods_tb
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


module sin_wave_Xperiods_tb();
      reg clock, reset;
      reg [1:0] amplitude_select;
      reg [5:0] offset;
      wire sin_waves;
      wire [7:0] debugDuty;
      wire [2:0] debug_periods;
      
       sin_wave_Xperiods uut(
            .clock(clock), 
            .reset(reset),
            .amplitude_select(amplitude_select),
            .offset(offset),
            .sin_waves(sin_waves),
            .debugDuty(debugDuty),
            .debug_periods(debug_periods)
            );
        //[11:0] =  {7'd43, 7'd48, 7'd53, 7'd63, 7'd68, 7'd73, 7'd4, 7'd90, 7'd14, 7'd24, 7'd29, 7'd34};
       initial begin
            {offset, amplitude_select, clock, reset} = 0;
            #250
            reset<= 1;
            #250
            reset<= 0;
            #16_000_000 // 8 ms
            amplitude_select <= 2'd0;
            offset<= 6'd19;
            #16_000_000 // 8 ms
            amplitude_select <= 2'd0;
            offset<=6'd45;
            #16_000_000 // 8 ms
            amplitude_select <= 2'd1;
            offset<=6'd8;
            #16_000_000 // 8 ms
            amplitude_select <= 2'd2;
            offset<=6'd29;
            #16_000_000 // 8 ms
            amplitude_select <= 2'd3;
            #16_000_000 // 8 ms
            $finish;
       end
       
      always begin  #125 clock = ~clock; end 
endmodule