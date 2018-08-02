`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2018 06:11:53 PM
// Design Name: 
// Module Name: sin_wave
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


module sin_wave(
    input clock, reset,
    input [1:0] amplitude_select,
    //input amp_selectFlatVoltage,
	input [6:0] offset_sampleSelect,
    output sin_PWM,
    output [9:0] dutyCycle_out,
    output [6:0] sample_select_out
    );
	
	parameter [28:0] PERIOD_PWM = 29'd800;
	parameter [28:0] HALF_PERIOD_PWM = PERIOD_PWM >> 1;
	
    reg previousClk;
    reg [9:0] dutyCycle;
    reg [6:0] sample_select;
    reg [6:0] previous_offset;
    wire PWM_pulse, newClock;
    parameter [6:0] SAMPLES_MAX = 7'd124;
    //wire [26:0] debugCustomClkCounter_wire;
    
    defparam sin_wavePWM.PERIOD = PERIOD_PWM;
    PWM sin_wavePWM(
        .clock(clock),
        .reset(reset),
        .dutyCycle(dutyCycle),
        .PWM_pulse(sin_PWM)
      //  .debug_counter(debugCustomClkCounter_wire)
    );
    //32 KHz clock
    defparam clockNew.PERIOD = PERIOD_PWM;
    PWM clockNew(
        .clock(clock),
        .reset(reset),
        .dutyCycle(HALF_PERIOD_PWM[9:0]),
        .PWM_pulse(newClock)
        //.debug_counter(debugCustomClkCounter_wire)
    );
//    initial begin
//        {sample_select, dutyCycle, previousClk,previous_offset} <= 0;
//    end
    
    always@(posedge clock) begin
    //always@(posedge clock) begin
        if (reset) begin
            sample_select<=0;
            dutyCycle<=0;
            previousClk<=0;
            previous_offset <= 0;
        end
        else begin
			if (amplitude_select == 2'd0 ) begin
/*
			START OF 16-QAM  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			freq signal: 25000
			symbol rate: 6250
			sample rate(PWM), Hz: 1600000
			SAMPLES perPeriod: 64
			clock ticks in one PWM period: 250
			PWM_freq: 1600000
			step in degrees/sample: 5.625
			amplitude 1: 0.5
			amplitude 2: 1
			amplitude 3: 1.5
			------------------------------------
			*/
			/*phases
			64 samples/period: -161.5651 deg == 35
			64 samples/period: -135 deg == 40
			64 samples/period: -108.4349 deg == 45
			64 samples/period: -71.5651 deg == 51
			64 samples/period: -45 deg == 56
			64 samples/period: -18.4349 deg == 61
			64 samples/period: 18.4349 deg == 3
			64 samples/period: 45 deg == 8
			64 samples/period: 71.5651 deg == 13
			64 samples/period: 108.4349 deg == 19
			64 samples/period: 135 deg == 24
			64 samples/period: 161.5651 deg == 29
			END OF 16-QAM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			*/
			
				//max duty: 533
				case(sample_select) //125 need 125 cases
					7'd0 : dutyCycle <= 10'd400;
					7'd1 : dutyCycle <= 10'd407;
					7'd2 : dutyCycle <= 10'd413;
					7'd3 : dutyCycle <= 10'd420;
					7'd4 : dutyCycle <= 10'd427;
					7'd5 : dutyCycle <= 10'd433;
					7'd6 : dutyCycle <= 10'd440;
					7'd7 : dutyCycle <= 10'd446;
					7'd8 : dutyCycle <= 10'd453;
					7'd9 : dutyCycle <= 10'd459;
					7'd10 : dutyCycle <= 10'd465;
					7'd11 : dutyCycle <= 10'd471;
					7'd12 : dutyCycle <= 10'd476;
					7'd13 : dutyCycle <= 10'd482;
					7'd14 : dutyCycle <= 10'd487;
					7'd15 : dutyCycle <= 10'd492;
					7'd16 : dutyCycle <= 10'd497;
					7'd17 : dutyCycle <= 10'd501;
					7'd18 : dutyCycle <= 10'd505;
					7'd19 : dutyCycle <= 10'd509;
					7'd20 : dutyCycle <= 10'd513;
					7'd21 : dutyCycle <= 10'd517;
					7'd22 : dutyCycle <= 10'd520;
					7'd23 : dutyCycle <= 10'd523;
					7'd24 : dutyCycle <= 10'd525;
					7'd25 : dutyCycle <= 10'd527;
					7'd26 : dutyCycle <= 10'd529;
					7'd27 : dutyCycle <= 10'd531;
					7'd28 : dutyCycle <= 10'd532;
					7'd29 : dutyCycle <= 10'd533;
					7'd30 : dutyCycle <= 10'd533;
					7'd31 : dutyCycle <= 10'd533;
					7'd32 : dutyCycle <= 10'd533;
					7'd33 : dutyCycle <= 10'd533;
					7'd34 : dutyCycle <= 10'd532;
					7'd35 : dutyCycle <= 10'd531;
					7'd36 : dutyCycle <= 10'd529;
					7'd37 : dutyCycle <= 10'd527;
					7'd38 : dutyCycle <= 10'd525;
					7'd39 : dutyCycle <= 10'd523;
					7'd40 : dutyCycle <= 10'd520;
					7'd41 : dutyCycle <= 10'd517;
					7'd42 : dutyCycle <= 10'd513;
					7'd43 : dutyCycle <= 10'd509;
					7'd44 : dutyCycle <= 10'd505;
					7'd45 : dutyCycle <= 10'd501;
					7'd46 : dutyCycle <= 10'd497;
					7'd47 : dutyCycle <= 10'd492;
					7'd48 : dutyCycle <= 10'd487;
					7'd49 : dutyCycle <= 10'd482;
					7'd50 : dutyCycle <= 10'd476;
					7'd51 : dutyCycle <= 10'd471;
					7'd52 : dutyCycle <= 10'd465;
					7'd53 : dutyCycle <= 10'd459;
					7'd54 : dutyCycle <= 10'd453;
					7'd55 : dutyCycle <= 10'd446;
					7'd56 : dutyCycle <= 10'd440;
					7'd57 : dutyCycle <= 10'd433;
					7'd58 : dutyCycle <= 10'd427;
					7'd59 : dutyCycle <= 10'd420;
					7'd60 : dutyCycle <= 10'd413;
					7'd61 : dutyCycle <= 10'd407;
					7'd62 : dutyCycle <= 10'd400;
					7'd63 : dutyCycle <= 10'd393;
					7'd64 : dutyCycle <= 10'd387;
					7'd65 : dutyCycle <= 10'd380;
					7'd66 : dutyCycle <= 10'd373;
					7'd67 : dutyCycle <= 10'd367;
					7'd68 : dutyCycle <= 10'd360;
					7'd69 : dutyCycle <= 10'd354;
					7'd70 : dutyCycle <= 10'd347;
					7'd71 : dutyCycle <= 10'd341;
					7'd72 : dutyCycle <= 10'd335;
					7'd73 : dutyCycle <= 10'd329;
					7'd74 : dutyCycle <= 10'd324;
					7'd75 : dutyCycle <= 10'd318;
					7'd76 : dutyCycle <= 10'd313;
					7'd77 : dutyCycle <= 10'd308;
					7'd78 : dutyCycle <= 10'd303;
					7'd79 : dutyCycle <= 10'd299;
					7'd80 : dutyCycle <= 10'd295;
					7'd81 : dutyCycle <= 10'd291;
					7'd82 : dutyCycle <= 10'd287;
					7'd83 : dutyCycle <= 10'd283;
					7'd84 : dutyCycle <= 10'd280;
					7'd85 : dutyCycle <= 10'd277;
					7'd86 : dutyCycle <= 10'd275;
					7'd87 : dutyCycle <= 10'd273;
					7'd88 : dutyCycle <= 10'd271;
					7'd89 : dutyCycle <= 10'd269;
					7'd90 : dutyCycle <= 10'd268;
					7'd91 : dutyCycle <= 10'd267;
					7'd92 : dutyCycle <= 10'd267;
					7'd93 : dutyCycle <= 10'd267;
					7'd94 : dutyCycle <= 10'd267;
					7'd95 : dutyCycle <= 10'd267;
					7'd96 : dutyCycle <= 10'd268;
					7'd97 : dutyCycle <= 10'd269;
					7'd98 : dutyCycle <= 10'd271;
					7'd99 : dutyCycle <= 10'd273;
					7'd100 : dutyCycle <= 10'd275;
					7'd101 : dutyCycle <= 10'd277;
					7'd102 : dutyCycle <= 10'd280;
					7'd103 : dutyCycle <= 10'd283;
					7'd104 : dutyCycle <= 10'd287;
					7'd105 : dutyCycle <= 10'd291;
					7'd106 : dutyCycle <= 10'd295;
					7'd107 : dutyCycle <= 10'd299;
					7'd108 : dutyCycle <= 10'd303;
					7'd109 : dutyCycle <= 10'd308;
					7'd110 : dutyCycle <= 10'd313;
					7'd111 : dutyCycle <= 10'd318;
					7'd112 : dutyCycle <= 10'd324;
					7'd113 : dutyCycle <= 10'd329;
					7'd114 : dutyCycle <= 10'd335;
					7'd115 : dutyCycle <= 10'd341;
					7'd116 : dutyCycle <= 10'd347;
					7'd117 : dutyCycle <= 10'd354;
					7'd118 : dutyCycle <= 10'd360;
					7'd119 : dutyCycle <= 10'd367;
					7'd120 : dutyCycle <= 10'd373;
					7'd121 : dutyCycle <= 10'd380;
					7'd122 : dutyCycle <= 10'd387;
					7'd123 : dutyCycle <= 10'd393;
					7'd124 : dutyCycle <= 10'd400;
					default : dutyCycle <= 10'd400;
				endcase
			end //of if == 0
			else if ( amplitude_select == 2'd1 ) begin
				//max duty: 667
				case(sample_select) //125 need 125 cases
					7'd0 : dutyCycle <= 10'd400;
					7'd1 : dutyCycle <= 10'd414;
					7'd2 : dutyCycle <= 10'd427;
					7'd3 : dutyCycle <= 10'd440;
					7'd4 : dutyCycle <= 10'd454;
					7'd5 : dutyCycle <= 10'd467;
					7'd6 : dutyCycle <= 10'd480;
					7'd7 : dutyCycle <= 10'd493;
					7'd8 : dutyCycle <= 10'd505;
					7'd9 : dutyCycle <= 10'd517;
					7'd10 : dutyCycle <= 10'd529;
					7'd11 : dutyCycle <= 10'd541;
					7'd12 : dutyCycle <= 10'd552;
					7'd13 : dutyCycle <= 10'd563;
					7'd14 : dutyCycle <= 10'd574;
					7'd15 : dutyCycle <= 10'd584;
					7'd16 : dutyCycle <= 10'd593;
					7'd17 : dutyCycle <= 10'd602;
					7'd18 : dutyCycle <= 10'd611;
					7'd19 : dutyCycle <= 10'd619;
					7'd20 : dutyCycle <= 10'd626;
					7'd21 : dutyCycle <= 10'd633;
					7'd22 : dutyCycle <= 10'd639;
					7'd23 : dutyCycle <= 10'd645;
					7'd24 : dutyCycle <= 10'd650;
					7'd25 : dutyCycle <= 10'd654;
					7'd26 : dutyCycle <= 10'd658;
					7'd27 : dutyCycle <= 10'd661;
					7'd28 : dutyCycle <= 10'd664;
					7'd29 : dutyCycle <= 10'd665;
					7'd30 : dutyCycle <= 10'd666;
					7'd31 : dutyCycle <= 10'd667;
					7'd32 : dutyCycle <= 10'd666;
					7'd33 : dutyCycle <= 10'd665;
					7'd34 : dutyCycle <= 10'd664;
					7'd35 : dutyCycle <= 10'd661;
					7'd36 : dutyCycle <= 10'd658;
					7'd37 : dutyCycle <= 10'd654;
					7'd38 : dutyCycle <= 10'd650;
					7'd39 : dutyCycle <= 10'd645;
					7'd40 : dutyCycle <= 10'd639;
					7'd41 : dutyCycle <= 10'd633;
					7'd42 : dutyCycle <= 10'd626;
					7'd43 : dutyCycle <= 10'd619;
					7'd44 : dutyCycle <= 10'd611;
					7'd45 : dutyCycle <= 10'd602;
					7'd46 : dutyCycle <= 10'd593;
					7'd47 : dutyCycle <= 10'd584;
					7'd48 : dutyCycle <= 10'd574;
					7'd49 : dutyCycle <= 10'd563;
					7'd50 : dutyCycle <= 10'd552;
					7'd51 : dutyCycle <= 10'd541;
					7'd52 : dutyCycle <= 10'd529;
					7'd53 : dutyCycle <= 10'd517;
					7'd54 : dutyCycle <= 10'd505;
					7'd55 : dutyCycle <= 10'd493;
					7'd56 : dutyCycle <= 10'd480;
					7'd57 : dutyCycle <= 10'd467;
					7'd58 : dutyCycle <= 10'd454;
					7'd59 : dutyCycle <= 10'd440;
					7'd60 : dutyCycle <= 10'd427;
					7'd61 : dutyCycle <= 10'd414;
					7'd62 : dutyCycle <= 10'd400;
					7'd63 : dutyCycle <= 10'd386;
					7'd64 : dutyCycle <= 10'd373;
					7'd65 : dutyCycle <= 10'd360;
					7'd66 : dutyCycle <= 10'd346;
					7'd67 : dutyCycle <= 10'd333;
					7'd68 : dutyCycle <= 10'd320;
					7'd69 : dutyCycle <= 10'd307;
					7'd70 : dutyCycle <= 10'd295;
					7'd71 : dutyCycle <= 10'd283;
					7'd72 : dutyCycle <= 10'd271;
					7'd73 : dutyCycle <= 10'd259;
					7'd74 : dutyCycle <= 10'd248;
					7'd75 : dutyCycle <= 10'd237;
					7'd76 : dutyCycle <= 10'd226;
					7'd77 : dutyCycle <= 10'd216;
					7'd78 : dutyCycle <= 10'd207;
					7'd79 : dutyCycle <= 10'd198;
					7'd80 : dutyCycle <= 10'd189;
					7'd81 : dutyCycle <= 10'd181;
					7'd82 : dutyCycle <= 10'd174;
					7'd83 : dutyCycle <= 10'd167;
					7'd84 : dutyCycle <= 10'd161;
					7'd85 : dutyCycle <= 10'd155;
					7'd86 : dutyCycle <= 10'd150;
					7'd87 : dutyCycle <= 10'd146;
					7'd88 : dutyCycle <= 10'd142;
					7'd89 : dutyCycle <= 10'd139;
					7'd90 : dutyCycle <= 10'd136;
					7'd91 : dutyCycle <= 10'd135;
					7'd92 : dutyCycle <= 10'd134;
					7'd93 : dutyCycle <= 10'd133;
					7'd94 : dutyCycle <= 10'd134;
					7'd95 : dutyCycle <= 10'd135;
					7'd96 : dutyCycle <= 10'd136;
					7'd97 : dutyCycle <= 10'd139;
					7'd98 : dutyCycle <= 10'd142;
					7'd99 : dutyCycle <= 10'd146;
					7'd100 : dutyCycle <= 10'd150;
					7'd101 : dutyCycle <= 10'd155;
					7'd102 : dutyCycle <= 10'd161;
					7'd103 : dutyCycle <= 10'd167;
					7'd104 : dutyCycle <= 10'd174;
					7'd105 : dutyCycle <= 10'd181;
					7'd106 : dutyCycle <= 10'd189;
					7'd107 : dutyCycle <= 10'd198;
					7'd108 : dutyCycle <= 10'd207;
					7'd109 : dutyCycle <= 10'd216;
					7'd110 : dutyCycle <= 10'd226;
					7'd111 : dutyCycle <= 10'd237;
					7'd112 : dutyCycle <= 10'd248;
					7'd113 : dutyCycle <= 10'd259;
					7'd114 : dutyCycle <= 10'd271;
					7'd115 : dutyCycle <= 10'd283;
					7'd116 : dutyCycle <= 10'd295;
					7'd117 : dutyCycle <= 10'd307;
					7'd118 : dutyCycle <= 10'd320;
					7'd119 : dutyCycle <= 10'd333;
					7'd120 : dutyCycle <= 10'd346;
					7'd121 : dutyCycle <= 10'd360;
					7'd122 : dutyCycle <= 10'd373;
					7'd123 : dutyCycle <= 10'd386;
					7'd124 : dutyCycle <= 10'd400;
					default : dutyCycle <= 10'd400;
				endcase
			end
			else if ( amplitude_select == 2'd2 ) begin
				//max duty: 800
				case(sample_select) //125 need 125 cases
					7'd0 : dutyCycle <= 10'd400;
					7'd1 : dutyCycle <= 10'd420;
					7'd2 : dutyCycle <= 10'd440;
					7'd3 : dutyCycle <= 10'd461;
					7'd4 : dutyCycle <= 10'd481;
					7'd5 : dutyCycle <= 10'd500;
					7'd6 : dutyCycle <= 10'd520;
					7'd7 : dutyCycle <= 10'd539;
					7'd8 : dutyCycle <= 10'd558;
					7'd9 : dutyCycle <= 10'd576;
					7'd10 : dutyCycle <= 10'd594;
					7'd11 : dutyCycle <= 10'd612;
					7'd12 : dutyCycle <= 10'd629;
					7'd13 : dutyCycle <= 10'd645;
					7'd14 : dutyCycle <= 10'd661;
					7'd15 : dutyCycle <= 10'd676;
					7'd16 : dutyCycle <= 10'd690;
					7'd17 : dutyCycle <= 10'd704;
					7'd18 : dutyCycle <= 10'd716;
					7'd19 : dutyCycle <= 10'd728;
					7'd20 : dutyCycle <= 10'd739;
					7'd21 : dutyCycle <= 10'd750;
					7'd22 : dutyCycle <= 10'd759;
					7'd23 : dutyCycle <= 10'd768;
					7'd24 : dutyCycle <= 10'd775;
					7'd25 : dutyCycle <= 10'd782;
					7'd26 : dutyCycle <= 10'd787;
					7'd27 : dutyCycle <= 10'd792;
					7'd28 : dutyCycle <= 10'd795;
					7'd29 : dutyCycle <= 10'd798;
					7'd30 : dutyCycle <= 10'd799;
					7'd31 : dutyCycle <= 10'd800;
					7'd32 : dutyCycle <= 10'd799;
					7'd33 : dutyCycle <= 10'd798;
					7'd34 : dutyCycle <= 10'd795;
					7'd35 : dutyCycle <= 10'd792;
					7'd36 : dutyCycle <= 10'd787;
					7'd37 : dutyCycle <= 10'd782;
					7'd38 : dutyCycle <= 10'd775;
					7'd39 : dutyCycle <= 10'd768;
					7'd40 : dutyCycle <= 10'd759;
					7'd41 : dutyCycle <= 10'd750;
					7'd42 : dutyCycle <= 10'd739;
					7'd43 : dutyCycle <= 10'd728;
					7'd44 : dutyCycle <= 10'd716;
					7'd45 : dutyCycle <= 10'd704;
					7'd46 : dutyCycle <= 10'd690;
					7'd47 : dutyCycle <= 10'd676;
					7'd48 : dutyCycle <= 10'd661;
					7'd49 : dutyCycle <= 10'd645;
					7'd50 : dutyCycle <= 10'd629;
					7'd51 : dutyCycle <= 10'd612;
					7'd52 : dutyCycle <= 10'd594;
					7'd53 : dutyCycle <= 10'd576;
					7'd54 : dutyCycle <= 10'd558;
					7'd55 : dutyCycle <= 10'd539;
					7'd56 : dutyCycle <= 10'd520;
					7'd57 : dutyCycle <= 10'd500;
					7'd58 : dutyCycle <= 10'd481;
					7'd59 : dutyCycle <= 10'd461;
					7'd60 : dutyCycle <= 10'd440;
					7'd61 : dutyCycle <= 10'd420;
					7'd62 : dutyCycle <= 10'd400;
					7'd63 : dutyCycle <= 10'd380;
					7'd64 : dutyCycle <= 10'd360;
					7'd65 : dutyCycle <= 10'd339;
					7'd66 : dutyCycle <= 10'd319;
					7'd67 : dutyCycle <= 10'd300;
					7'd68 : dutyCycle <= 10'd280;
					7'd69 : dutyCycle <= 10'd261;
					7'd70 : dutyCycle <= 10'd242;
					7'd71 : dutyCycle <= 10'd224;
					7'd72 : dutyCycle <= 10'd206;
					7'd73 : dutyCycle <= 10'd188;
					7'd74 : dutyCycle <= 10'd171;
					7'd75 : dutyCycle <= 10'd155;
					7'd76 : dutyCycle <= 10'd139;
					7'd77 : dutyCycle <= 10'd124;
					7'd78 : dutyCycle <= 10'd110;
					7'd79 : dutyCycle <= 10'd96;
					7'd80 : dutyCycle <= 10'd84;
					7'd81 : dutyCycle <= 10'd72;
					7'd82 : dutyCycle <= 10'd61;
					7'd83 : dutyCycle <= 10'd50;
					7'd84 : dutyCycle <= 10'd41;
					7'd85 : dutyCycle <= 10'd32;
					7'd86 : dutyCycle <= 10'd25;
					7'd87 : dutyCycle <= 10'd18;
					7'd88 : dutyCycle <= 10'd13;
					7'd89 : dutyCycle <= 10'd8;
					7'd90 : dutyCycle <= 10'd5;
					7'd91 : dutyCycle <= 10'd2;
					7'd92 : dutyCycle <= 10'd1;
					7'd93 : dutyCycle <= 10'd0;
					7'd94 : dutyCycle <= 10'd1;
					7'd95 : dutyCycle <= 10'd2;
					7'd96 : dutyCycle <= 10'd5;
					7'd97 : dutyCycle <= 10'd8;
					7'd98 : dutyCycle <= 10'd13;
					7'd99 : dutyCycle <= 10'd18;
					7'd100 : dutyCycle <= 10'd25;
					7'd101 : dutyCycle <= 10'd32;
					7'd102 : dutyCycle <= 10'd41;
					7'd103 : dutyCycle <= 10'd50;
					7'd104 : dutyCycle <= 10'd61;
					7'd105 : dutyCycle <= 10'd72;
					7'd106 : dutyCycle <= 10'd84;
					7'd107 : dutyCycle <= 10'd96;
					7'd108 : dutyCycle <= 10'd110;
					7'd109 : dutyCycle <= 10'd124;
					7'd110 : dutyCycle <= 10'd139;
					7'd111 : dutyCycle <= 10'd155;
					7'd112 : dutyCycle <= 10'd171;
					7'd113 : dutyCycle <= 10'd188;
					7'd114 : dutyCycle <= 10'd206;
					7'd115 : dutyCycle <= 10'd224;
					7'd116 : dutyCycle <= 10'd242;
					7'd117 : dutyCycle <= 10'd261;
					7'd118 : dutyCycle <= 10'd280;
					7'd119 : dutyCycle <= 10'd300;
					7'd120 : dutyCycle <= 10'd319;
					7'd121 : dutyCycle <= 10'd339;
					7'd122 : dutyCycle <= 10'd360;
					7'd123 : dutyCycle <= 10'd380;
					7'd124 : dutyCycle <= 10'd400;
					default : dutyCycle <= 10'd400;
				endcase
            end
            else
            	dutyCycle <= 10'd400;
            //going to the next sample; rising edge of newClock
        end //NOT reset
        
        if (newClock && !(previousClk && newClock)) begin			
            if (offset_sampleSelect != previous_offset )
                sample_select <= offset_sampleSelect;
            else begin
                if (sample_select < SAMPLES_MAX)
                    sample_select <= sample_select + 1;
                else
                    sample_select <= 0;
            end
            previous_offset <= offset_sampleSelect;
        end
        previousClk <= newClock;
        
    end //of always
	
	assign sample_select_out = sample_select;
    assign dutyCycle_out = (dutyCycle === 10'dX || dutyCycle === 10'dZ )?  10'd400 : dutyCycle; 
endmodule