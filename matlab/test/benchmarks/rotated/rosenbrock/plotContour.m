clear; clc;

% first, run the script called generateRotationMatrix.m, which is
% located in the same directory.

poPlotContour('poRotatedRosenbrock', ...
    -2 : 0.01 : 2, ...
    -2 : 0.01 : 2, ...
    [0 2 .^ (0 : 2 : 12)]);
