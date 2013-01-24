function X = gausse_slide(n, eqs, X)
    [A, B] = extract_matrix(n, eqs);
    for i  = 1 : n
        TMP = X;
        TMP(i) = 0;
        X(i) = B(i) - A(i,:) * TMP;
        X(i) = X(i) / A(i, i);
    end
end
