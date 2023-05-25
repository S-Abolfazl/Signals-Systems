
[y,Fs] = audioread('noisy_song.wav');

subplot(1,4,1);
plot(y);
title('Audio Signal');
subplot(1,4,2)
spectrogram(y,'yaxis');
xlabel('Time'); 
ylabel ('Hz');
title ('FFT Spectrum');

lpf_audio = lowpassfilter(500,y,Fs);
subplot(1,4,3);
spectrogram(lpf_audio, 'yaxis');
xlabel('Time'); 
ylabel ('Hz');
title ('LPF Spectrum');

hpf_audio = highpassfilter(500,y,Fs);

subplot(1,4,4);
spectrogram(hpf_audio, 'yaxis');
xlabel('Time'); 
ylabel ('Hz');
title ('HPF Spectrum');
audiowrite('LowPassFilter.wav',abs(lpf_audio),Fs)
audiowrite('HighPassFilter.wav',abs(hpf_audio),Fs)
