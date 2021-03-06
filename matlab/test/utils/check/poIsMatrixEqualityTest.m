clear; clc;

%% true (1)
disp(poIsMatrixEquality(1, 1));
disp(poIsMatrixEquality(ones(1, 2), ones(1, 2)));
disp(poIsMatrixEquality(ones(3, 1), 1e-13 + ones(3, 1)));
disp(poIsMatrixEquality(ones(3, 4), ones(3, 4) - 1e-2, 1e-1));
disp(poIsMatrixEquality(0, 0, 0));

%% false (0)
disp(poIsMatrixEquality(1, 1e-6 + 1));
disp(poIsMatrixEquality(ones(1, 2), 1e-11 + ones(1, 2)));
disp(poIsMatrixEquality(ones(3, 4), ones(3, 4) - 1e-2, 1e-3));

%% `size(A)` should equal `size(B)`.
disp(poIsMatrixEquality(ones(2, 3), ones(3, 2)));

%% the input `tol` should be a non-negative scalar.
disp(poIsMatrixEquality(1, 1, -1));
