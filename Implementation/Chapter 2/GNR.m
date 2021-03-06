function result = GNR( F , X , max_step ,mantissa)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
format long;
n=size(F,1);
k = F;
for i=1:n
    F(1,i)=k(i,1);
end
k = X;
for i=1:n
    X(1,i)=k(i,1);
end

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
for i=1:max_step
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
        for row=1:n
            for col=1:n
                for jitvit=1:n
                    dumb(row,col)=subs(dumb(row,col),sym(strcat('a',num2str(jitvit))),approx(1,jitvit));
                    comb(row,col)=subs(comb(row,col),sym(strcat('a',num2str(jitvit))),approx(1,jitvit));
                end
            end
        end
        approx(1,j)=vpa(sym(approx(1,j)))+det(dumb)/det(comb);
    end
end
for i=1:n
    result(i,1)=vpa(approx(1,i),mantissa);
end

end

