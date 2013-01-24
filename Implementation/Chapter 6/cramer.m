function [result1, result2] = cramer(n, eqs)
    [A, B] = extract_matrix(n, eqs);
    Det = [];
    X = [];
    for i = 1 : n
        TMP = A;
        TMP(:,i) = B;
        Det(end + 1) = det(TMP);
        X(end+1) = det(TMP) / det(A);
    end
    result1 = X;
    result2 = Det;
end
