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

figure(1);hold on
% subplot(2,1,1);hold on
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





% figure(4);
% histogram(measured_set,'BinLimits',[0,1],'BinWidth',bw)
% 
% plot(measured_set,zeros(1,N),'r.')
% 

