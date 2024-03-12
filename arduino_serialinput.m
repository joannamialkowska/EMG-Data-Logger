function [data] = arduino_serialinput(samplingRate,numSec,baudRate,com)

%Arduino port setup
device = serialport(com,baudRate);    
configureTerminator(device,'CR/LF')
                     
data = uint32.empty(2,0);
formatSpec = '%d %d';

count = 0;
while count < numSec*samplingRate
    count = count + 1;
    line = readline(device);
    sample = sscanf(line,formatSpec,[1 2]);
    data = [data; sample];
end

clear device;

%Plot raw data
%figure;
%plot(data(:,1),data(:,2),'b')
%title('Unprocessed Data')
%xlabel('Time [ms]')
%ylabel('Voltage [V]')

end
