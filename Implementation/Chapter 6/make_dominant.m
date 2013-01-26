function [result1, result2, B] = make_dominant(n, eqs)
    [A, B] = extract_matrix(n, eqs);
    result1 = is_dominant(A);
    result2 = A;
    if(result1)
        return;
    end
    A = [A, B];
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
        for j = 1 : n
            if(i~= j && A(j, i) ~= 0)
                TMP = A(i,:) / A(i, i);
                TMP = A(j, i) * TMP;
                A(j,:) = A(j,:) - TMP;
            end
        end
        if(is_dominant(A))
            B = A(:,n+1);
            A(:,n+1) = [];
            result2 = A;
            return;
        end
    end
end

function result = is_dominant(A)
    n = size(A, 1);
    result = true;
    A
    for i = 1 : n
        sumrem = 0;
        sumdiag = 0;
        for j = 1 : n
            if(i == j)
                sumdiag = sumdiag + abs(A(i,j));
            else
                sumrem = sumrem + abs(A(i, j));
            end
        end
        sumrem
        sumdiag
        n
        if(sumrem >= sumdiag)
            result = false;
        end
    end
end

