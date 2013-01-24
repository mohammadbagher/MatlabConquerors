function X = jacobi(n, eqs, X)
    [A, B] = extract_matrix(n, eqs);
    res = X;
    for i  = 1 : n
        TMP = X;
        TMP(i) = 0;
        res(i) = B(i) - A(i,:) * TMP;
        res(i) = res(i) / A(i, i);
    end
    X = res;
end
