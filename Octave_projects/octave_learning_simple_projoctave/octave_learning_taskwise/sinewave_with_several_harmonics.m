clc;
clear all;

% Continuous / Anlog Sine wave  with several frequency components
% x(t) = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*fm*t)
%
A1 = 1;
A2 = 2;
A3 = 1;

f1 = 1000;
f2 = 2000;
fm = 4000;
Tm = 1/fm;

fmin = min([f1,f2,fm]);

T = 1/f1;
t1 = [0 : T/80 : 4*T*(f1/fmin)];
sine_vect1 = (A1*sin(2*pi*f1*t1));

T = 1/f2;
t2 = [0 : T/80 : 4*T*(f2/fmin)];
sine_vect2 = (A2*sin(2*pi*f2*t2));

T = 1/fm;
t3 = [0 : T/80 : 4*T*(fm/fmin)];
sine_vect3 = (A3*sin(2*pi*fm*t3));

figure(1);
plot(t1,sine_vect1);
hold on;
plot(t2,sine_vect2);
plot(t3,sine_vect3);
grid on;
title('Sine Waves');

%figure(2); plot(t1,(sine_vect1 + sine_vect2 + sine_vect3));xlabel('t--->time');ylabel('x(t)');


t = [0 : Tm/80 : 4*Tm];
sine_vect = (A1*sin(2*pi*f1*t)) + (A2*sin(2*pi*f2*t)) + (A3*sin(2*pi*fm*t));
figure(2); plot(t,sine_vect);xlabel('t--->time');ylabel('x(t)');




% sampled / Digital sine wave
% Ts = 1/Fs;
% N = Fs/fm = Tm/Ts;
% x(nTs) = sin(2*pi*f1*n*Ts) + sin(2*pi*f2*n*Ts) + sin(2*pi*fm*n*Ts);




%Fs = 2*fm;
Fs = 14*fm;
Ts = 1/Fs;
N = Fs/fm;

printf("N is %d %d %d\n",Fs/fm,Tm/Ts,N);
n = [ 0 :  1 : 4*N];



sampled_sine_vect1 = A1*sin(2*pi*f1*n*Ts);

sampled_sine_vect2 = A2*sin(2*pi*f2*n*Ts);

sampled_sine_vect3 = A3*sin(2*pi*f2*n*Ts);

sampled_sine_vect =  sampled_sine_vect1 + sampled_sine_vect2 + sampled_sine_vect3;

figure(3); stem(n,sampled_sine_vect);xlabel('n--->sample number');ylabel('x(n)');




prompt = 'Do you want to close? Y/N [Y] ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end
close all;
