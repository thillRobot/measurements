% ME3023/VE3500 - Tennessee Technological University
% Tristan Hill - March 03, 2024
% Freqency filters demonstration - square wave + first order system

clear variables;clc;close all

T=[16 8 4 2];  % range of period values(sec)
T_len=length(T); % number of period values
f=1./T;   % frequency (hz)
w=2*pi*f; % frequency (radians/sec)

A=1; % amplitude of the square wave

dt=.01;  % timestep
tstop=20;  % stop time
t=0:dt:tstop; % range of time values
t_len=length(t); % number of time values

% generate the data for the square waves
for k=1:T_len
    tmp=square_wave(t,T(k),A);
    vs(k,:)=tmp(1:t_len-1); % just keep all but the last to avoid rounding issue
    [tmpx,tmpe] =rc_square_response(t,T(k),A);
    vc(k,:)=tmpx(1:t_len-1); % just keep all but the last to avoid rounding issu
    err(k,:)=tmpe(1:t_len-1);
end

% show the data in a subplot 
% (this could all be done in a single loop but this makes it easier to see)
figure(1);hold on
for k=1:T_len
    subplot(T_len,1,k);hold on
    plot(t(1:length(vs)),vs(k,:),'k.-')
    plot(t(1:length(vc)),vc(k,:),'b.-')
    plot(t(1:length(err)),err(k,:),':')
    grid on
    axis([0 tstop -.2*A 1.2*A])
    xlabel('Time (sec)')
    ylabel('Amplitude (volt)')
    tstr=sprintf('Square Wave %d - A: %.1f(volt), f: %.1f(Hz)',k,A,f(k));
    title(tstr)
    if(k==1)
        legend('vs - source voltage', 'vc - capacitor voltage', 'err - error fraction')
    end
end

% user defined function to generate parameterized square wave data
function x = square_wave(t,T,A) 

    for i=1:length(t)
        N=floor(t(i)/T); % find the current period
        tdiff=t(i)-N*T;  % time from start of current period

        if (tdiff>=0) && (tdiff<T/2) % first half of period
            x(i)=A;
        elseif (tdiff>+T/2) && (tdiff<T) % second half of period
            x(i)=0;
        end
        
    end

end

% use defined function to generate RC circuit response
% (use the same period and tdiff from square_wave)
function [x,gam] = rc_square_response(t,T,A)
     
    tau=1;    
    t_len=length(t);
    % T_len_mid=floor(t_len/2)
    gam1=0; % these must be seeded zero
    gam2=0;
    for i=1:t_len
        N=floor(t(i)/T); % find the current period
        tdiff=t(i)-N*T;  % time from start of current period
        
        if (tdiff>=0) && (tdiff<T/2) % first half of period
            % x(i)=0;
            xs=A;  %+gam2(length(gam2));
            x0=0-gam2;
            x(i)=(x0-xs)*exp(-tdiff/tau)+xs;
            gam(i)=(xs-x(i));
            gam1=gam(i); % record the last error val
        elseif (tdiff>=T/2) && (tdiff<=T) % second half of period
            % x(i)=A;
            %gam(t_len_mid)
            xs=0;
            x0=A-gam1;
            x(i)=(x0-xs)*exp(-(tdiff-T/2)/tau)+xs;
            gam(i)=xs-x(i);
            gam2=gam(i); % record the last error val
        end
       
    end
    % gam=[gam1 gam2]
end

