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

%% Part 6

% Amplitude Modulation of the recorded signal
modulatedSignal = ammod(m, fs, 1000000);
spectrumAM = fft(modulatedSignal);
signalLength = length(m);
normalizedSpectrum = abs(spectrumAM / signalLength);
halfSpectrum = normalizedSpectrum(1:signalLength/2+1);
halfSpectrum(2:end-1) = 2 * halfSpectrum(2:end-1);
figure; plot(halfSpectrum);
title('Spectrum of AM Signal');  
xlabel('Frequency (Hz)');


%% Part 7&8

% Envelope Detection
envelope = abs(hilbert(modulatedSignal));
figure; plot(envelope);
title('Envelope of AM Signal');

% Mean Squared Error between the original and the detected envelope
mseError = immse(m, envelope);
disp("Mean Squared Error: ");
disp(mseError);

%% Part 9

% Add noise to the signal
noisySignal = awgn(m, 10);

% Amplitude Modulation of the noisy signal
modulatedNoisySignal = ammod(noisySignal, fs, 1000000);
spectrumAMNoisy = fft(modulatedNoisySignal);
signalLength = length(m);
normalizedSpectrum = abs(spectrumAMNoisy / signalLength);
halfSpectrum = normalizedSpectrum(1:signalLength/2+1);
halfSpectrum(2:end-1) = 2 * halfSpectrum(2:end-1);
figure; plot(halfSpectrum);
title('Spectrum of AM Noisy Signal');  
xlabel('Frequency (Hz)');

% Envelope Detection of the modulated noisy signal
envelopeNoisy = abs(hilbert(modulatedNoisySignal));
figure; plot(envelopeNoisy);
title('Envelope of AM Noisy Signal');



%% Part 10

% Read audio file
[m, fs] = audioread('Guitar.mp3');
t = 1 / fs;             
Len = length(m);          
t = (0:Len-1) * t;        
s = size(m, 1);
figure; stem(t, m);
title('Message in Time Domain');  
xlabel('Time (seconds)');

% Plot the spectrum
freqResolution = fs / s;
frequencyAxis = (-(s/2):(s/2)-1) * freqResolution;
temp = fft(m) / s;        
spectrum = fftshift(temp);
figure; plot(frequencyAxis, abs(spectrum));
title('Amplitude Spectrum');  
xlabel('Frequency (Hz)');

% Low-Pass Filter below 4 kHz
filtered = lowpass(m, 4000, fs);

% Error between original and filtered signal
mseError = immse(m, filtered);
disp("The error =");
disp(mseError);

% Frequency Modulation of the recorded signal
FMsignal = fmmod(m, fs, 1000000, 2);

% Spectrum of FM modulated signal
spectrumFM = fft(FMsignal);
signalLength = length(m);
normalizedFM = abs(spectrumFM / signalLength);
halfSpectrumFM = normalizedFM(1:signalLength/2+1);
halfSpectrumFM(2:end-1) = 2 * halfSpectrumFM(2:end-1);
figure; plot(halfSpectrumFM);
title('Spectrum of FM Signal');  
xlabel('Frequency (Hz)');

% Envelope Detection of FM signal
envelopeFM = abs(hilbert(FMsignal));
figure; plot(envelopeFM);
title('Envelope of FM Signal');

% Add noise to the signal
noisySignal = awgn(m, 10);

% Frequency Modulation of the noisy signal
FM_modulatedNoisySignal = fmmod(noisySignal, fs, 1000000, 2);

% Spectrum of FM modulated noisy signal
spectrumFMNoisy = fft(FM_modulatedNoisySignal);
normalizedFMNoisy = abs(spectrumFMNoisy / signalLength);
halfSpectrumFMNoisy = normalizedFMNoisy(1:signalLength/2+1);
halfSpectrumFMNoisy(2:end-1) = 2 * halfSpectrumFMNoisy(2:end-1);
figure; plot(halfSpectrumFMNoisy);
title('Spectrum of FM Noisy Signal');  
xlabel('Frequency (Hz)');

% Envelope Detection of FM modulated noisy signal
envelopeFMNoisy = abs(hilbert(FM_modulatedNoisySignal));
figure; plot(envelopeFMNoisy);
title('Envelope of FM Noisy Signal');
