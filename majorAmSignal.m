clc;
close all;
Fm1 = 500;
Fm2 = 900;
Fc1 = 5310;
Fc2 = Fc1 + 2*Fm2;
fs = 100000;                      
t = 0:1/fs:0.01;  
N=length(t);
F = fs/N;
f=(-fs/2):F:(fs/2)-F;

c1 = cos(2*pi*Fc1*t); 
c2 = cos(2*pi*Fc2 *t);
m1 = cos(2*pi*Fm1*t);
m2 = cos(2*pi*Fm2*t);
beta=0.9;
x1 = (1+beta*m1).*c1;
x2 = (1+beta*m2).*c2;
x = x1+ x2;
X_1 = fftshift(fft(x1))/N;
X_2 = fftshift(fft(x2))/N;
X = fftshift(fft(x))/N;

figure(1)
subplot(3,1,1)
plot(t, x1)
title('Amplituded Modulation Signal 1')
ylabel('x1(t)')
xlabel('Time,s')
subplot(3,1,2)
plot(t, x2)
title('Amplituded Modulation Signal 2')
ylabel('x2(t)')
xlabel('Time,s')
subplot(3,1,3)
plot(t, x)
title('Frequency Division Multiplexing')
ylabel('x(t)')
xlabel('Time,s')

figure(2)
subplot(3,1,1)
plot(f, abs(X_1))
title('Magnitude spectrum of Signal 1')
ylabel('|x1(t)|')
xlabel('frequency,Hz')
subplot(3,1,2)
plot(f, abs(X_2))
title('Magnitude spectrum of Signal 2')
ylabel('|x2(t)|')
xlabel('frequency,Hz')
subplot(3,1,3)
plot(f, abs(X))
title('Magnitude spectrum of Frequency Division Multiplexing signal')
ylabel('|x(t)|')
xlabel('frequency,Hz')
%axis([-8* 10^3 8*10^3 0 0.6])


% figure(1)
% subplot(2,1,1)
% plot(t, y1);
% title('DSB-AM Signal from m1(t)'); xlabel('time (s)'); ylabel('amplitude');
% subplot(2,1,2)
% plot(f, abs(Y_1));
% xlabel('Amplitude')
% ylabel('frequency, Hz')
% title('DSB-AM Signal Magnitude Spectra ','Fontsize',9)
% 
% 
% Y_2 = fftshift(fft(y2))/N;
% figure(2)
% subplot(2,1,1)
% plot(t, y2);
% title('DSB-AM Signal from m2(t)'); xlabel('time (s)'); ylabel('amplitude');
% subplot(2,1,2)
% plot(f, abs(Y_2));
% xlabel('Amplitude')
% ylabel('frequency, Hz')
% title('DSB-AM Signal Magnitude Spectra ','Fontsize',9)
% 
% n = 10; wn = 1000/(fs/2);
% [num,den]=butter(n,wn);
% 
% %Synchronous Detector
% g1 = y1.*c;
% g2 = y2.*c;
% 
% d1 = filter(num,den, g1);
% d2 = filter(num,den, g2);
% 
% figure(3)
% subplot(2,1,1), plot(t,d1)
% title(' AM Signal After Coherent Detection from m1(t)','Fontsize',7), axis ([0 0.01 -0.2 1])
% xlabel('time (s)'), ylabel('y(t)')
% 
% subplot(2,1,2), plot(t,d2)
% title(' AM Signal After Coherent Detection from m2(t)','Fontsize',7), axis ([0 0.01 -0.2 1])
% xlabel('time (s)'), ylabel('y(t)')


% % Non-Coherent Detection Step 2: Low Pass RC Filter
% h = fir1(100, 9000/(fs/2), 'low');            % 9 kHz cut-off frequency
% foutputc = filter(h,1,Vd);
% 
% figure(3)
% plot(t, Vd);
% title('Envelope detector output of DSB-SC signal'); xlabel('time (s)'); ylabel('amplitude');
% figure(4)
% plot(t, foutputc);
% title('Non-coherent demodulated DSB-SC signal'); xlabel('time (s)'); ylabel('amplitude');
