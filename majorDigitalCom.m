f1 = 500;
f2 = 1000;     
A1 = 0.6;
A2 = 0.4;
fs = 44100;
t = 0:1/fs:1;
T = t(1:end-1);
N = length(t);
F = fs/N;
f = (-fs/2) : F : (fs/2)-F;
sig = A1 * cos(2*pi*f1*t - pi/6) + A2 * cos(2*pi*f2*t + pi/4);
codebook = [-1 : 0.125 : 1]; % xmin = -1, xmax =1 step = (xmax-xmin)/(2^n)
output = myQuantiser(sig, codebook);
figure(1)
subplot(2,1,1)
plot(t, output, '.', t, sig,'x')
legend('Quantized signal', 'Original signal');
xlabel('time, s')
ylabel('x(t)')
title('Original signal and quantised  signal in time domain')
axis([0 0.01 -1 1])
subplot(2,1,2)
Out = fftshift(fft(output))/N;
plot(f,abs(Out))
xlabel('frequency, Hz')
ylabel('Amplitude')
title('Quantity signal in freq domain')

figure(2)
m1 = A1 * cos(2*pi*f1*t+ pi/6);
c1 = A2 * square(2*pi*10000*t-pi/4)+A2;
%mo = m1.*c1;
mo = sig .* c1;
subplot(2,1,2)
plot(t, mo)
xlabel('time,s')
ylabel('amplitude')
title('PAM signal')
axis([0 0.01 -1 1])
subplot(2,1,1)
plot(c1)
axis([0 20 0 1])
xlabel('time,s')
ylabel('amplitude')
title('Carrier signal')
%figure(2)
% %x1 = square(2*pi*fs*t);
% modData = pammod((0:15),16);
% subplot(2,2,1), 
% %plot(real(p1),imag(p1),'.')
% scatter(modData)
% axis([-1.5 1.5 -1.5 1.5])
% %, xlabel('Real'),ylabel('Imaginary')

% %figure(3)
% m1 = A1 * cos(2*pi*f1*t);
% m2 = A2 * cos(2*pi*f2*t);

M = 16;
data = [0:M-1];
symgray = pammod(data,M,0,'gray');
mapgray = pamdemod(symgray,M,0,'gray');

symbin = pammod(data,M,0,'bin');
mapbin = pamdemod(symbin,M,0,'bin');
scatterplot(symgray,1,0,'b*');
for k = 1:M
    text(real(symgray(k))-0.6,imag(symgray(k))+0.6,...
        dec2base(mapgray(k),2,4));
    text(real(symgray(k))-0.2,imag(symgray(k))+1.2,...
        num2str(mapgray(k)));
    
    text(real(symbin(k))-0.6,imag(symbin(k))-0.6,...
        dec2base(mapbin(k),2,4),'Color',[1 0 0]);
    text(real(symbin(k))-0.2,imag(symbin(k))-1.2,...
        num2str(mapbin(k)),'Color',[1 0 0]);
end
axis([-M M -3 3])
