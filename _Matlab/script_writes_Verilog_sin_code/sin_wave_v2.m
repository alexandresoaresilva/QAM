clear, clc, close all
% equations
carrier_signal = @(A, f, t, phase)A.*2/sqrt(2).*sin(2*f*pi*t + phase);
sin_car = @(A, f, t, phase)-A.*2/sqrt(2).*sin(2*f*pi*t + phase);
cos_car = @(A, f, t, phase)A.*2/sqrt(2).*cos(2*f*pi*t + phase);

fileID = fopen('PWM_transmission.txt','w');
%%
%samples will be created for this qam
qam_select = [4, 16, 64, 256];
% for qam_i=1:length(qam_select)
   %QAM_CHOSEN = qam_select(qam_i);
   QAM_CHOSEN = 16;
    qam = [2, 4, 8, 16, 32, 64, 128, 256];
    FREQ_SIG_kHz = 1;
    CLOCK_MHz = 100;
    
    FREQ_SIG = FREQ_SIG_kHz*10^3
    % at 10 Khz
    % 80 for 256 or 64 qam
    % 100 for 16 qam 
    % at 1 Khz: 250 for 16 qam
    SAMPLES_perPeriod = 125; %steps of 4.5 degrees
    %OR
    PWM_ticks_for_oneSample = 0;

    symbol_rate = FREQ_SIG/4;

    MAX_VOLTAGE = 3;
    PREVIOUS_SAMPLES_1ms = 320;
    clock_Hz = CLOCK_MHz*10^6;

    if ~PWM_ticks_for_oneSample
        %pwm FREQUENCY
        samples_1s =  SAMPLES_perPeriod*FREQ_SIG %no. of samples in ONE perid x frequency (no. of periods in one second)
        PWM_ticks_for_oneSample = clock_Hz/samples_1s;
    else
        samples_1s = clock_Hz/PWM_ticks_for_oneSample
        SAMPLES_perPeriod = samples_1s/FREQ_SIG %no. of samples in ONE perid x frequency (no. of periods in one second)
    end
    PWM_ticks_for_oneSample 
    PWM_freq = samples_1s %total of rising edges of the PWM signal in 1 second e(1 sample == 1 rising edge)
        
    CLK_ticks_ONE_sinWave_period = PWM_ticks_for_oneSample * SAMPLES_perPeriod
    
    bitsPerSymbo = log2(qam);
    hold on
    noOfAmplitudes = zeros(length(bitsPerSymbo),1);

    for i=1:length(qam)
        x = (0:qam(i)-1)';
        y = qammod(x,qam(i));
        A2{i} = y;
        noOfAmplitudes(i) = length(unique(abs(A2{i})));
        thetas{i} = sort(unique(atan2(imag(y),real(y))));

    end
    
    voltAdded =  MAX_VOLTAGE/2;
    index = find(qam==QAM_CHOSEN);
    
    
%     A = zeros(noOfAmplitudes(index),1);
%     amplitude_step = voltAdded./noOfAmplitudes(index);
% 
%     %creating amplitudes for 16 QAM
%     A(1)=amplitude_step*1.2;
%     for i=2:length(A)
%         A(i)=A(i-1)+amplitude_step;
%     end
    A= [0.64 1.10 1.5];
    A
    stepInDegrees = 360/SAMPLES_perPeriod
    previousStepsInDeg = 360/PREVIOUS_SAMPLES_1ms;

    %samples_8ms = SAMPLES*8;

    %PWM_ticks_for_onePeriod = 256
    %samples_1s = clock_Hz/PWM_ticks_for_onePeriod

    %% phases
    % phases_deg =[ -157.5,... %
    %          -135.0,...
    %          -112.5,...
    %           -67.5,...
    %           -45.0,...
    %           -22.5,... %
    %            22.5,...
    %            45.0,...
    %            67.5,...%
    %           112.5,...
    %           135.0,... 
    %           157.5]; %
    phases_deg = rad2deg(thetas{index});
    phases_deg2 = phases_deg;
    angles_DDS = phases_deg2-90;
    phases_deg(phases_deg<0) = phases_deg(phases_deg<0) + 360;
    steps = round(phases_deg/stepInDegrees)';

    
    phases_rad = thetas{index}';
    % minus 1 to get 79 as max value, not 80
    %steps = steps - 1;
    steps(steps<0)= steps(steps<0) + SAMPLES_perPeriod; %offset for getting correct index on offset

    previous_steps = (phases_deg/previousStepsInDeg)';
    previous_steps = previous_steps - 1;
    %previous_steps(previous_steps<0)= previous_steps(previous_steps<0) + PREVIOUS_SAMPLES_1ms; %offset for getting correct index on offset
    %% actual calculations and saving to file
    %A_unique = unique(abs(A2{index}));

    PERIOD_SECONDS = 1/FREQ_SIG; %one period
    
    t = linspace(0,PERIOD_SECONDS,SAMPLES_perPeriod);
    sin_matrix_one_period = zeros(3,SAMPLES_perPeriod);

    for i=1:length(A) %creating the sin values for different amplitudes in one period of sine wave, 32 samples
        %each row corresponds to 32 samples for one different amplitude
        sin_matrix_one_period(i,:) = carrier_signal(A(i),FREQ_SIG,t,0);
        max_volt(i) = max(sin_matrix_one_period(i,:));     
    end

    max_volt = max(max_volt);
    sin_matrix_one_period = sin_matrix_one_period + max_volt;
    sin_matrix_dutyCycles =...
        round(sin_matrix_one_period/max_volt*PWM_ticks_for_oneSample/2);
    
    figure
    stem(sin_matrix_dutyCycles(1,:));
    hold on
    title([num2str(QAM_CHOSEN),'-QAM']);
    for i=2:length(A)
        stem(sin_matrix_dutyCycles(i,:));
    end
    legend(num2str(A));
    xlabel('t - seconds')
    hold off
