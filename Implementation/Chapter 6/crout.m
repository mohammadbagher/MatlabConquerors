function [X, L, U] = crout(n, eqs)
    [A, B] = extract_matrix(n, eqs);
    X = (eye(size(A, 1)) / A) * B;
    setup.type = 'crout';
    %setup.udiag = 1;
    [L, U] = ilu(sparse(A), setup);
    L = full(L);
    U = full(U);
end
