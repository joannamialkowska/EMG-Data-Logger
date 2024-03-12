function [data] = arduino_serialinput_1k(samplingRate,numSec,baudRate,com)

%Arduino port setup
device = serialport(com,baudRate);    
configureTerminator(device,'CR/LF')
                     
% data = uint32.empty(2,0);
% formatSpec = '%d %d';

%v = uint32.empty(1,0);
v = [];
formatSpec = '%d';

% t = uint32.empty(1,0);
% sampletime = 0;

count = 0;
while count < numSec*samplingRate
    count = count + 1;
    line = readline(device);
    sample = sscanf(line,formatSpec);
    v = [v;sample];
    % t = [t;sampletime];
    % sampletime = sampletime + 1;
    
    %data = [data; sample];
end

t = (1:numSec*samplingRate);
clear device;

%Plot raw data
% figure;
% plot(t,v,'b');
% title('Unprocessed Data');
% xlabel('Time [ms]');
% ylabel('Voltage [V]');

data = horzcat(t',v);

end