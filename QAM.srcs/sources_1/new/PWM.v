module PWM #( parameter [28:0] PERIOD = 29'd250 ) // based on the Basys3's derived clock (400 MHz)

    //counterPeriods:
    // based on the Basys3's derived clock (400 MHz)
    //32 KHz 
    ( 
        input clock, reset,
        input [7:0] dutyCycle,//for diving main 100 MHz frequency
        output reg PWM_pulse//,   output reg [26:0] debug_counter
    );

    wire [28:0] PWM_duty_wire;
    //reg [28:0] previous_DutyCycle;
    wire [28:0]  countedUpTo_wire; 
    
//     initial
//     begin
//        PWM_pulse = 0;
//      end
    
    always@(posedge clock) begin
        if (reset)
            PWM_pulse <= 0;
        else begin
            if ( countedUpTo_wire >= 0 && countedUpTo_wire < PWM_duty_wire ) begin
                PWM_pulse <= 1;
            end
            else if (  countedUpTo_wire >= PWM_duty_wire && countedUpTo_wire < PERIOD ) begin
                PWM_pulse <= 0;
            end
        end 
    end

    assign PWM_duty_wire = {21'd0, dutyCycle};
      
    // always@(negedge clock) begin
    //   PWM_duty_wire <= {21'd0, dutyCycle};
    // end
      counter PWM_counter( 
          .clock(clock), 
          .reset(reset), 
          .up_count(1'b1), 
          .period(PERIOD), 
          .countedTo(countedUpTo_wire) 
          );
endmodule