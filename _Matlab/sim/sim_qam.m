%simulation of the Verilog implementation
clear, clc, close all
carrier_signal=@(A, t, phase)A.*sin(2000*pi*t + phase);

I=@(A, f, t, phase)A.*sin(2*pi*f*t + phase);
Q=@(A, f, t, phase)A.*cos(2*pi*f*t + phase);

samples_1ms = 80;
samples_8ms = samples_1ms*8;
t = linspace(0,.008,samples_8ms);
figure
plot(t, carrier_signal(1.5, t, 0)+1.5 )
title('carrier signal');
xlabel('time, seconds');
ylabel('amplitude, V');
xlim([-0.001 0.009]);

%freq = 100000000;


preamb = ...
    ['We the People of the United States, in Order to form a more ',...
        'perfect Union, establish Justice, insure domestic Tranquility, ',...
        'provide for the common defence, promote the general Welfare, ',...
        'and, secure the Blessings of Liberty to ourselves and our ',...
        'Posterity, do ordain and establish this Constitution for the ',...
        'United States of America.'];
% preamb = 0;
%preamb= 'We';
% for i=1:15
%     preamb = [preamb,  i];
% end
preamb_uint8 = uint8(preamb);
 %in degrees, 1st row
phases=[ -157.5,...
         -135.0,...
         -112.5,...
          -67.5,...
          -45.0,...
          -22.5,...
           22.5,...
           45.0,...
           67.5,...
          112.5,...
          135.0,...
          157.5];
%in radians, second row
symbol_matrix = break_down_char_two_4bit_parts(preamb_uint8);
%symbol_matrix = break_down_char_two_4bit_parts(preamb);

 
[QAM_sinwav, t_total] =...
    convertToQAMvalues(symbol_matrix(1,1), samples_8ms);
[QAM_sinwav2, t] =...
    convertToQAMvalues(symbol_matrix(2,1), samples_8ms);
%t_total = [t_total t];
newTransmission = [QAM_sinwav QAM_sinwav2];
%newTransmission = QAM_sinwav2;
length_transm = length(symbol_matrix);
for i=2:length_transm
%1st is the high bits, 2nd low 4 bits
    [QAM_temp, t_total] =...
        convertToQAMvalues(symbol_matrix(1,i), samples_8ms);
    [QAM_temp2, t] =...
        convertToQAMvalues(symbol_matrix(2,i), samples_8ms);
    
    newTransmission = [newTransmission QAM_temp QAM_temp2];
    newTransmission = [newTransmission QAM_temp2];
end

newTransmission = newTransmission + 1.5;
%(multiplied by 2 because each character corresponds to 2 consecutive, 
% different sinewaves, representing high 4 bits followed by low 4 bit
t_transm =...
    linspace(0,0.008*length_transm*2, samples_8ms*length_transm*2);
%t_transm = linspace(0,.008*length_transm*2,8000*length_transm*2);

steps = length(t_transm)/length(symbol_matrix); %ne char at a time

plot1 = figure
plot1.MenuBar = 'none';
plot(t_transm(1:steps), newTransmission(1:steps))
title('The preamble of the U.S. Constitution');
xlabel('time, seconds');
ylabel('amplitude, V');
xlim([0 t_transm(end)])

xlabel('time, seconds');
ylabel('amplitude, V');
title('The preamble of the U.S. Constitution');
xlim([0 t_transm(end)+1]);
j=length_transm;
legend([num2str(j), 'characters'])

hold on
for i=1:steps:length(t_transm)
    pause(0.001);
    j = j - 1;
    plot(t_transm(i:i+steps-1),...
        newTransmission(i:i+steps-1))
    a = legend({[num2str(j), ' characters']},'FontSize',28);
end

hold off

[QAM_zero, t] =...
    convertToQAMvalues(uint8(0), samples_8ms);
[QAM_one, t] =...
    convertToQAMvalues(uint8(1), samples_8ms);

start_seq = [QAM_zero QAM_one QAM_zero QAM_one] + 1.5;
%transmission now have two [0 1 0 1] or 0x01 0x01
newTransmission = [start_seq newTransmission];

max_voltage = max(newTransmission);

%transmission_scaled = round(newTransmission/max_voltage*3125);
transmission_scaled = round(newTransmission/max_voltage*1250);
t_next = max(t_transm) + t;
t_next = [t_next, max(t_next) + t];
t_next = [t_next, max(t_next) + t];
t_next = [t_next, max(t_next) + t];

t_transm = [t_transm t_next];
figure
%plot(t_transm, transmission_scaled);
plot(transmission_scaled);
%xlim([0 2500])
a=gcf;
a.MenuBar ='none';
% plot2 = figure
% plot2.MenuBar = 'none';
% plot(t_transm, newTransmission,'m');
% hold on
% title('The preamble of the U.S. Constitution');
% xlabel('time, seconds');
% ylabel('amplitude, V');
% legend('off')
% pause
% legend('We th')
% xlim([0 0.08]);
% %legend('off')
% pause
% legend('one character (W)')
% xlim([0 0.016]);
% format short;