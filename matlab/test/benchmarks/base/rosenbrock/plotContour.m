clear; clc;

poPlotContour('poRosenbrock', ...
    -2 : 0.01 : 2, ...
    -2 : 0.01 : 2, ...
    [0 2 .^ (0 : 2 : 12)]);
