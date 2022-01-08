f1 = 500;
f2 = 1000;     
A1 = 0.6;
A2 = 0.4;
fs = 44100;
t = 0:1/fs:0.01;
N = length(t);
F = fs/N;
f = (-fs/2) : F : (fs/2)-F;
sig = A1* cos(2*pi*f1*t - pi/6) + A2*cos(2*pi*f2*t + pi/4);
codebook = -1 : 0.125 : 1; % xmin = -1, xmax =1 step = (xmax-xmin)/(2^n)
output = myQuantiser(sig, codebook);
figure(1)
subplot(2,1,1)
plot(t, output)
subplot(2,1,2)
Out = fftshift(fft(output))/N;
plot(f,abs(Out))
