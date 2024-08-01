% Load the audio file 

[m, fs] = audioread('Guitar.mp3');
timeStep = 1 / fs;             
numSamples = length(m);          
timeArray = (0:numSamples-1) * timeStep;        
originalAudio = audioplayer(m, fs);
numChannels = size(m, 1);
figure; stem(timeArray, m);
title('Message Time [sec]');  
xlabel('Time (seconds)');

%Plot the spectrum 

freqResolution = fs / s;
frequencyAxis = (-(s/2):(s/2)-1) * freqResolution;
temp = fft(m) / s;       
spectrum = fftshift(temp);
figure; plot(frequencyAxis, abs(spectrum));
title('Amplitude Spectrum');  
xlabel('Frequency [Hz]');


%% Part 3&4&5

% Low-Pass Filter below 4 kHz
lowpass(m, 4000, fs);
filteredSignal = lowpass(m, 4000, fs);

% Mean Squared Error between the original and filtered signals
mseError = immse(m, filteredSignal);
disp("Mean Squared Error: ")
disp(mseError)