%     clear sin_matrix_one_period
%     clear A
%     clear max_volt
    %% calculated QAM
%     A_unique = unique(A2{index});
%     sin_matrix_one_perQAM = zeros(length(A_unique),SAMPLES_perPeriod);
%     for i=1:length(A) %creating the sin values for different amplitudes in one period of sine wave, 32 samples
%         %each row corresponds to 32 samples for one different amplitude
%     %     sin_matrix_one_perQAM(i,:) =...
%     %         sin_car(imag(A2{index}(i)), FREQ_SIG, t, 0) +...
%     %         cos_car(real(A2{index}(i)), FREQ_SIG, t, 0);
%         sin_matrix_one_perQAM(i,:) =...
%             sin_car(A(i), FREQ_SIG, t, 0) +...
%             cos_car(A(i), FREQ_SIG, t, 0);
%     %     thetas{index}(i);
%         max_voltQAM(i) = max(sin_matrix_one_perQAM(i,:));     
%     end

%     max_voltQAM = max(max_voltQAM);
%     sin_matrix_one_perQAM = sin_matrix_one_perQAM + max_voltQAM;
%     sin_matrix_dutyCycles =...
%         round(sin_matrix_one_perQAM/max_voltQAM*PWM_ticks_for_oneSample/2);
%     figure
%     stem(t,sin_matrix_one_perQAM(1,:));
%     title(['calculated, one ',num2str(QAM_CHOSEN),'-QAM']);
%     hold on
%     for i=2:length(A)
%         stem(t,sin_matrix_one_perQAM(i,:));
%     end
%     legend(num2str(A_unique));
%     xlabel('t - seconds');
%     hold off
    
%     file recording
%     gets text version of amount of bits for each value (for verilog)
    bits_PWM_ticks_for_oneSample = num2str(length(dec2bin(PWM_ticks_for_oneSample)));
    bits_SAMPLES_perPeriod = num2str(length(dec2bin(SAMPLES_perPeriod)));
    
    info = '/*\n';
    info  = [info, 'START OF ', num2str(QAM_CHOSEN),'-QAM  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n'];
    info  = [info, 'freq signal: ', num2str(FREQ_SIG), '\n'];
    info  = [info , 'symbol rate: ', num2str(symbol_rate), '\n'];
    info  = [info, 'sample rate(PWM), Hz: ', num2str(samples_1s), '\n'];
    info  = [info, 'SAMPLES perPeriod: ', num2str(SAMPLES_perPeriod), '\n'];
    info  = [info, 'clock ticks in one PWM period: ', num2str(PWM_ticks_for_oneSample), '\n'];
    info  = [info, 'PWM_freq: ', num2str(PWM_freq), '\n'];
    info  = [info, 'step in degrees/sample: ', num2str(stepInDegrees), '\n'];
    fprintf(fileID, info);
    for a_i=1:length(A)
        A_info = ['amplitude ',num2str(a_i), ': ',num2str(A(a_i)),'\n'];
        fprintf(fileID, A_info);
    end
    endOfInfo  = '------------------------------------\n*/\n';
    fprintf(fileID, endOfInfo);


    for j=1:length(A)
        text = ['//max duty: ', num2str(max(sin_matrix_dutyCycles(j,:))), '\n'];
        text = [text, '    case(sample_select) //',num2str(SAMPLES_perPeriod),...
            ' need ',num2str(SAMPLES_perPeriod),' cases\n'];
        fprintf(fileID, text);
        for i=1:length(t)
            fprintf(fileID,... 
                ['        ',bits_SAMPLES_perPeriod,...
                '''d',num2str(i-1), ' : dutyCycle <= ',...
                bits_PWM_ticks_for_oneSample, '''d%u;\n'],...
                sin_matrix_dutyCycles(j,i));
        end
        fprintf(fileID,[ '        default : dutyCycle <= ',...
            bits_PWM_ticks_for_oneSample,'''d',...
            num2str(PWM_ticks_for_oneSample/2),';\n']);
        fprintf(fileID, '    endcase\n');
        fprintf(fileID, '\n\n\n\n');
    end
    
    fprintf(fileID, '/*phases\n');
    for i=1:length(phases_deg2)
       %phases_txt = [num2str(phases_rad(i)), ' rad == ',...
       phases_txt = [num2str(SAMPLES_perPeriod), ' samples/period: ',...
           num2str(phases_deg2(i)), ' deg == ', num2str(steps(i)),'\n'];
        fprintf(fileID, phases_txt);
    end
    endOf_QAM  = ['END OF ', num2str(QAM_CHOSEN), '-QAM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n*/\n'];
    fprintf(fileID, endOf_QAM);

fclose('all');