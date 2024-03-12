# EMG-Data-Logger
UCSD Beng186 Final Project. Analog circuit with Arduino-based data logger, integrated with MATLAB for storing and processing data.

Readonly.ino file contain arduino firmware (tested on the Mega2560 and Due) which read voltage sample at specified sampling rate from connected analog circuit. In MATLAB, arduino_serialinput.m receives data from Arduino and stores it in MATLAB. The emgdataprocessing.m file is responsible for processing and plotting the data.

There are two sets of code. Files with no "1k" in the name support a low sampling rate (currently set to 200Hz). The readonly.ino file contains the Arduino firmware which reads the time value and voltage value. The sampling rate is set by the delay in ms. In MATLAB, the time and voltage values are read and stored using arduino_serialinput.m. The file emgdataprocessing.m contains multiple methods of processing (filter, FFT, calculate power) and plotting the data. The arduino_run_final.m file allows for etting the parameters of the sample being collected, and initializes the two other functions.

Files with "1k" in the name are adjusted to a 1kHz sampling rate. The arduino firmware does not use delay to set the sampling rate to avoid time slip. MATLAB only receives the voltage value from Arduino and adds the time value in arduino_serialinput_1k.m. The emgdataprocessing.m file is used for processing, but filter parameters need to be adjusted for higher sampling rate.
