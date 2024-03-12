function [data] = arduino_serialinput_1k(samplingRate,numSec,baudRate,com)

%Arduino port setup
device = serialport(com,baudRate);    
configureTerminator(device,'CR/LF')

v = [];
formatSpec = '%d';

count = 0;
while count < numSec*samplingRate
    count = count + 1;
    line = readline(device);
    sample = sscanf(line,formatSpec);
    v = [v;sample];
end

clear device;

t = (1:numSec*samplingRate);
data = horzcat(t',v);

%Plot raw data
% figure;
% plot(t,v,'b');
% title('Unprocessed Data');
% xlabel('Time [ms]');
% ylabel('Voltage [V]');

end
