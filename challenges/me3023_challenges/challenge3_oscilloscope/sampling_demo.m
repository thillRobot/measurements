% ME3023 - Tennessee Technological University
% Tristan Hill - October 10, 2019 - April 14, 2021 - September 15, 2021
% Data Acquisition Topic 3 - Sampling and Aliasing
clear variables; close all; clc

% simulate a continuous signal
A1=5; f1=3;
w1=2*pi*f1;
dt_sim=0.001; t_stop=6;
t_sim=0:dt_sim:t_stop;
y_sim=A1*sin(w1*t_sim);

% simulate sampling the signal
dt_sam = 0.3;
t_sam=0:dt_sam:t_stop;
y_sam=A1*sin(w1*t_sam);
% show the figure
figure(1); hold on
plot(t_sim,y_sim,'-',t_sam,y_sam,'o')
axis([0 t_stop -1.2*A1 1.2*A1])
xlabel('Time(s)');ylabel('Amplitude')
title('Data Acquisition - Sampling Demo')
grid on