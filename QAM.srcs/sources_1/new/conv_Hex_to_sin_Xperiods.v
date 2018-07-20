`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2018 12:01:23 AM
// Design Name: 
// Module Name: conv_Hex_to_sin_Xperiods
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


module conv_Hex_to_sin_Xperiods(
    input reset, clock,
    input [3:0] hexNo,
    output sin_wave,
    output reg doneConverting,
    output [7:0] debugDuty,
    output [2:0] debug_periods
    );

    reg [1:0] amplitude_select;
    reg [5:0] offset;
    //wire sin_save_8p;
    //reg doneConverting;
//    wire [11:0] debugDuty;
//    wire [2:0] debug_periods;
    //defparam sinXp.LEFT_SHIFTS = 3'd3;
    sin_wave_Xperiods sinXp(
        .clock(clock), 
        .reset(reset),
        .amplitude_select(amplitude_select),
        .offset(offset),
        .sin_waves(sin_wave),
        .debugDuty(debugDuty),
        .debug_periods(debug_periods)
        );
    /* 
    64 samples/period: -161.5651 deg == 35  -->  == 44, 80 samples/ms: -157.5 deg == 44, 320 samples/ms: 179
    64 samples/period: -135 deg == 40       -->  == 49, 80 samples/ms: -135 deg   == 49, 320 samples/ms: 199
    64 samples/period: -108.4349 deg == 45  -->  == 54, 80 samples/ms: -112.5 deg == 54, 320 samples/ms: 219
    64 samples/period: -71.5651 deg == 51   -->  == 64, 80 samples/ms: -67.5 deg  == 64, 320 samples/ms: 259
    64 samples/period: -45 deg == 56        -->  == 69, 80 samples/ms: -45 deg    == 69, 320 samples/ms: 279
    64 samples/period: -18.4349 deg == 61   -->  == 74, 80 samples/ms: -22.5 deg  == 74, 320 samples/ms: 299
    64 samples/period: 18.4349 deg == 3     -->  == 4, 80 samples/ms: 22.5 deg   == 4, 320 samples/ms: 19
    64 samples/period: 45 deg == 8          -->  == 9, 80 samples/ms: 45 deg     == 9, 320 samples/ms: 39
    64 samples/period: 71.5651 deg == 13    -->  == 14, 80 samples/ms: 67.5 deg   == 14, 320 samples/ms: 59
    64 samples/period: 108.4349 deg == 19   -->  == 24, 80 samples/ms: 112.5 deg  == 24, 320 samples/ms: 99
    64 samples/period: 135 deg == 24        -->  == 29, 80 samples/ms: 135 deg    == 29, 320 samples/ms: 119
    64 samples/period: 161.5651 deg == 29   -->  == 34, 80 samples/ms: 157.5 deg  == 34, 320 samples/ms: 139 
    */
    always@(*) begin 
        case(hexNo)
            4'h0: {amplitude_select, offset } <= {2'd0, 6'd40};
            4'h1: {amplitude_select, offset } <= {2'd1, 6'd35};
            4'h2: {amplitude_select, offset } <= {2'd0, 6'd56};
            4'h3: {amplitude_select, offset } <= {2'd1, 6'd61};
            4'h4: {amplitude_select, offset } <= {2'd1, 6'd45};
            4'h5: {amplitude_select, offset } <= {2'd2, 6'd40};
            4'h6: {amplitude_select, offset } <= {2'd1, 6'd51};
            4'h7: {amplitude_select, offset } <= {2'd2, 6'd56};
            4'h8: {amplitude_select, offset } <= {2'd0, 6'd24};
            4'h9: {amplitude_select, offset } <= {2'd1, 6'd29};
            4'hA: {amplitude_select, offset } <= {2'd0, 6'd8};
            4'hB: {amplitude_select, offset } <= {2'd1, 6'd3};
            4'hC: {amplitude_select, offset } <= {2'd1, 6'd19};
            4'hD: {amplitude_select, offset } <= {2'd2, 6'd24};
            4'hE: {amplitude_select, offset } <= {2'd1, 6'd13};
            4'hF: {amplitude_select, offset } <= {2'd2, 6'd8};

            default: {amplitude_select, offset } <= {2'd0, 6'd0};
        endcase
        doneConverting  = (debug_periods == 3'd0)? 1'b1 : 1'b0; //  if done, 1
    end
endmodule