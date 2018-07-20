`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2018 08:00:13 PM
// Design Name: 
// Module Name: PWM_tb
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

module PWM_tb();
	reg clock;
	reg reset;
	reg [7:0] dutyCycle;
	wire PWM_pulse;
	//wire [28:0] debugCustomClkCounter_wire;
    PWM UUT (
        .clock(clock),
        .reset(reset),
        .dutyCycle(dutyCycle),
        .PWM_pulse(PWM_pulse)//,
        //.debug_counter(debugCustomClkCounter_wire)
    );
	
    initial begin {clock, dutyCycle, reset} = 0;
        #250
        reset <= 1;
        #250
        reset <= 0;
        dutyCycle <= 8'd125;
        #62500 dutyCycle <= 8'd137;
        #62500 dutyCycle <= 8'd150;
        #62500 dutyCycle <= 8'd162;
        #62500 dutyCycle <= 8'd174;
        #62500 dutyCycle <= 8'd185;
        #62500 dutyCycle <= 8'd195;
        #62500 dutyCycle <= 8'd205;
        #62500 dutyCycle <= 8'd215;
        #62500 dutyCycle <= 8'd223;
        #62500 dutyCycle <= 8'd230;
        #62500 dutyCycle <= 8'd236;
        #62500 dutyCycle <= 8'd241;
        #62500 dutyCycle <= 8'd245;
        #62500 dutyCycle <= 8'd248;
        #62500 dutyCycle <= 8'd250;
        #62500 dutyCycle <= 8'd250;
        #62500 dutyCycle <= 8'd249;
        #62500 dutyCycle <= 8'd247;
        #62500 dutyCycle <= 8'd244;
        #62500 dutyCycle <= 8'd239;
        #62500 dutyCycle <= 8'd233;
        #62500 dutyCycle <= 8'd227;
        #62500 dutyCycle <= 8'd219;
        #62500 dutyCycle <= 8'd210;
        #62500 dutyCycle <= 8'd200;
        #62500 dutyCycle <= 8'd190;
        #62500 dutyCycle <= 8'd179;
        #62500 dutyCycle <= 8'd168;
        #62500 dutyCycle <= 8'd156;
        #62500 dutyCycle <= 8'd144;
        #62500 dutyCycle <= 8'd131;
        #62500 dutyCycle <= 8'd119;
        #62500 dutyCycle <= 8'd106;
        #62500 dutyCycle <= 8'd94;
        #62500 dutyCycle <= 8'd82;
        #62500 dutyCycle <= 8'd71;
        #62500 dutyCycle <= 8'd60;
        #62500 dutyCycle <= 8'd50;
        #62500 dutyCycle <= 8'd40;
        #62500 dutyCycle <= 8'd31;
        #62500 dutyCycle <= 8'd23;
        #62500 dutyCycle <= 8'd17;
        #62500 dutyCycle <= 8'd11;
        #62500 dutyCycle <= 8'd6;
        #62500 dutyCycle <= 8'd3;
        #62500 dutyCycle <= 8'd1;
        #62500 dutyCycle <= 8'd0;
        #62500 dutyCycle <= 8'd0;
        #62500 dutyCycle <= 8'd2;
        #62500 dutyCycle <= 8'd5;
        #62500 dutyCycle <= 8'd9;
        #62500 dutyCycle <= 8'd14;
        #62500 dutyCycle <= 8'd20;
        #62500 dutyCycle <= 8'd27;
        #62500 dutyCycle <= 8'd35;
        #62500 dutyCycle <= 8'd45;
        #62500 dutyCycle <= 8'd55;
        #62500 dutyCycle <= 8'd65;
        #62500 dutyCycle <= 8'd76;
        #62500 dutyCycle <= 8'd88;
        #62500 dutyCycle <= 8'd100;
        #62500 dutyCycle <= 8'd113;
        #62500 dutyCycle <= 8'd125;
        #62500 dutyCycle <= 8'd125;
        #62500 dutyCycle <= 8'd137;
        #62500 dutyCycle <= 8'd150;
        #62500 dutyCycle <= 8'd162;
        #62500 dutyCycle <= 8'd174;
        #62500 dutyCycle <= 8'd185;
        #62500 dutyCycle <= 8'd195;
        #62500 dutyCycle <= 8'd205;
        #62500 dutyCycle <= 8'd215;
        #62500 dutyCycle <= 8'd223;
        #62500 dutyCycle <= 8'd230;
        #62500 dutyCycle <= 8'd236;
        #62500 dutyCycle <= 8'd241;
        #62500 dutyCycle <= 8'd245;
        #62500 dutyCycle <= 8'd248;
        #62500 dutyCycle <= 8'd250;
        #62500 dutyCycle <= 8'd250;
        #62500 dutyCycle <= 8'd249;
        #62500 dutyCycle <= 8'd247;
        #62500 dutyCycle <= 8'd244;
        #62500 dutyCycle <= 8'd239;
        #62500 dutyCycle <= 8'd233;
        #62500 dutyCycle <= 8'd227;
        #62500 dutyCycle <= 8'd219;
        #62500 dutyCycle <= 8'd210;
        #62500 dutyCycle <= 8'd200;
        #62500 dutyCycle <= 8'd190;
        #62500 dutyCycle <= 8'd179;
        #62500 dutyCycle <= 8'd168;
        #62500 dutyCycle <= 8'd156;
        #62500 dutyCycle <= 8'd144;
        #62500 dutyCycle <= 8'd131;
        #62500 dutyCycle <= 8'd119;
        #62500 dutyCycle <= 8'd106;
        #62500 dutyCycle <= 8'd94;
        #62500 dutyCycle <= 8'd82;
        #62500 dutyCycle <= 8'd71;
        #62500 dutyCycle <= 8'd60;
        #62500 dutyCycle <= 8'd50;
        #62500 dutyCycle <= 8'd40;
        #62500 dutyCycle <= 8'd31;
        #62500 dutyCycle <= 8'd23;
        #62500 dutyCycle <= 8'd17;
        #62500 dutyCycle <= 8'd11;
        #62500 dutyCycle <= 8'd6;
        #62500 dutyCycle <= 8'd3;
        #62500 dutyCycle <= 8'd1;
        #62500 dutyCycle <= 8'd0;
        #62500 dutyCycle <= 8'd0;
        #62500 dutyCycle <= 8'd2;
        #62500 dutyCycle <= 8'd5;
        #62500 dutyCycle <= 8'd9;
        #62500 dutyCycle <= 8'd14;
        #62500 dutyCycle <= 8'd20;
        #62500 dutyCycle <= 8'd27;
        #62500 dutyCycle <= 8'd35;
        #62500 dutyCycle <= 8'd45;
        #62500 dutyCycle <= 8'd55;
        #62500 dutyCycle <= 8'd65;
        #62500 dutyCycle <= 8'd76;
        #62500 dutyCycle <= 8'd88;
        #62500 dutyCycle <= 8'd100;
        #62500 dutyCycle <= 8'd113;
        #62500 dutyCycle <= 8'd125;
        $finish;
	end
	
	always # 125 clock = ~clock;
endmodule