`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2018 05:35:05 PM
// Design Name: 
// Module Name: AD_9850
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


module AD_9850_program(
    input reset, clock, [31:0] newFreq, [4:0] phase, 
    input freq_update,
    output reg [7:0] DATA, reg W_CLK, reg FQ_UD
    );
    
    
    
    reg [2:0] counter; //just count to 5, so we get to load the desired frequency to the device 
    reg [2:0] previousCounter; //just count to 5, so we get to load the desired frequency to the device
    wire newClock;
    wire [28:0] countedUpTo_wire;
    reg previous_clock;
    reg previous_W_CLK;
    reg done;
    reg do_it;
    reg previous_freq_update_reg;
    reg [31:0] previous_freq;
    reg [31:0] freq_to_be_updated;
    
    initial {counter, DATA, W_CLK, FQ_UD, W_CLK} <= 0;
    always@(posedge clock) begin
        if (reset) 
            {FQ_UD, counter} <= 0;
        else begin
            if (newClock & !(newClock & previous_clock )) begin//rising edge at 2 MHz. Loads frequency to DDS 
                FQ_UD <= freq_update;                
        
                if (FQ_UD) begin
                    counter <= 0;
                    done <= 0;
                    do_it <= 1;
                end
                else begin
                    if (done) begin
                        counter <= 0;
                        //DATA <= 0;
                    end
                    else begin
                        counter <= counter + 1;
                    end
                end
                if(do_it)  begin     
                    case(counter)
                        3'd1: begin
                            DATA <= {phase,3'b100};
                            //W_CLK <= 0;
                            done <= 0;
                        end
                        3'd2: begin
                            DATA <= newFreq[31:24];
                            W_CLK <= 0;
                            done <= 0;
                        end
                        3'd3: begin
                            DATA <= newFreq[23:16];
                            //W_CLK <= 0;
                            done <= 0;
                        end                    
                        3'd4: begin
                            DATA <= newFreq[15:8];
                            //W_CLK <= 0;
                            done <= 0;
                        end
                        3'd5: begin
                            DATA <= newFreq[7:0];
                            //W_CLK <= 0;
                        end
                        default begin
                            DATA <= 0;
                            done <= 1;
                            do_it <= 0;
                        end
                    endcase
                end // of do it                           
            end
        end
    end
    
    always@(posedge clock) begin
        if (reset)
            {previous_clock, previous_freq_update_reg} = 0;
        else begin            
            
            previousCounter <= counter ;                            
            previous_clock <= newClock;
            previous_freq_update_reg <=  freq_update;
            previous_freq <= newFreq;
            previous_W_CLK <= W_CLK;
            
            if (countedUpTo_wire > 0 && countedUpTo_wire < 3 )
                W_CLK <= 0;
            else
                W_CLK <= 1;            
        end             
    end
    
    counter PWM_counter( 
        .clock(clock), 
        .reset(reset), 
        .up_count(1'b1), 
        .period(29'd4), //400 ns 
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