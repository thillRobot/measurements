%%
%  ME3023 - mech meas sys 
%  Tristan Hill - March 12, 2018 - November 03, 2020 
%  Probability and Statistics - Quiz 11 - Part 1
%%

clear variables
close all
clc

%% Suppose a ball bearing factory makes M ball bearings 
% generate random data sets
M=100000;  % total bearings made 

ts_num=1;
ts_str=sprintf('true_set%d',ts_num);

dia=0.5; % nominal mean of the bearings
x_bar=dia;
sigma=.001;

% true_set=normrnd(dia,sigma,1,M);



% save(ts_str,'true_set') 

ts_data=load(ts_str,'true_set');
true_set=ts_data.true_set;

%% show the data for each sample
xmin=min(true_set);
xmax=max(true_set);
dx=0.0005;

figure(1)
subplot(2,1,1);hold on
plot(true_set,'b.')
axis([1,M,xmin,xmax])
grid on

tstr=sprintf('True Set %d',ts_num);

fstr=sprintf('true_set%d',ts_num);

k=1;
fid=fopen(fstr,'w');
for i=1:50
    for j=1:20
        fprintf(fid,'%.4f ',true_set(k));
        k=k+1;
    end
    fprintf(fid,'\n');
end
title(tstr)




%% sample N ball bearings for quality control


for ms_num=1:4
    ms_str=sprintf('measured_set%d',ms_num);

    num_samples=[10 100 1000 10000];

    N=num_samples(ms_num);


    % sample with a for loop and random integers
    for i=1:N

        measured_set(i)=true_set(randi(M,1,1));

    end

    save(ms_str,'measured_set')

    % or use a pre-sampled set from a file
    % ms_data=load(ms_str,'measured_set')
    % measured_set=ms_data.measured_set;

%     subplot(2,1,2)
%     plot(measured_set,'r.')
%     axis([1,N,xmin,xmax])
%     grid on

%     tstr=sprintf('Measured Set %d',ms_num);
%     title(tstr)

%     fo_str=sprintf('topic2_measured_fig%d.png',ms_num);
%     set(gcf, 'Position', get(0, 'Screensize'));
%     print(fo_str,'-dpng')
    %% show as a frequency histogram

    % K=1.87*(N-1)^0.40+1;
    K=N^0.5;
    % bw=(max(measured_set)-min(measured_set))/K;

    figure(ms_num);
    sgstr=sprintf('Frequency Histogram - Number of Samples: %.0f',N)    
    sgtitle(sgstr)
    
    for bw_num=1:5

        bw=[.005 .001 .0005 .0001 .00005]; % bin width
        hh=[10 8  5  3  2
            70 40 25 10 6
            600 400 300 75 40
            6000 4000 2000 500 300]; % histogram plot height

        
        subplot(5,1,bw_num)
        histogram(measured_set,'BinWidth',bw(bw_num))

        % % axis 1 is the time plot
        % ax1 = axes('Parent',f,'Units','normalized','Position',[.2 .6 .6 .3]);
        % grid(ax1,'on')
        % set(ax1,'XLim',[0,10],'YLim',[-.2,.2])



        grid on
        % axis([xmin xmax 0 hh(ms_num,bw_num)])
        ylim([0 hh(ms_num,bw_num)])
        set(gca,'XTick',xmin:dx:xmax)

        lstr=sprintf('measured variable, x (in) - Bin Width: %0.5f',bw(bw_num))
        xlabel(lstr)
        ylabel('number of samples')

        
%         title(tstr,'position',[1 1])
        %title(tstr)    

        set(gcf, 'Position', get(0, 'Screensize'));
        % axis equal
        %print(fo_str,'-dpng')
    end
    fo_str=sprintf('topic2_histogram_fig%d.png',ms_num)
    print(fo_str,'-dpng')
    
    
    
        figure(10);hold on
        plot(measured_set,'bo')
        axis([1,N,xmin,xmax])
        xlabel('Sample Number')
        ylabel('Measured Variable')
        grid on

        fo_str=sprintf('topic2_measured_fig%d.png',ms_num);
        set(gcf, 'Position', get(0, 'Screensize'));
        print(fo_str,'-dpng')
    
    
end
%% show as a probabilty density function
figure(5); hold on

K=1.87*(N-1)^0.40+1;
% K=N^0.5;
bw=(max(measured_set)-min(measured_set))/K;

x=linspace(0,1,10000);
for k=1:length(x)

    p(k)=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x(k)-x_bar)^2/sigma^2);
    
end


plot(x,p)

grid on
axis([0.495 0.505 0 250])
set(gca,'XTick',xmin:dx:xmax)

p_sig0=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar-x_bar)^2/sigma^2);
plot([x_bar x_bar],[0 p_sig0]) 

p_sig1=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar+sigma-x_bar)^2/sigma^2);
plot([x_bar+sigma x_bar+sigma],[0 p_sig1],'-')

p_sig1=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar+2*sigma-x_bar)^2/sigma^2);
plot([x_bar+2*sigma x_bar+2*sigma],[0 p_sig1],'-')









% figure(4);
% histogram(measured_set,'BinLimits',[0,1],'BinWidth',bw)
% 
% plot(measured_set,zeros(1,N),'r.')
% 

