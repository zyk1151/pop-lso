clear; clc;

% first, run the script called generateShiftVector.m, which is
% located in the same directory.

poPlotContour('poShiftedDiscus', ...
    -5 : 0.05 : 5, ...
    -5 : 0.05 : 5, ...
    1e6 * (0 : 1 : 9) .^ 2);
