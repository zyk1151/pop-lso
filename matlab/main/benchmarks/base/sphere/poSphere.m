function y = poSphere(X)
% Benchmark Function: Sphere.
%
% Input ->
%   X : Population, specified as a matrix whose row and column size
%       equal function dimension and population size, respectively.
%       Each column of X denotes an independent individual in the population.
% Output <-
%   y : Fitness, specified as a row vector whose length is population size.
%       Each element of y is the fitness of each individual (column) of X.
y = sum(X .^ 2, 1);
end