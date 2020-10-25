clc;
clear all;

% Continuous / Anlog Sine wave  x(t) = sin(2*pi*f*t)
%
A = 1;
f = 1000;
T = 1/f;

%t = [0 : T/8 : 4*T];
t = [0 : T/80 : 4*T];

%sine_vect = A*sin((2*pi*f*t)+(pi/4));
sine_vect = A*sin((2*pi*f*t));

%figure(4); stem(t,sine_vect);xlabel('freq');ylabel('x(t)');
figure(1); plot(t,sine_vect);xlabel('t--->time');ylabel('x(t)');




% sampled / Digital sine wave
% x(nTs) = sin(2*pi*f*n*Ts) = sin(2*pi*Ts/T*n) = sin(2*pi*f/Fs*n) =  sin(2*pi*(1/N)*n)
% N = Fs/f = T/Ts

Fs = 2000;
Ts = 1/Fs;
N = T/Ts;
printf("N is %d %d %d\n",Fs/f,T/Ts,N);
n = [ 0 :  1 : 4*N];

sampled_sine_vect = A*sin((2*pi*(f/Fs)*n));

figure(2); stem(n,sampled_sine_vect);xlabel('n--->sample number');ylabel('x(n)');



%over sampled signal
Fs = 8000;
Ts = 1/Fs;
N = T/Ts;
n = [ 0 :  1 : 4*N];

sampled_sine_vect2 = A*sin((2*pi*(f/Fs)*n));

figure(3); stem(n,sampled_sine_vect2);xlabel('n--->sample number');ylabel('x(n)');



%under sampled signal
Fs = 800;
Ts = 1/Fs;
N = T/Ts;
n = [ 0 :  1 : 4*N];

sampled_sine_vect3 = A*sin((2*pi*(f/Fs)*n));

figure(4); stem(n,sampled_sine_vect3);xlabel('n--->sample number');ylabel('x(n)');



prompt = 'Do you want to close? Y/N [Y] ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end
close all;
