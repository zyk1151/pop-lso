clear; clc;

%%
names = {'poRotatedShiftedSphere', 'poRotatedShiftedRosenbrock', 'poRotatedShiftedSchwefel221', ...
    'poRotatedShiftedEllipsoid', 'poRotatedShiftedCigar', 'poRotatedShiftedDiscus', ...
    'poRotatedShiftedAckley', 'poRotatedShiftedGriewank', 'poRotatedShiftedRastrigin'};
levels = {(0 : 10) .^ 2, ...
    [0 2 .^ (0 : 2 : 16)], ...
    0 : 1 : 5, ...
    1e6 * (0 : 0.5 : 5) .^ 2, ...
    1e6 * (0 : 0.5 : 5) .^ 2, ...
    1e6 * (0 : 0.5 : 5) .^ 2, ...
    0 : 2 : 14, ...
    0 : 0.2 : 2, ...
    0 : 15 : 75};

for f = 1 : length(names)
    figure(f);
    poPlotContour(names{f}, ...
        -5 : 0.1 : 5, ...
        -5 : 0.1 : 5, ...
        levels{f});
end
