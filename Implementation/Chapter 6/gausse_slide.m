function X = gausse_slide(A, B, X)
    for i  = 1 : n
        TMP = X;
        TMP(i) = 0;
        X(i) = B(i) - A(i,:) * TMP;
        X(i) = X(i) / A(i, i);
    end
end
