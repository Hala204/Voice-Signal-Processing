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
