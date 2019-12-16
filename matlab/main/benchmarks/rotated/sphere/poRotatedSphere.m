function y = poRotatedSphere(X)
% Benchmark Function: Rotated Sphere.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal function dimension (F) and population size (P), respectively.
%       Each column of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a row vector whose length is population size.
%       Each element of y is the fitness of each individual (column) of X.
persistent poRotationMatrix;
funcDim = size(X, 1);
if isempty(poRotationMatrix) || any(size(poRotationMatrix) ~= [funcDim funcDim])
    poRotationMatrix = poLoadRotationMatrix('poSphere', funcDim);
end
y = poSphere(poRotationMatrix * X);
end
