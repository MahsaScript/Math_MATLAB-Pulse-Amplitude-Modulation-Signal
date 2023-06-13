clc;
fc = 20;
% fm =2;
% fm = [ 0 0 1 0 1 1 0 ]';
fm = [ -1 -1 1 -1 1 1 -1]';
fs = 1000;
t=1;
n = [0:1/fs:t];

n = n(1:end-1);
dutycycle = 50;
s = square(2*pi*fc*n,dutycycle);
s(find(s<0))=0;   %to make it unipolar
%plot(s);

m = sin(2*pi*fm*n);
period_sam = length(n)/fc;     %to find the number of samples in one period
ind = 1:period_sam:length(n);   %to find the starting sample index
on_samp = ceil(period_sam * dutycycle/100);   %no. of samples in on period of time
pam = zeros(1,length(n));
for i =1:length(ind)
    pam(ind(i):ind(i)+on_samp) = m(ind(i));
end

subplot(1,1,1);
plot(n,pam);
ylim([-1.2 1.2]);