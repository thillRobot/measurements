% location_example.m
% ME3023 - TNTech - Tristan Hill - Fall 2024
% This script will 
% 1) load location data from a CSV file created by Sensor Logger app
% 2) show the latitude, longitude, and altitude data vs. sample # 
% 3) show the latitude vs. longitude data

clear; close all; clc

% Step1) load the data from location CSV file
location=readtable('example0/Location.csv'); % choose directory and filename

% make an array copy from the table (struct) field for lat, lon, and alt
lat=location.latitude; % nx1 copies of each field
lon=location.longitude;
alt=location.altitude;
time=location.seconds_elapsed-location.seconds_elapsed(1); % get the time data and shift to zero

n=length(lat); % number of data points

% Step2) graph the latitude, longitude and altitude in a subplot vs sample # (by index)
figure(1)
subplot(3,1,1)
plot(lat,'x')
xlabel('Sample Number')
ylabel('Latitude [deg]')
grid on

subplot(3,1,2)
plot(lon,'x')
xlabel('Sample Number')
ylabel('Longitude [deg]')
grid on

subplot(3,1,3)
plot(alt,'x')
xlabel('Sample Number')
ylabel('Altitude [m]')
grid on

% step3) show latitude vs. longitude 
figure(2)
plot(lat,lon,'x')
xlabel('Latitude [deg]')
ylabel('Longitude [deg]')
grid on
