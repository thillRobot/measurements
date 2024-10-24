% sensorlogger data analysis
% ME3023 - TNTech 
% Tristan Hill - Fall 2024
% This script will 
% 1) load location data from a CSV file created by Sensor Logger app
% 2) show the latitude, longitude, and altitude data vs. sample # 
% 3) show the latitude, longitude, and altitude data vs. time 
% 4) show the latitude vs. longitude data
% 5) show the latitude vs. longitude vs. elevation data

clear; close all; clc
format long

% Step1) load the data from location CSV file
location=readtable('example0/Location.csv'); % choose directory and filename

% make an array copy from the table (struct) field for lat, lon, and alt
lat=location.latitude; % nx1 copies of each field
lon=location.longitude;
alt=location.altitude;
time=location.seconds_elapsed-location.seconds_elapsed(1); % get the time data and shift to zero

n=length(lat);

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

% Step2) graph the latitude, longitude and altitude in a subplot vs time 
figure(2)
subplot(3,1,1)
plot(time,lat,'x')
xlabel('Sample Number')
ylabel('Latitude [deg]')
grid on

subplot(3,1,2)
plot(time,lon,'x')
xlabel('Sample Number')
ylabel('Longitude [deg]')
grid on

subplot(3,1,3)
plot(time,alt,'x')
xlabel('Sample Number')
ylabel('Altitude [m]')
grid on

% step3) latitude, longitude 
figure(3)
plot(lat,lon,'x')
xlabel('Latitude [deg]')
ylabel('Longitude [deg]')
grid on

% step4) latitude, longitude 
figure(4)
plot3(lat,lon,alt,'x')
xlabel('Latitude  [deg]')
ylabel('Longitude [deg]')
zlabel('Altitude  [m]')
grid on


