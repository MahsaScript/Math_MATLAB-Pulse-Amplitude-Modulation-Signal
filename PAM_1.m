clc;
clear all;
close all;
fc = 100;   % Carrier Frequency
bits = [ 0 0 1 0 1 1 0 ];
T = length(bits)/fc;
bits = [ 0 0 1 0 1 1 0 ];
bitrate =  50;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
lastbit = 1;
for i=1:length(bits)
  if bits(i)==0
    x((i-1)*n+1:i*n) = -1;
    lastbit = 1;
  else x((i-1)*n+1:i*n) = 1;
  end
end
x = (x + 1)*0.5;
sigma = 0.5;
rauschen = sigma * randn(size(t));
xr = x + rauschen;
fm_r = 10;  % Message Frequency
fs = 100*fc;
%t = 0:1/fs:4/x;
%m = sin(pi*fm_r*t)/(pi*fm_r*t);
m = sin(2*pi*fm_r.*t);
c = 0.5*square(2*pi*fc*t)+0.5;
mo = m.*c; % Modulation of PAM
if m==0
    mo=-1;
elseif m==1
    mo=1;
end   

disp(c);
disp(m);
subplot(4,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;

subplot(4,1,2);
plot(t,c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;

subplot(4,1,3);
plot(t,mo);
xlabel('Time');
ylabel('Amplitude');
title('Modulation of PAM Signal');
grid on;
