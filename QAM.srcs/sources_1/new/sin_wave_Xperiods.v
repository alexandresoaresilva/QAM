
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
//////////////////////////////////////////////////////////////////////////////////

module sin_wave_Xperiods 
    #(  parameter [28:0] PERIOD = 29'd16_000,
        parameter [2:0] LEFT_SHIFTS = 2, // FOR 8 periods, '; fopr 4, 2
        parameter [28:0] HALF_PERIOD =  PERIOD >>1,
        parameter [28:0] PERIOD_X = PERIOD << LEFT_SHIFTS
    ) // for 400 MHz, /40 microsec
    (
    input clock, reset,
	input [1:0] ampli_select,
	input [5:0] offset,
	output sin_waves,
	output [7:0] debugDuty,
	output [2:0] debug_periods
    );

    reg [1:0] amplitude_select_reg;
    wire newClock;
    reg previous_clock;

	reg [2:0] periods;

    wire [8:0] sampleSelec_out;  
	wire [28:0] countedUpTo_wire;
    wire [1:0] amp_select;
    reg [1:0] amp_select_reg;    
    assign amp_select = amplitude_select_reg | ampli_select;
    
    sin_wave sinX(
        .clock(clock),
        .reset(reset),
        .amplitude_select(amp_select),
        .amp_selectFlatVoltage(amplitude_select_reg),
        .offset_sampleSelect(offset),
        .sin_PWM(sin_waves),
        .dutyCycle_out(debugDuty),
		.sample_select_out(sampleSelec_out)
        );
    
    always@(posedge clock) begin
        if (reset)
            {periods, previous_clock} <= 0;
        else begin //previous sample is different from present one
            if ( countedUpTo_wire  >= 0 && countedUpTo_wire < PERIOD) begin
                periods <= 0;
            end
            if (newClock & !(newClock & previous_clock )) begin//rising edge
                if ( countedUpTo_wire  >=  PERIOD && countedUpTo_wire < PERIOD_X)
                    periods <= periods + 1;
                else
                    periods <= periods;
            end
    
            previous_clock <= newClock;
       end
    end

//    //selects basis pwm for transitions between symbols
    always@(posedge clock) begin
        if (reset)
            amplitude_select_reg <= 0;
        else begin
            if ( countedUpTo_wire  >= 0 && countedUpTo_wire < PERIOD)
                amplitude_select_reg <= 2'd3;
            else
                amplitude_select_reg <= 2'd0;
        end
    end     

    defparam clockNew.PERIOD = PERIOD;
    PWM clockNew(
        .clock(clock),
        .reset(reset),
        .dutyCycle( HALF_PERIOD[7:0]),
        .PWM_pulse(newClock)
    );

    counter x_periods( 
      .clock(clock), 
      .reset(reset), 
      .up_count(1'b1), 
      .period(PERIOD_X), 
      .countedTo(countedUpTo_wire) 
      );
      
      
    assign debug_periods = (periods === 3'dX || periods === 3'dz)? 3'd0 : periods ;
endmodule