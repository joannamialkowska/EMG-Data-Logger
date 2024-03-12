clear;clc;

%If port already exists, clear it
if ~isempty(instrfind)
     fclose(instrfind);
      delete(instrfind);
end

%Initialize data parameters
samplingRate = 1000; %in Hz, must match Arduino IDE
numSec = 30; %length of sample in seconds
baudRate = 115200; %must match Arduino IDE
com = 'COM6'; %Arduino port, must match Arduino IDE

%Run function to collect sample
data = arduino_serialinput_1k(samplingRate,numSec,baudRate,com);
emgdataprocessing(data,samplingRate);
