`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2018 10:26:27 AM
// Design Name: 
// Module Name: separateASCII_to_hex
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
module separateASCII_to_hex(
    input clock, reset,
    //output [11:0] sin_waveConst,
    output sin_waveConst, doneConvertingConst, 
    output [9:0] debugDuty, reg [9:0] index, reg [3:0] debugXPeriod
    , output [3:0] debug_HexSending
    );

    parameter [8:0] ASCII_CHARS_NO = 9'd336;
    

    reg reset_reg, previous_clock;
    reg [3:0] hexSending;
    reg [0:ASCII_CHARS_NO*8] constit;
    parameter [3:0] mask = 4'hf;
    reg [3:0] hex_sending;
    reg [7:0] previous_debugDuty;
    wire newClock;
    wire done_sending_hex;
    reg [2:0] previous_debug_periods;
    wire [3:0] debug_periods;
    
    conv_Hex_to_sin_Xperiods hexToSinXp(
        .reset(reset_reg),
        .clock(clock),
        .hexNo(hexSending),
        .sin_wave(sin_waveConst),
        .doneConverting(doneConvertingConst),
        .debugDuty(debugDuty),
        .debug_periods(debug_periods) 
        );
        
//    initial begin
//        constit = {".aciremA fo setatS detinU eht rof noitutitsnoC siht hsilbatse dna niadro od ,ytiretsoP ruo dna ,sevlesruo ot ytrebiL fo sgnisselB eht eruces ,dna ,erafleW lareneg eht etomorp ,ecnefed nommoc eht rof edivorp ,ytiliuqnarT citsemod erusni ,ecitsuJ hsilbats ,noinU tcefrep erom a mrof ot redrO ni ,setatS detinU eht fo elpoeP eht eW",64'h0000_1111_1111_0000};
//        //constit[0:4*8] = {8'h01,8'h01, "We"};
//        {index, hexSending, reset_reg} <= 0;
//    end
    always@(posedge clock) begin
    //always@(*) begin
        if (reset_reg) begin
            // constit = {8'h01, "We the People of the United States, in Order to form a more perfect Union,", 
            // "establish Justice, insure domestic Tranquility, provide for the common defence,", 
            // "promote the general Welfare, and, secure the Blessings of Liberty to ourselves", 
            // "and our Posterity, do ordain and establish this Constitution for the United States of America."};
            constit = {"aciremA fo setatS detinU eht rof noitutitsnoC siht hsilbatse dna niadro od ,ytiretsoP ruo dna ,sevlesruo ot ytrebiL fo sgnisselB eht eruces ,dna ,erafleW lareneg eht etomorp ,ecnefed nommoc eht rof edivorp ,ytiliuqnarT citsemod erusni ,ecitsuJ hsilbats ,noinU tcefrep erom a mrof ot redrO ni ,setatS detinU eht fo elpoeP eht eW",64'h0000_1111_1111_0000};
            {index, hexSending} <= 0;
        end
        else begin
            if ( previous_debug_periods == 3'd3 
                && debug_periods == 3'd0 ) begin//8 ms  have passed, so one more character
                constit = constit >> 4;
                hexSending = mask & constit;
                index = index + 1;
            end
            else 
                index <= index;
 
           previous_debug_periods <= debug_periods; //from0 to 7 (1 ms steps)
        end
    end //opf always
    
    //always@(posedge clock) begin
    always@(posedge clock) begin
        // if (debug_periods == 3'd0 ) begin //decoding is over
        //     //constit = constit >> 4;
        //     //hexSending = mask & constit;
        // end
        
        if(index > ASCII_CHARS_NO*2 )
            reset_reg <= 1'b1;
        else
            reset_reg <= 1'b0 | reset;
        
        debugXPeriod <= debug_periods;
        previous_debugDuty <= debugDuty;
    end
    
    assign debug_HexSending =hexSending;
endmodule