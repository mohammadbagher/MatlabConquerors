function X = jacobi(A, B, X)
    res = X;
	n = size(A, 1);
    for i  = 1 : n
        TMP = X;
        TMP(i) = 0;
        res(i) = B(i) - A(i,:) * TMP;
        res(i) = res(i) / A(i, i);
    end
    X = res;
end
