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
    input amp_selectFlatVoltage,
	input [5:0] offset_sampleSelect,
    output sin_PWM,
    output [7:0] dutyCycle_out,
    output [8:0] sample_select_out
    );
	
	parameter [28:0] PERIOD_PWM = 29'd250;
	parameter [28:0] HALF_PERIOD_PWM = PERIOD_PWM >> 1;
	
    reg previousClk;
    reg [7:0] dutyCycle;
    reg [5:0] sample_select;
    reg [5:0] previous_offset;
    wire PWM_pulse, newClock;
    parameter [6:0] SAMPLES_MAX = 7'd64;
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
        .dutyCycle(HALF_PERIOD_PWM[7:0]),
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
            if (~amp_selectFlatVoltage) begin    
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
                //max duty: 167
                    case(sample_select) //64 need 64 cases
                        6'd0 : dutyCycle <= 8'd125;
                        6'd1 : dutyCycle <= 8'd129;
                        6'd2 : dutyCycle <= 8'd133;
                        6'd3 : dutyCycle <= 8'd137;
                        6'd4 : dutyCycle <= 8'd141;
                        6'd5 : dutyCycle <= 8'd145;
                        6'd6 : dutyCycle <= 8'd148;
                        6'd7 : dutyCycle <= 8'd152;
                        6'd8 : dutyCycle <= 8'd155;
                        6'd9 : dutyCycle <= 8'd158;
                        6'd10 : dutyCycle <= 8'd160;
                        6'd11 : dutyCycle <= 8'd162;
                        6'd12 : dutyCycle <= 8'd164;
                        6'd13 : dutyCycle <= 8'd165;
                        6'd14 : dutyCycle <= 8'd166;
                        6'd15 : dutyCycle <= 8'd167;
                        6'd16 : dutyCycle <= 8'd167;
                        6'd17 : dutyCycle <= 8'd166;
                        6'd18 : dutyCycle <= 8'd166;
                        6'd19 : dutyCycle <= 8'd165;
                        6'd20 : dutyCycle <= 8'd163;
                        6'd21 : dutyCycle <= 8'd161;
                        6'd22 : dutyCycle <= 8'd159;
                        6'd23 : dutyCycle <= 8'd156;
                        6'd24 : dutyCycle <= 8'd153;
                        6'd25 : dutyCycle <= 8'd150;
                        6'd26 : dutyCycle <= 8'd147;
                        6'd27 : dutyCycle <= 8'd143;
                        6'd28 : dutyCycle <= 8'd139;
                        6'd29 : dutyCycle <= 8'd135;
                        6'd30 : dutyCycle <= 8'd131;
                        6'd31 : dutyCycle <= 8'd127;
                        6'd32 : dutyCycle <= 8'd123;
                        6'd33 : dutyCycle <= 8'd119;
                        6'd34 : dutyCycle <= 8'd115;
                        6'd35 : dutyCycle <= 8'd111;
                        6'd36 : dutyCycle <= 8'd107;
                        6'd37 : dutyCycle <= 8'd103;
                        6'd38 : dutyCycle <= 8'd100;
                        6'd39 : dutyCycle <= 8'd97;
                        6'd40 : dutyCycle <= 8'd94;
                        6'd41 : dutyCycle <= 8'd91;
                        6'd42 : dutyCycle <= 8'd89;
                        6'd43 : dutyCycle <= 8'd87;
                        6'd44 : dutyCycle <= 8'd85;
                        6'd45 : dutyCycle <= 8'd84;
                        6'd46 : dutyCycle <= 8'd84;
                        6'd47 : dutyCycle <= 8'd83;
                        6'd48 : dutyCycle <= 8'd83;
                        6'd49 : dutyCycle <= 8'd84;
                        6'd50 : dutyCycle <= 8'd85;
                        6'd51 : dutyCycle <= 8'd86;
                        6'd52 : dutyCycle <= 8'd88;
                        6'd53 : dutyCycle <= 8'd90;
                        6'd54 : dutyCycle <= 8'd92;
                        6'd55 : dutyCycle <= 8'd95;
                        6'd56 : dutyCycle <= 8'd98;
                        6'd57 : dutyCycle <= 8'd102;
                        6'd58 : dutyCycle <= 8'd105;
                        6'd59 : dutyCycle <= 8'd109;
                        6'd60 : dutyCycle <= 8'd113;
                        6'd61 : dutyCycle <= 8'd117;
                        6'd62 : dutyCycle <= 8'd121;
                        6'd63 : dutyCycle <= 8'd125;
                        default : dutyCycle <= 8'd125;
                    endcase
                end //of if == 0
                else if ( amplitude_select == 2'd1 ) begin
                //max duty: 208
                    case(sample_select) //64 need 64 cases
                        6'd0 : dutyCycle <= 8'd125;
                        6'd1 : dutyCycle <= 8'd133;
                        6'd2 : dutyCycle <= 8'd142;
                        6'd3 : dutyCycle <= 8'd150;
                        6'd4 : dutyCycle <= 8'd157;
                        6'd5 : dutyCycle <= 8'd165;
                        6'd6 : dutyCycle <= 8'd172;
                        6'd7 : dutyCycle <= 8'd179;
                        6'd8 : dutyCycle <= 8'd185;
                        6'd9 : dutyCycle <= 8'd190;
                        6'd10 : dutyCycle <= 8'd195;
                        6'd11 : dutyCycle <= 8'd199;
                        6'd12 : dutyCycle <= 8'd203;
                        6'd13 : dutyCycle <= 8'd205;
                        6'd14 : dutyCycle <= 8'd207;
                        6'd15 : dutyCycle <= 8'd208;
                        6'd16 : dutyCycle <= 8'd208;
                        6'd17 : dutyCycle <= 8'd208;
                        6'd18 : dutyCycle <= 8'd206;
                        6'd19 : dutyCycle <= 8'd204;
                        6'd20 : dutyCycle <= 8'd201;
                        6'd21 : dutyCycle <= 8'd197;
                        6'd22 : dutyCycle <= 8'd193;
                        6'd23 : dutyCycle <= 8'd188;
                        6'd24 : dutyCycle <= 8'd182;
                        6'd25 : dutyCycle <= 8'd175;
                        6'd26 : dutyCycle <= 8'd168;
                        6'd27 : dutyCycle <= 8'd161;
                        6'd28 : dutyCycle <= 8'd154;
                        6'd29 : dutyCycle <= 8'd146;
                        6'd30 : dutyCycle <= 8'd137;
                        6'd31 : dutyCycle <= 8'd129;
                        6'd32 : dutyCycle <= 8'd121;
                        6'd33 : dutyCycle <= 8'd113;
                        6'd34 : dutyCycle <= 8'd104;
                        6'd35 : dutyCycle <= 8'd96;
                        6'd36 : dutyCycle <= 8'd89;
                        6'd37 : dutyCycle <= 8'd82;
                        6'd38 : dutyCycle <= 8'd75;
                        6'd39 : dutyCycle <= 8'd68;
                        6'd40 : dutyCycle <= 8'd62;
                        6'd41 : dutyCycle <= 8'd57;
                        6'd42 : dutyCycle <= 8'd53;
                        6'd43 : dutyCycle <= 8'd49;
                        6'd44 : dutyCycle <= 8'd46;
                        6'd45 : dutyCycle <= 8'd44;
                        6'd46 : dutyCycle <= 8'd42;
                        6'd47 : dutyCycle <= 8'd42;
                        6'd48 : dutyCycle <= 8'd42;
                        6'd49 : dutyCycle <= 8'd43;
                        6'd50 : dutyCycle <= 8'd45;
                        6'd51 : dutyCycle <= 8'd47;
                        6'd52 : dutyCycle <= 8'd51;
                        6'd53 : dutyCycle <= 8'd55;
                        6'd54 : dutyCycle <= 8'd60;
                        6'd55 : dutyCycle <= 8'd65;
                        6'd56 : dutyCycle <= 8'd71;
                        6'd57 : dutyCycle <= 8'd78;
                        6'd58 : dutyCycle <= 8'd85;
                        6'd59 : dutyCycle <= 8'd93;
                        6'd60 : dutyCycle <= 8'd100;
                        6'd61 : dutyCycle <= 8'd108;
                        6'd62 : dutyCycle <= 8'd117;
                        6'd63 : dutyCycle <= 8'd125;
                        default : dutyCycle <= 8'd125;
                    endcase
                end
                else if ( amplitude_select == 2'd2 ) begin
                //max duty: 250
                    case(sample_select) //64 need 64 cases
                        6'd0 : dutyCycle <= 8'd125;
                        6'd1 : dutyCycle <= 8'd137;
                        6'd2 : dutyCycle <= 8'd150;
                        6'd3 : dutyCycle <= 8'd162;
                        6'd4 : dutyCycle <= 8'd174;
                        6'd5 : dutyCycle <= 8'd185;
                        6'd6 : dutyCycle <= 8'd195;
                        6'd7 : dutyCycle <= 8'd205;
                        6'd8 : dutyCycle <= 8'd215;
                        6'd9 : dutyCycle <= 8'd223;
                        6'd10 : dutyCycle <= 8'd230;
                        6'd11 : dutyCycle <= 8'd236;
                        6'd12 : dutyCycle <= 8'd241;
                        6'd13 : dutyCycle <= 8'd245;
                        6'd14 : dutyCycle <= 8'd248;
                        6'd15 : dutyCycle <= 8'd250;
                        6'd16 : dutyCycle <= 8'd250;
                        6'd17 : dutyCycle <= 8'd249;
                        6'd18 : dutyCycle <= 8'd247;
                        6'd19 : dutyCycle <= 8'd244;
                        6'd20 : dutyCycle <= 8'd239;
                        6'd21 : dutyCycle <= 8'd233;
                        6'd22 : dutyCycle <= 8'd227;
                        6'd23 : dutyCycle <= 8'd219;
                        6'd24 : dutyCycle <= 8'd210;
                        6'd25 : dutyCycle <= 8'd200;
                        6'd26 : dutyCycle <= 8'd190;
                        6'd27 : dutyCycle <= 8'd179;
                        6'd28 : dutyCycle <= 8'd168;
                        6'd29 : dutyCycle <= 8'd156;
                        6'd30 : dutyCycle <= 8'd144;
                        6'd31 : dutyCycle <= 8'd131;
                        6'd32 : dutyCycle <= 8'd119;
                        6'd33 : dutyCycle <= 8'd106;
                        6'd34 : dutyCycle <= 8'd94;
                        6'd35 : dutyCycle <= 8'd82;
                        6'd36 : dutyCycle <= 8'd71;
                        6'd37 : dutyCycle <= 8'd60;
                        6'd38 : dutyCycle <= 8'd50;
                        6'd39 : dutyCycle <= 8'd40;
                        6'd40 : dutyCycle <= 8'd31;
                        6'd41 : dutyCycle <= 8'd23;
                        6'd42 : dutyCycle <= 8'd17;
                        6'd43 : dutyCycle <= 8'd11;
                        6'd44 : dutyCycle <= 8'd6;
                        6'd45 : dutyCycle <= 8'd3;
                        6'd46 : dutyCycle <= 8'd1;
                        6'd47 : dutyCycle <= 8'd0;
                        6'd48 : dutyCycle <= 8'd0;
                        6'd49 : dutyCycle <= 8'd2;
                        6'd50 : dutyCycle <= 8'd5;
                        6'd51 : dutyCycle <= 8'd9;
                        6'd52 : dutyCycle <= 8'd14;
                        6'd53 : dutyCycle <= 8'd20;
                        6'd54 : dutyCycle <= 8'd27;
                        6'd55 : dutyCycle <= 8'd35;
                        6'd56 : dutyCycle <= 8'd45;
                        6'd57 : dutyCycle <= 8'd55;
                        6'd58 : dutyCycle <= 8'd65;
                        6'd59 : dutyCycle <= 8'd76;
                        6'd60 : dutyCycle <= 8'd88;
                        6'd61 : dutyCycle <= 8'd100;
                        6'd62 : dutyCycle <= 8'd113;
                        6'd63 : dutyCycle <= 8'd125;
                        default : dutyCycle <= 8'd125;
                    endcase
                end
            end
            else
            	dutyCycle <= 8'd125;
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
    assign dutyCycle_out = (dutyCycle === 8'dX || dutyCycle === 8'dZ )?  8'd125 : dutyCycle; 
endmodule