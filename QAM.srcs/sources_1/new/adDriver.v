`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2018 04:08:19 PM
// Design Name: 
// Module Name: ad9850_driver
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
module aDriver(
    input reset, clock, [2:0] freq_phase_select,
    output [7:0] DATA, 
    output W_CLK, FQ_UD
    );
    
    reg [31:0] newFreq_reg;
    reg [4:0] phase_reg; 
    reg freq_update_reg;
    reg [2:0] previous_freq_phase_select;
    //wire [7:0] DATA_wire, wire W_CLK, wire FQ_UD;
    reg do_it;
    wire [28:0] countedUpTo_wire;
//    input reset, clock, [31:0] newFreq, [4:0] phase, 
//    input freq_update,
//    output reg [7:0] DATA, reg W_CLK, reg FQ_UD
        wire newClock; 
        reg previous_clock;
        
AD_9850_program DDS_driver(
        .reset(reset), 
        .clock(clock), 
        .newFreq(newFreq_reg),
        .phase(phase_reg), 
        .freq_update(freq_update_reg),
        .DATA(DATA),
        .W_CLK(W_CLK),
        .FQ_UD(FQ_UD)
        );
    initial {newFreq_reg, phase_reg, freq_update_reg, previous_freq_phase_select, do_it} = 0;
    
    always@(posedge clock) begin
        if (reset) 
            {newFreq_reg, phase_reg, freq_update_reg, previous_freq_phase_select} = 0;
        else begin
            if (newClock & !(newClock & previous_clock )) begin//rising edge at 2 MHz. Loads frequency to DDS
                if (do_it) begin
                    case(freq_phase_select)
                        3'd1: begin
                                newFreq_reg <= 32'd989560465;
                                phase_reg <=  5'd8;
                            end
                        3'd2: begin
                                newFreq_reg <= 32'd68719;
                                phase_reg <=  5'd8; 
                            end
                        default: begin
                                newFreq_reg <= 32'd13744;
                                phase_reg <=  5'd8; 
                            end                     
                    endcase
                    freq_update_reg <= 1;
                end //(do_it) begin
                else begin
//                    if (countedUpTo_wire > 7) //little delay
                        freq_update_reg <= 0;
//                    else
//                        freq_update_reg <= freq_update_reg;
                end
                previous_freq_phase_select <= freq_phase_select;
            end
        end
        previous_clock <= newClock; 
    end
    
    always@(posedge clock) begin
        if (reset) 
            do_it <= 0;
        else begin
            if (previous_freq_phase_select === freq_phase_select)
                do_it <= 0;
            else
                do_it <= 1;
        end
    end

    counter PWM_counter( 
        .clock(clock), 
        .reset(freq_update_reg), 
        .up_count(1'b1), 
        .period(29'd8), //400 ns 
        .countedTo(countedUpTo_wire) 
    );
    
    defparam ad9850_PWMclock.PERIOD = 29'd4;
    PWM ad9850_PWMclock(
        .clock(clock),
        .reset(reset),
        .dutyCycle(10'd2),
        .PWM_pulse(newClock)
    );
endmodule