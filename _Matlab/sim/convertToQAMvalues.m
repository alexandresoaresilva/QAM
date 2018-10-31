%values need to be separated b
function [QAM_sinwav, t] =...
    convertToQAMvalues(half_ascii_4bits, samples_milissecond)
    %[QAM_sinwav, t] = convertToQAMvalues(T_brokedown(1,1))

    
    %% carrier waveform function handle for f_c = 1000 Hz
    carrier_signal=@(A, t, phase)A.*sin(2000*pi*t + phase);

    A = [0.6213,...
         1.1481,...
         1.5]; %possible amplitudes
    %T_brokedown
    %% phases 
phases=[ -157.5,... %0
         -135.0,... %1
         -112.5,... %2
          -67.5,... %3
          -45.0,... %4
          -22.5,... %5
           22.5,... %6
           45.0,... %7
           67.5,... %8
          112.5,... %9
          135.0,... %10
          157.5]; %11
%     phases=[ -157.5 == 7'd43 == -2.75  // 1, 
%              -135.0 == 7'd48 ==  -2.36 // 0, 5
%              -112.5 == 7'd53 == -1.96  // 4
%               -67.5 == 7'd63 == -1.18  // 6
%               -45.0 == 7'd68 == -0.79  // 2, 7
%               -22.5 == 7'd73 == -0.39 %// 3
%                22.5 == 7'd4 == 0.39    // B
%                45.0 == 7'd9 == 0.79   // A, F
%                67.5 == 7'd14 == 1.18 % // E
%               112.5 == 7'd24 == 1.96   // C
%               135.0 == 7'd29 == 2.36   // 8, D
%               157.5 == 7'd34 == 2.75 % // 9
    %t == time in seconds (1000 samples / ms, or 1 sample/each us
    %t = linspace(0,.008,8000);
    t = linspace(0,.008,samples_milissecond);
   % t(1:999) = 0;%zeroes the first 1ms
    
    switch(half_ascii_4bits)
        case hex2dec('0') % 0000 binary
            QAM_sinwav = carrier_signal(A(1), t, deg2rad(-135));
        case hex2dec('1') % 0001 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(-157.5));
        case hex2dec('2') % 0010 binary
            QAM_sinwav = carrier_signal(A(1), t, deg2rad(-45));
        case hex2dec('3') % 0011 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(-22.5));
        case hex2dec('4') % 0100 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(-112.5));
        case hex2dec('5') % 0101 binary
            QAM_sinwav = carrier_signal(A(3), t, deg2rad(-135));
        case hex2dec('6') % 0110 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(-67.5));
        case hex2dec('7') % 0111 binary
            QAM_sinwav = carrier_signal(A(3), t, deg2rad(-45));
        case hex2dec('8') % 1000 binary
            QAM_sinwav = carrier_signal(A(1), t, deg2rad(135));
        case hex2dec('9') % 1001 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(157.5));
        case hex2dec('A') % 1010 binary
            QAM_sinwav = carrier_signal(A(1), t, deg2rad(45));
        case hex2dec('B') % 1011 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(22.5));
        case hex2dec('C') % 1100 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(112.5));
        case hex2dec('D') % 1101 binary
            QAM_sinwav = carrier_signal(A(3), t, deg2rad(135));
        case hex2dec('E') % 1110 binary
            QAM_sinwav = carrier_signal(A(2), t, deg2rad(67.5));
        case hex2dec('F') % 1111 binary
            QAM_sinwav = carrier_signal(A(3), t, deg2rad(45));
        otherwise
            QAM_sinwav = 0;
    end
    if ~QAM_sinwav
        disp('no valid 4 bit piece or hexadecimal number')
    end
    zero_begining = round(samples_milissecond/8);
    QAM_sinwav(1:zero_begining) = 0;
end