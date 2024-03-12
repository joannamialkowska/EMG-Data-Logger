function emgdataprocessing(data,fs)

t = data(:,1);
v = data(:,2);

%% Raw data plot
figure(9);
plot(t,v,'r')
title('Raw data imported from Arduino')
xlabel('Time [ms]')
ylabel('Sample value [-]')

%% Correct voltage and time in seconds
t = t./1000;
vavg = mean(v);
v = ((v-vavg)*3.3)./1023;

%% Unprocessed plot
figure(1);
plot(t,v,'r');
title('Unprocessed data')
xlabel('Time [s]')
ylabel('Voltage [V]')


%% Spectrum plot
% [p,f] = pspectrum(v,t);
% 
% figure(2);
% plot(f,p,'b');
% %xlim([0 5])
% ylim([0 100]);
% title('Spectrum Plot')
% xlabel('Frequency [Hz]')
% ylabel('Power')

%% Lowpass butterworth filter
% figure(3);
% 
% fc = 25; %cutoff frequency
% [b,a] = butter(4,fc/(fs/2),"low");
% 
% dataOutLow = filter(b,a,v);
% plot(dataOutLow(:,1),dataOutLow(:,2));
% title('Data After Low Pass')
% xlabel('Time [s]')
% ylabel('Voltage [V]')
% ylim([200 700]);

%% Filter characteristic
% figure(4);
% freqz(b,a,[],fs);
% subplot(2,1,1);
%ylim([200 700]);

%% Highpass butterworth filter
figure(5);

fh = 70; %cutoff frequency for highpass
Wn = fh./(fs/2);
[b2, a2] = butter(8,Wn,"high");

dataOutHigh = filter(b2,a2,v);
plot(t,dataOutHigh,'m');

title('Data after 70Hz highpass filter')
xlabel('Time [s]')
ylabel('Voltage [V]')

%% Power plot
figure(6);
power = log10(dataOutHigh.^2)*10;
plot(t,power,'g');
title('Power plot')
xlabel('Time [s]')
ylabel('Power [dB]')

%% Power plot after 2Hz lowpass filter
figure(7);
fc = 2; %cutoff frequency
[b,a] = butter(8,fc/(fs/2),"low");

powerOut = filter(b,a,power);
plot(t,powerOut,'b');
title('Power plot after 2Hz lowpass filter')
xlabel('Time [s]')
ylabel('Power [dB]')
