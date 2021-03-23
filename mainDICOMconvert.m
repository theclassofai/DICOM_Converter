% Conert DICOM images from any of the formats:png,bmp,jpg,gif

% Code by @TheClassofAI 
% contact: theclassofai@gmail.com 
% Date: 21/03/2021
% Last updated: 22/03/2021
% This code has been slightly modified version of the code from Rance Tino https://uk.mathworks.com/matlabcentral/profile/authors/8183651

%%
close all;
clc;
clear all;

%% Choose image output type: png,bmp,jpg,gif
imgTypeOut = 'png';
pathout = ['/' imgTypeOut '/'];% output directory

%% Read Current folder
pwd
currentFolder = pwd; % Get current path (working directory)
pathin = '/DICOM/'; % data directory
pathin = fullfile(currentFolder,pathin); % combine path
pathindir = '/DICOM/*.DCM'; % search specific data type (*.DCM)
pathindir = fullfile(currentFolder,pathindir);% combine path
pathout=fullfile(currentFolder,pathout);
if ~exist(pathout, 'dir')
    mkdir(pathout);
end

Files=dir(pathindir);
for k=1:length(Files)
   FileNames=Files(k).name
   filename = fullfile(pathin, FileNames);
   outfileName = strrep(FileNames,'DCM', imgTypeOut);
   outname = fullfile(pathout,outfileName);
   dicom2image(filename, imgTypeOut, outname)
end

close all;

