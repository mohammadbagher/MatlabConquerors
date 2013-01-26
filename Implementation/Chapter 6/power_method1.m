function [X, c] = power_method1(A, X)
    X = (A * X);
    c = max(X);
    X = X / c;
end
