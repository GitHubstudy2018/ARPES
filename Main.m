%clear all;
clc;
close all
global file_no sample dir;
dir;
sample = 'HA2';
file_no = '05';
[A,B] = LoadFile(); % load File from neupane\sample\x.ibw
setvariables(); % Set variables for data collection
B = B./max(B(:)); % Normalize plots
%%%%%%%%%%%%%%%%%%%
% Plots
%%%%%%%%%%%%%%%%%%%
EnergyContourPlot() % multiple panal energy contour
KX_Cuts()% KX cut plot
KY_Cuts()% Ky cut plot
FermiSurface(); %Fermi Surface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scan Plots
% %%%%%%%%%%%%%%%%%%%%%%%%%
% XY_Plot= figure('Position', get(0, 'Screensize'));
% slider_plot(B,Zlim,XY_Plot,3)
% XZ_Plot = figure('Position', get(0, 'Screensize'));
% slider_plot(B,Ylim,XZ_Plot,2)
% ZY_Plot = figure('Position', get(0, 'Screensize'));
% slider_plot(B,Xlim,ZY_Plot ,1)


    