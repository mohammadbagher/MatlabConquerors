function[y_req] = lagrange_interpolation(x,y,x_request)
X=x;
Y=y;
n=length(X);
l = zeros(n);

% computing L matrice, so that each row i holds the polynom L_i
% Now we compute li(x) for i=0....n  ,and we build the polynomial 

x_req=x_request;
for k=1:n                    
    makhraj = 1;    
    surat= 1;
    for index = 1:n
        if(index ~= k && X(index) ~= X(k))
            surat= surat*(x_req-x(index));
            makhraj = makhraj * ((X(k) - X(index))^-1);
        end
    end
   l(k)=surat/makhraj;
end
y_req=0;
for j=1:n
    y_req=y_req+l(j)*Y(j);
end
plot(x_req,y_req,'+');hold on;

x_sample=X(1):1/(10*n):X(n);
for h=1:length(x_sample)
   x_req=x_sample(h);
for k=1:n                    
    makhraj = 1;    
    surat= 1;
    for index = 1:n
        if(index ~= k && X(index) ~= X(k))
            surat= surat*(x_req-x(index));
            makhraj = makhraj * ((X(k) - X(index))^-1);
        end
    end
   l(k)=surat/makhraj;
end
y_req=0;
for j=1:n
    y_req=y_req+l(j)*Y(j);
end
plot(x_req,y_req,'--'); 
end
for g=1:n
    plot(X(g),Y(g),'or');
end

end


