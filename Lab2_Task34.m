%task3 and 4
clc
clear
Ts = 0.00001;
t = 0: Ts : 0.01;
m = cos(880*pi*t);
c = cos(20000*pi*t);

y =(1 + 0.5*m).*cos(20000*pi*t);
N=length(t);
fs=1/Ts; 
F=fs/N;
f=(-fs/2):F:(fs/2)-F;

figure (1) 
subplot(4,1,1)
mi=1+0.5*m;
plot(t, y, t, mi, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=0.5')
legend('AM signal:', 'Message signal, m(t) ')


subplot(4,1,2)
mi=1+0.8*m;
y2 =(1 + 0.8*m).*cos(20000*pi*t);
plot(t, y2, t, mi, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=0.8')
legend('AM signal:', 'Message signal, m(t) ')

subplot(4,1,3)
mi=1+1*m;
y3 =(1 + 1*m).*cos(20000*pi*t);
plot(t, y3, t, mi, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=1')
legend('AM signal:', 'Message signal, m(t) ')

subplot(4,1,4)
mi=1+2*m;
y4 =(1 + 2*m).*cos(20000*pi*t);
plot(t, y4, t, m, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=2')
legend('AM signal:', 'Message signal, m(t) ')

figure(2)
Y=fftshift(fft(y))/N;
plot(f,abs(Y))
axis([-1.5*10^4 1.5*10^4 0 0.5])
title('magnitude spectrum |Y(f)|')
ylabel('Amplitude')
xlabel('frequency, Hz')


% Task 5
n = 10; wn = 1000/(fs/2);
[num,den]=butter(n,wn);

%Synchronous Detector
g1 = y.*c;
g2 = y2.*c;
g3 = y3.*c;
g4 = y4.*c;

d1 = filter(num,den, g1);
d2 = filter(num,den, g2);
d3 = filter(num,den, g3);
d4 = filter(num,den, g4);

figure(3)
subplot(2,2,1), plot(t,d1)
title(' AM Signal After Coherent Detection (Ka = 1)'), axis ([0 0.01 -0.2 1])
xlabel('time (s)'), ylabel('y(t)')

subplot(2,2,2), plot(t,d2)
title(' AM Signal After Coherent Detection (Ka = 0.5)'), axis ([0 0.01 -0.2 1])
xlabel('time (s)'), ylabel('y(t)')

subplot(2,2,3), plot(t,d3)
title(' AM Signal After Coherent Detection (Ka = 0.8)'), axis ([0 0.01 -0.2 1.2])
xlabel('time (s)'), ylabel('y(t)')

subplot(2,2,4), plot(t,d4)
title(' AM Signal After Coherent Detection (Ka = 2)'), axis ([0 0.01 -1 2])
xlabel('time (s)'), ylabel('y(t)')

%Frequency domain
D1 = fftshift(fft(d1))/N;
D2 = fftshift(fft(d2))/N;
D3 = fftshift(fft(d3))/N;
D4 = fftshift(fft(d4))/N;

figure(4)
subplot(2,2,1), plot(f,abs(D1))
title('AM Signal Magnitude Spectra After Coherent Detection (Ka = 1)','Fontsize',9) 
axis([-1500 1500 -0.005 0.5]), 
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')

subplot(2,2,2), plot(f,abs(D2))
title('AM Signal Magnitude Spectra After Coherent Detection(Ka = 0.5)','Fontsize',9) 
axis([-1500 1500 -0.005 0.5]), 
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')

subplot(2,2,3), plot(f,abs(D3))
title('AM Signal Magnitude Spectra After Coherent Detection(Ka = 0.8)','Fontsize',9)
axis([-1500 1500 -0.005 0.5]), 
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')

subplot(2,2,4), plot(f,abs(D4))
title('AM Signal Magnitude Spectra After Coherent Detection(Ka = 2)','Fontsize',9)
axis([-1500 1500 -0.005 0.5]), 
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')

% Asynchronous

A1 = zeros(1,length(y));
A1(y > 0) = y (y > 0);

A2 = zeros(1,length(y2));
A2(y2 > 0) = y2 (y2 > 0);

A3 = zeros(1,length(y3));
A3(y3 > 0) = y3 (y3 > 0);

A4 = zeros(1,length(y4));
A4(y4 > 0) = y4 (y4 > 0);

z1 = filter(num,den,A1);
Z1 = fftshift(fft(z1))/N;

z2 = filter(num,den,A2);
Z2 = fftshift(fft(z2))/N;

z3 = filter(num,den,A3);
Z3 = fftshift(fft(z3))/N;

z4 = filter(num,den,A4);
Z4 = fftshift(fft(z4))/N;

figure(5)
subplot(2,2,1), plot(t,z1), axis([ 0 0.01 -0.05 0.7])
title(' AM Signal After Envelop Detection(Ka = 1)'), xlabel('time (s)'), ylabel('y(t)')
subplot(2,2,2), plot(t,z2), axis([ 0 0.01 -0.05 0.7])
title(' AM Signal After Envelop Detection(Ka = 0.5)'), xlabel('time (s)'), ylabel('y(t)')
subplot(2,2,3), plot(t,z3), axis([ 0 0.01 -0.2 1])
title(' AM Signal After Envelop Detection(Ka = 0.8)'), xlabel('time (s)'), ylabel('y(t)')
subplot(2,2,4), plot(t,z4), axis([ 0 0.01 -0.05 1.5])
title(' AM Signal After Envelop Detection(Ka = 2)'), xlabel('time (s)'), ylabel('y(t)')

figure(6)
subplot(2,2,1),plot(f,abs(Z1)), axis([ -2500 2500 -0.05 0.4]);
title('AM Signal Magnitude Spectra After Envelop Detection(Ka = 1)','Fontsize',9)
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')
subplot(2,2,2),plot(f,abs(Z2)), axis([ -2500 2500 -0.05 0.35]);
title('AM Signal Magnitude Spectra After Envelop Detection(Ka = 0.5)','Fontsize',9)
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')
subplot(2,2,3),plot(f,abs(Z3)), axis([ -2500 2500 -0.05 0.35]);
title('AM Signal Magnitude Spectra After Envelop Detection(Ka = 0.8)','Fontsize',9)
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')
subplot(2,2,4),plot(f,abs(Z4)), axis([ -2500 2500 -0.05 0.5]);
title('AM Signal Magnitude Spectra After Envelop Detection(Ka = 2)','Fontsize',9)
xlabel('Frequency (Hz)'), ylabel('Y|(f)|')
