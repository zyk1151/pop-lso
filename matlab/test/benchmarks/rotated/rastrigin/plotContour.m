clear; clc;

% first, run the script called generateRotationMatrix.m, which is
% located in the same directory.

poPlotContour('poRotatedRastrigin', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    0 : 15 : 75);