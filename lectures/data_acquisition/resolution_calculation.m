% ME3023, Measurements Mechanical Systems, TNTech
% Tristan Hill, October 30, 2024
% ADC Resolution Calculation - supporting code for activity
clear; close all;clc

% scalar solution (good starting place)
input_range_A=[0 200];  % input to sensor [psi]
input_range_B=[0 120];  

output_range_A=[0 3.0]; % output from sensor [v]
output_range_B=[0 0.5];

daq_range_A=[0 3.3];   % input to DAQ [v]
daq_range_B=[-10 10];

N_A=10; % DAQ A ADC bits
N_B=12; % DAQ B ADC bits

res_volt_A=(daq_range_A(2)-daq_range_A(1))/2^N_A
res_psi_A=(input_range_A(2)-input_range_A(1)) / (2^N_A* ( (output_range_A(2)-output_range_A(1)) / (daq_range_A(2)-daq_range_A(1) ) ) )

res_volt_B=(daq_range_B(2)-daq_range_B(1))/2^N_B
res_psi_B=(input_range_B(2)-input_range_B(1)) / (2^N_B* ( (output_range_B(2)-output_range_B(1)) / (daq_range_B(2)-daq_range_B(1) ) ) )


% vectorized solution 1, A:1, B:2  (element-wise compare only)
input_range=[0 200  % input to sensor [psi]
             0 120];  

output_range=[0 3.0 % output from sensor [v]
                0 0.5];

daq_range=[0 3.3   % input to DAQ [v]
            -10 10];

N=[10;12]; % DAQ ADC bits

res_volt=(daq_range(:,2)-daq_range(:,1))./2.^N
res_psi=(input_range(:,2)-input_range(:,1))./(2.^N.*((output_range(:,2)-output_range(:,1))./(daq_range(:,2)-daq_range(:,1) ) ) )



% vectorized solution 2, A:1, A:2, A:3, B:1, B:2, B:3,...  (full compare)
input_range=[0 200  % input to sensor [psi]
             0 120];  

output_range=[0 3.0 % output from sensor [v]
                0 0.5];

daq_range=[0 3.3   % input to DAQ [v] 
            -10 10
             0 10];

N=[10;12;12]; % DAQ ADC bits

for i=1:size(input_range,1)
    for j =1:size(daq_range,1)
        res_volt(i,j)=(daq_range(j,2)-daq_range(j,1))./2.^N(j);
        res_psi(i,j)=(input_range(i,2)-input_range(i,1))./(2.^N(j).*((output_range(i,2)-output_range(i,1))./(daq_range(j,2)-daq_range(j,1) ) ) );
    end
end

res_volt
res_psi