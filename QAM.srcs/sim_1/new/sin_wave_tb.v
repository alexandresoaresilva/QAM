`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2018 08:30:58 PM
// Design Name: 
// Module Name: sin_wave_tb
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


module sin_wave_tb();
reg clock, reset;
reg [1:0] amplitude_select;
reg [6:0] offset_sampleSelect;
wire sin_PWM;
wire [7:0] dutyCycle_out; 

sin_wave uut(
    .clock(clock),
    .reset(reset),
    .amplitude_select(amplitude_select),
    .offset_sampleSelect(offset_sampleSelect),
    .sin_PWM(sin_PWM),
    .dutyCycle_out(dutyCycle_out)
    ); 
//    phases=[ -157.5 == 7'd43 == -2.75 %
//             -135.0 == 7'd48 ==  -2.36
//             -112.5 == 7'd53 == -1.96
//              -67.5 == 7'd63 == -1.18
//              -45.0 == 7'd68 == -0.79
//              -22.5 == 7'd73 == -0.39 %
//               22.5 == 7'd4 == 0.39
//               45.0 == 7'd90 == 0.79
//               67.5 == 7'd14 == 1.18 %
//              112.5 == 7'd24 == 1.96
//              135.0 == 7'd29 == 2.36
//              157.5 == 7'd34 == 2.75 %
   //[11:0] =  {7'd43, 7'd48, 7'd53, 7'd63, 7'd68, 7'd73, 7'd4, 7'd90, 7'd14, 7'd24, 7'd29, 7'd34};
    initial begin
        {clock, reset,amplitude_select}=0;
          #250
         reset = 1;
         #250
         reset = 0;
        offset_sampleSelect <= 6'd0;
        #4_000_000 // 1 ms
        offset_sampleSelect <= 6'd19;
        #4_000_000 // 1 ms
        amplitude_select = 2'd0;
        offset_sampleSelect <= 6'd45;
        #4_000_000;
        amplitude_select = 2'd1;
        offset_sampleSelect <= 6'd8;
        #4_000_000;
        amplitude_select <= 2'd2;
        offset_sampleSelect <= 6'd29;
        #4_000_000;
        amplitude_select <= 6'd3;
        #4_000_000;
        $finish;
    end
    always #125 clock = ~clock;
endmodule