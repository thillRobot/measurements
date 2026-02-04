%%
%  ME3023 - mech meas sys 
%  Tristan Hill - March 12, 2018 - November 03, 2020 
%  Probability and Statistics - Quiz 11 - Part 1
%%

clear variables;close all;clc

%% Suppose a ball bearing factory makes M ball bearings 
% generate random data sets
M=10000;  % total bearings made 

ts_num=1;
ts_str=sprintf('true_set%d',ts_num);

dia=0.5; % nominal mean of the bearings
x_bar=dia;
sigma=.001;

% true_set=rand(1,M); % generate uniform random data for comparison
true_set=normrnd(dia,sigma,1,M);

%% show the data for each sample
xmin=min(true_set);
xmax=max(true_set);
dx=0.0005;

figure(1)
subplot(2,1,1);hold on
plot(true_set,'b.')
axis([1,M,xmin,xmax])
grid on


%% show as a histogram
N=M
% K=1.87*(N-1)^0.40+1;
K=sqrt(N)
% K=1+log2(N)
% K=N^0.5;
% K=26
bw=(max(true_set)-min(true_set))/K;
subplot(2,1,2) ; hold on
histogram(true_set,'BinLimits',[0,1],'BinWidth',bw)
% 
% plot(measured_set,zeros(1,N),'r.')
% 

axis([0.495 0.505 0 500])

%% show as a probabilty density function


x=linspace(0,1,10000);
for k=1:length(x)

    p(k)=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x(k)-x_bar)^2/sigma^2);

end

% subplot(2,1,3); hold on
plot(x,p)

p_sig0=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar-x_bar)^2/sigma^2)
plot([x_bar x_bar],[0 p_sig0]) 

p_sig1=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar+sigma-x_bar)^2/sigma^2);
plot([x_bar+sigma x_bar+sigma],[0 p_sig1],'-')
 
p_sig1=1/(sigma*(2*pi)^0.5)*exp(-1/2*(x_bar+2*sigma-x_bar)^2/sigma^2);
plot([x_bar+2*sigma x_bar+2*sigma],[0 p_sig1],'-')

axis([0.495 0.505 0 500])
set(gca,'XTick',xmin:dx:xmax)
grid on




