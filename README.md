# QAM
16 Quadrature Amplitude Modulation, implemented with a 1 KHz PWM signal using the Digilent Basys3's 100 MHz main clock. Four sine wave periods make up a 16-QAM symbol; the first period is always a sine wave zero (base voltage), followed by 3 periods of the amplitude modulated and phase shifted sine wave.

Low pass filter is needed to recover the 1 kHz sine wave from the board's output.

For images of the Verilog test benches and of the oscilloscope readings from the FPGA - which show the 16-QAM signal - please read Alex final report.pdf in this project's root folder. 
