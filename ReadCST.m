%% Import data from text file.
% Script for importing data from the following text file:
%
%    D:\Array10GHz\ROTMAN_10GHz\Processing\Epl-Micr_CST.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2022/10/10 17:18:58

% clear
% close all
%% Initialize variables.
% filename = 'D:\Array10GHz\ROTMAN_10GHz\Processing\Epl-Micr_CST.csv';

function E_CST = ReadCST(filename)
startRow = 3;

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%8f%16f%21f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Create output variable
E_CST = table(dataArray{1:end-1}, 'VariableNames', {'Theta','Phi','AbsE'});

%% Clear temporary variables
clearvars filename startRow formatSpec fileID dataArray ans;
% 
% E_EplaneCST = cat(1,EplMicrCST.AbsE(181:end),EplMicrCST.AbsE(1:180));
% theta = deg2rad(linspace(1,360,360));
% figure;polarplot(theta,EplMicrCST.AbsE);rlim([-25 20])