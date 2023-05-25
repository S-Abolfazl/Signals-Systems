function [outputArg] = highpassfilter(wc,y1,fs)
ft = fft(y1);
v = linspace(-fs/2,fs/2,length(ft));
func = fftshift(ft);

func(v >= -wc & v <= wc) = 0;


outputArg = ifft(func);
end