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
    output [9:0] debugDuty,
    output [3:0] debug_periods
    );

    reg [1:0] amplitude_select;
    reg [6:0] offset;
    //wire sin_save_8p;
    //reg doneConverting;
//    wire [11:0] debugDuty;
//    wire [2:0] debug_periods;
    //defparam sinXp.LEFT_SHIFTS = 3'd3;
    sin_wave_Xperiods sinXp(
        .clock(clock), 
        .reset(reset),
        .ampli_select(amplitude_select),
        .offset(offset),
        .sin_waves(sin_wave),
        .debugDuty(debugDuty),
        .debug_periods(debug_periods)
        );
    /* 
    64 samples/period: -161.5651 deg == 35  -->  == 44, 80 samples/ms: -157.5 deg == 44, 125 samples/ms: 69
    64 samples/period: -135 deg == 40       -->  == 49, 80 samples/ms: -135 deg   == 49, 125 samples/ms: 78
    64 samples/period: -108.4349 deg == 45  -->  == 54, 80 samples/ms: -112.5 deg == 54, 125 samples/ms: 87
    64 samples/period: -71.5651 deg == 51   -->  == 64, 80 samples/ms: -67.5 deg  == 64, 125 samples/ms: 100
    64 samples/period: -45 deg == 56        -->  == 69, 80 samples/ms: -45 deg    == 69, 125 samples/ms: 109
    64 samples/period: -18.4349 deg == 61   -->  == 74, 80 samples/ms: -22.5 deg  == 74, 125 samples/ms: 119
    64 samples/period: 18.4349 deg == 3     -->  == 4, 80 samples/ms: 22.5 deg   == 4, 125 samples/ms: 6
    64 samples/period: 45 deg == 8          -->  == 9, 80 samples/ms: 45 deg     == 9, 125 samples/ms: 16
    64 samples/period: 71.5651 deg == 13    -->  == 14, 80 samples/ms: 67.5 deg   == 14, 125 samples/ms: 25
    64 samples/period: 108.4349 deg == 19   -->  == 24, 80 samples/ms: 112.5 deg  == 24, 125 samples/ms: 38
    64 samples/period: 135 deg == 24        -->  == 29, 80 samples/ms: 135 deg    == 29, 125 samples/ms: 47
    64 samples/period: 161.5651 deg == 29   -->  == 34, 80 samples/ms: 157.5 deg  == 34, 125 samples/ms: 56 
    */
    always@(*) begin 
        case(hexNo)
            4'h0: {amplitude_select, offset } <= {2'd0, 7'd78};
            4'h1: {amplitude_select, offset } <= {2'd1, 7'd69};
            4'h2: {amplitude_select, offset } <= {2'd0, 7'd109};
            4'h3: {amplitude_select, offset } <= {2'd1, 7'd119};
            4'h4: {amplitude_select, offset } <= {2'd1, 7'd87};
            4'h5: {amplitude_select, offset } <= {2'd2, 7'd78};
            4'h6: {amplitude_select, offset } <= {2'd1, 7'd100};
            4'h7: {amplitude_select, offset } <= {2'd2, 7'd109};
            4'h8: {amplitude_select, offset } <= {2'd0, 7'd47};
            4'h9: {amplitude_select, offset } <= {2'd1, 7'd56};
            4'hA: {amplitude_select, offset } <= {2'd0, 7'd16};
            4'hB: {amplitude_select, offset } <= {2'd1, 7'd6};
            4'hC: {amplitude_select, offset } <= {2'd1, 7'd38};
            4'hD: {amplitude_select, offset } <= {2'd2, 7'd47};
            4'hE: {amplitude_select, offset } <= {2'd1, 7'd25};
            4'hF: {amplitude_select, offset } <= {2'd2, 7'd16};

            default: {amplitude_select, offset } <= {2'd0, 7'd0};
        endcase
        doneConverting  = (debug_periods == 4'd0)? 1'b1 : 1'b0; //  if done, 1
    end
endmodule