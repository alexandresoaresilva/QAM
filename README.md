# QAM
16 Quadrature Amplitude Modulation, implemented in Verilog with a 1 KHz PWM signal using the Digilent Basys3's 100 MHz main clock. Four sine wave periods make up a 16-QAM symbol; the first period is always a sine wave zero (base voltage), followed by 3 periods of the amplitude modulated and phase shifted sine wave.

Low pass filter is needed to recover the 1 kHz sine wave from the board's output.

For more details about the implementation, along with images of the Verilog test benches and of the oscilloscope readings from the FPGA - which show the 16-QAM signal - please read Alex final report.pdf in this project's root folder. 

There are two Matlab scripts of interest in https://github.com/alexandresoaresilva/QAM/tree/master/_Matlab :


- [sin_wave_v2.m](https://github.com/alexandresoaresilva/QAM/tree/master/_Matlab/script_writes_Verilog_sin_code/sin_wave_v2.m): writes the Verilog code of the PWM signal that builds the sine wave. Its output is the file **PWM_transmission.txt**.

- [sim_qam.m](https://github.com/alexandresoaresilva/QAM/blob/master/_Matlab/sim/sim_qam.m): simulates the FPGA implementation of the preamble to the U.S. Constitution being transmitted in 16-QAM.
