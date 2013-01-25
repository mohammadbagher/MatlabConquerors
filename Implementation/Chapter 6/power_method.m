function [X, c] = power_method(A, X)
    X = A * X;
    c = max(X);
    X = X / c;
end
