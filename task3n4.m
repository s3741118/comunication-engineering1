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
plot(t, y, t, m, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=0.5')
legend('AM signal:', 'Message signal, m(t) ')


subplot(4,1,2)
y2 =(1 + 0.8*m).*cos(20000*pi*t);
plot(t, y2, t, m, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=0.8')
legend('AM signal:', 'Message signal, m(t) ')

subplot(4,1,3)
y3 =(1 + 1*m).*cos(20000*pi*t);
plot(t, y3, t, m, 'r');
xlabel('time, sec')
ylabel('Y(t) vs m(t)')
title('message and AM signal in time domain with Ka=1')
legend('AM signal:', 'Message signal, m(t) ')

subplot(4,1,4)
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




% N=length(t);
% fs=1/Ts; 
% F=fs/N;
% f=(-fs/2):F:(fs/2)-F;
% Y=fftshift(fft(y))/N;
% figure (2)
% plot(f, abs(Y))
% xlabel('frequency, Hz')
% ylabel('|Y(f)|')
% title('frequency spectrum of AM')

% figure(3)
% m=fftshift(fft(m));
% plot(t,abs(m));
%axis([-5*10^4 5*10^4 0 400])