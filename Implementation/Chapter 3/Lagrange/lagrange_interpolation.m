function[func,x_ans] = lagrange_interpolation(x,y,x_request,axes)
X=x;
Y=y;
n=length(X);
l = zeros(n);

% computing L matrice, so that each row i holds the polynom L_i
% Now we compute li(x) for i=0....n  ,and we build the polynomial 
plot(axes,x,y,'or');hold on;
x_req=x_request;
for k=1:n                    
    makhraj = 1;    
    surat= 1;
    for index = 1:n
        if(index ~= k)
            surat= surat*(x_req-x(index));
            makhraj = makhraj * (X(k) - X(index));
        end
    end
   l(k)=surat/makhraj;
end
y_req=0;
for j=1:n
    y_req=y_req+l(j)*Y(j);
end
x_ans=y_req;
plot(axes,x_req,y_req,'+');


    
%%%%%%%func
l = sym(zeros(n));
vorudi=sym('x');
for k=1:n                    
    makhraj = 1;    
    surat= 1;
    for index = 1:n
        if(index ~= k && X(index) ~= X(k))
            surat= surat*(vorudi-x(index));
            makhraj = makhraj *(X(k) - X(index));
        end
    end
   l(k)=vpa(sym(surat)/sym(makhraj));
end
func=0;
for j=1:n
    func=func+l(j)*Y(j);
end
func=expand(func);
hnew=(x(2)-x(1))/10;
x=min(x):hnew:max(x);
 plot(x,eval(func));
 hleg1 = legend('requestpoint','firstpoints','newtonforwardinterpolation');
 xlabel('points');
ylabel('approximations');
end


