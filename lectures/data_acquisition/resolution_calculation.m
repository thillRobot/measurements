
close all;clc

%
input_range_A=[0 200]
input_range_B=[0 120]

output_range_A=[0 3.0]
output_range_B=[0 0.5]

daq_range_A=[0 3.3];
daq_range_B=[0 10];


N_A=10
N_B=12

res_volt_A=(daq_input_range_A(2)-daq_input_range_A(1))/2^N_A
res_psi_A=(input_range_A(2)-input_range_A(1)) / (2^N_A* ( (output_range_A(2)-output_range_A(1)) / (daq_range_A(2)-daq_range_A(1) ) ) )

res_volt_A=(daq_input_range_B(2)-daq_input_range_B(1))/2^N_B
res_psi_B=(input_range_B(2)-input_range_B(1)) / (2^N_B* ( (output_range_B(2)-output_range_B(1)) / (daq_range_B(2)-daq_range_B(1) ) ) )

