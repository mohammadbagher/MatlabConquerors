function result = valid_equation(n, eqs)
    [A, B] = extract_matrix(n, eqs);
    if(det(A) == 0)
        result = false;
    else
        result = true;
    end
end
