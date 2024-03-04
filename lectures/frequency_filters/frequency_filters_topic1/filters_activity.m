% ME3023/VE3500 - Tennessee Technological University
% Freqency filters demonstration - square wave + first order system

clear variables
clc 
close all

T=20  % period (sec)
f=1/T % frequency (hz)
w=2*pi*f

A=3

dt=.1
tstop=100
t=0:dt:tstop

y=square_wave(t,T,A)

% user defined function to make a square wave
function y = square_wave(t,T,A) 
    
    for i=1:length(t)
        if (t(i)>0) && (t(i)<T/2)
            y(i)=0;
        elseif (t(i)>T/2) && (t(i)<T)
            y(i)=A;
        end
    end

end