function [result1, result2] = gausse_elimination(n, eqs)
    [A, B] = extract_matrix(n, eqs);
    X = (eye(size(A, 1)) / A) * B;
    A = [A, B];
    Step = {};
    Step(end+1) = mat2cell(A);
    for i = 1 : n
        one = -1;
        for j = i : n
            if(A(j, i) ~= 0)
                one = j;
            end
        end
        if(one == -1)
            sprintf('terkidam! infinity javab dare.');
            return;
        end
        TMP = A(i,:);
        A(i,:) = A(one,:);
        A(one,:) = TMP;
        for j = i + 1 : n
            if(A(j, i) ~= 0)
                TMP = A(i,:) / A(i, i);
                TMP = A(j, i) * TMP;
                A(j,:) = A(j,:) - TMP;
            end
        end
        Step(end+1) = mat2cell(A);
    end
    result1 = X;
    result2 = Step;
end

