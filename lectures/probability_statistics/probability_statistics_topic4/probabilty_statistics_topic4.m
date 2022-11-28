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
subplot(2,1,1);hold on
plot(true_set,'bo')
axis([1,M,xmin,xmax])
ylabel('Diameter (in)')
xlabel('True Set')
grid on


%% sample N ball bearings for quality control

N=100

% sample with a for loop and random integers
for i=1:N

    measured_set(i)=true_set(randi(M,1,1));

end


subplot(2,1,2)
plot(measured_set,'ro')
axis([1,N,xmin,xmax])
ylabel('Diameter (in)')
xlabel('Sample Set')
grid on
    
ms_num=ts_num;
fo_str=sprintf('topic4_measured_fig%d.png',ms_num);
set(gcf, 'Position', get(0, 'Screensize'));
print(fo_str,'-dpng')
    
    





% figure(4);
% histogram(measured_set,'BinLimits',[0,1],'BinWidth',bw)
% 
% plot(measured_set,zeros(1,N),'r.')
% 

