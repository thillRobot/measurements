% ME3023/VE3500 - Tennessee Technological University
% Freqency filters demonstration - square wave + first order system

clear variables
clc 
close all

T=[16 8 4 2]  % period (sec)
T_len=length(T)
f=1./T % frequency (hz)
w=2*pi*f

A=1

dt=.01
tstop=25
t=0:dt:tstop
t_len=length(t)

for k=1:T_len
    k
    tmp=square_wave(t,T(k),A);
    y(k,:)=tmp(1:t_len-1)
end

figure(1);hold on
for k=1:T_len
    subplot(T_len,1,k)
    plot(t(1:length(y)),y(k,:),'k.-')
    grid on
    axis([0 tstop -.2*A 1.2*A])
    xlabel('Time (sec)')
    ylabel('Amplitude (volt)')
    tstr=sprintf('Square Wave - A: %.1f(volt), f: %.1f(Hz)',A,f(k));
    title(tstr)
end

% user defined function to make parameterized square wave data
function y = square_wave(t,T,A) 

    % T_idx=0; % index for tracking period

    for i=1:length(t)
        N=floor(t(i)/T); % find the current period
        tdiff=t(i)-N*T;  % time from start of current period

        if (tdiff>0) && (tdiff<=T/2) % first half of period
            y(i)=0;
        elseif (tdiff>T/2) && (tdiff<=T) % second half of period
            y(i)=A;
        end
        
    end
    size(y)
    
end