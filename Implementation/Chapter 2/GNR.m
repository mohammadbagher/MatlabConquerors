function result = GNR( n , F , X , step )
%GNR generalized newton-raphson method for solving a system of 
%       non-linear equations.
%       
%   Detailed explanation goes here
% TODO
names = regexp(sprintf('a%d/',1:n),'/','split');
syms(names{1:end-1})

for i=1:n
    funs(1,i) = sym(F(1,i));
end



for i=1:n
    for j=1:n
        D(i,j) = diff(funs(1,i),sym(strcat('a',num2str(j))));
    end
end
    
for i=1:n
    Dizi(:,:,i) = D;
    for j=1:n
        Dizi(j,i,i) = -funs(1,j);
    end
end

approx= X;
for i=1:step
    for j=1:n
        dumb(:,:)=Dizi(:,:,j);
        comb=D;
        for row=1:n
            for col=1:n
                for jitvit=1:n
                    dumb(row,col)=subs(dumb(row,col),sym(strcat('a',num2str(jitvit))),approx(1,jitvit));
                    comb(row,col)=subs(comb(row,col),sym(strcat('a',num2str(jitvit))),approx(1,jitvit));
                end
            end
        end
%        approx(1,j)
%        det(dumb)
%       det(comb)
        approx(1,j)=vpa(sym(approx(1,j))+ det(dumb)/det(comb));
    end
end
for i=1:n
    result(i,1)=approx(1,i);
end

end