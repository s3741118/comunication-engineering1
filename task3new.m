load lab4_workspace.mat

N = length(t);
% IQ2 PSK
figure('name', 'BPSK Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,iBPSK)
axis([0 0.01 -1.5 1.5])
grid on
title('I-BPSK Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(iBPSK))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-BPSK Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,qBPSK)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-BPSK time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(qBPSK))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-BPSK Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')



%IQ2 QAM

figure('Name', '2QAM Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,i2QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('I-2QAM Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(i2QAM))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-2QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,q2QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-2QAM time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(q2QAM))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-2QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')


%QPSK
figure('Name', 'QPSK Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,iQPSK)
axis([0 0.01 -1.5 1.5])
grid on
title('I-QPSK Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(iQPSK))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-4QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,qQPSK)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-4QAM time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(qQPSK))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-4QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')

%4QAM
figure('Name', '4QAM Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,i4QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('I-QPSK Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(i4QAM))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-4QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,q4QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-4QAM time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(q4QAM))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-4QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')


%16‐PSK 
figure('Name', '16PSK Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,i16PSK)
axis([0 0.01 -1.5 1.5])
grid on
title('I-16PSK Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(i16PSK))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-16PSK Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,q16PSK)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-16PSK time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(q16PSK))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-16PSK Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')


%16QAM
figure('Name', '16QAM Time and Frequency domain I & Q:')
subplot(4,1,1), plot(t,i16QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('I-16QAM Time Domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,2), plot(f,abs(fftshift(fft(i16QAM))/N))
axis([-40000 40000 -0 0.1])
grid on
title('I-16QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
subplot(4,1,3), plot(t,q16QAM)
axis([0 0.01 -1.5 1.5])
grid on
title('Q-16QAM time domain')
ylabel('Amplitude')
xlabel('Time(s)')
subplot(4,1,4), plot(f,abs(fftshift(fft(q16QAM))/N))
axis([0 35000 -0 0.1])
grid on
title('Q-16QAM Frequency Domain')
xlabel('Frequency(Hz)')
ylabel('Magnitude')