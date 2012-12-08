function [func,x_ans] = nbwp(X,Y,X_request,axes)
x = X; y = Y;
n = length(x);

if length(x) ~= length(y)
error('X and Y must have the same dimension')

end

% inserting x into 1st column of DD-table
DD(1:length(x),1) = x;

% inserting y into 2nd column of DD-table

DD(1:length(y),2) = y;
% creates newton difference coefficients

for j = 1:n-1

 for k = 1:n-j % j goes from 1 to n-1

 DD(k,j+2) = (DD(k+1,j+1)-DD(k,j+1));

 end

end

h=x(2)-x(1);
x_req=X_request;

r =(x_req-x(n))/h; 
y_req=y(n);
prod=1;
 for j=0:n-2
     prod=prod*((r+j)/(j+1));
     y_req=y_req+prod*DD(n-j-1,j+3);
 end
 
x_ans=y_req;
plot(axes,x_req,y_req,'+');hold on;


 plot(axes,x,y,'or');
%%%%%%%%%%%func
x_req=sym('x');
r =sym((x_req-x(n))/h); 
y_req=y(n);
prod=sym(1);
 for j=0:n-2
     prod=prod*(r+j)/(j+1);
     y_req=sym(y_req+prod*DD(n-j-1,j+3));
 end
func=expand(y_req);
x=min(x):.1:max(x);
 plot(x,eval(func));
 hleg1 = legend('requestpoint','firstpoints','newtonbackwardinterpolation');
 xlabel('points');
ylabel('approximations');
end

