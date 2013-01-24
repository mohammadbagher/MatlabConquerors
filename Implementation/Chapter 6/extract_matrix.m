function [result1, result2] = extract_matrix(n, eqs)
    A = [];
    B = [];
    for i = 1 : n
        eval(['a',num2str(i), ' = 0;']);
    end
    for i = 1 : n
        res = strread(cell2mat(eqs(i)),'%s','delimiter','=');
        eqs(i) = res(1);
        B = [B;eval(cell2mat(res(2)))];
        TMP = [];
        for j = 1 : n
            eval(['a',num2str(j), ' = 1;']);
            TMP(end + 1) = eval(cell2mat(eqs(i)));
            eval(['a',num2str(j), ' = 0;']);
        end
        A = [A;TMP];
    end
    result1 = A;
    result2 = B;
end
