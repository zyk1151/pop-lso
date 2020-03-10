clear; clc;

% first, run the script called generateRotationMatrix.m, which is
% located in the same directory.

poPlotContour('poRotatedSphere', ...
    -100 : 0.5 : 100, ...
    -100 : 0.5 : 100, ...
    (0 : 20 : 120) .^ 2);