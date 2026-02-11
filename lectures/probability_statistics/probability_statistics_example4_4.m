% me3023 
% example problem - finite sized datasets
clear variables; clc; close all

x=[0.4992, 0.5003, 0.4980, 0.5014, 0.4987,...
    0.4997, 0.5018, 0.4991, 0.4995, 0.4992,...
    0.4986, 0.5014, 0.5004, 0.4988, 0.5010,... 
    0.4983, 0.5030, 0.4988, 0.5012, 0.5003]

% x=[0.98 1.02 1.07 1.26 0.86 1.08 1.16 1.02 0.96 0.94 ...
%     0.68 1.11 1.34 0.99 1.04 0.78 1.21 1.06 0.86 0.96];

% part 1 - find sample mean, sample standard deviation
xbar=mean(x) % sample mean
N=length(x)
nu=N-1
sx=(1/(N-1)*sum((x-xbar).^2))^(1/2) % sample standard deviation

% part 2 - interval in which 95% of population expected to lie
t_19_95=2.093
xi_lower = xbar-(t_19_95*sx)
xi_upper = xbar+(t_19_95*sx)

% part 3 - interval in which true mean expected at 95% prop level
sxbar=sx/sqrt(N)
xprime_lower=xbar-t_19_95*sxbar
xprime_lower=xbar+t_19_95*sxbar