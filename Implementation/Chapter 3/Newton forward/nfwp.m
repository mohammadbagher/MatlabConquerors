function [func,x_ans] = nfwp(X,Y,X_request,axes)
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

r =(x_req-x(1))/h; 
y_req=y(1);
prod=1;
 for j=0:n-2
     prod=prod*((r-j)/(j+1));
     y_req=y_req+prod*DD(1,j+3);
 end
 
x_ans=y_req;
plot(axes,x_req,y_req,'+');hold on;
x_sample=x(1):h/10:x(n);
for k=2:length(x_sample)
x_req=x_sample(k);
r =(x_req-x(1))/h; 
y_req=y(1);
prod=1;
 for j=0:n-2
     prod=prod*(r-j)/(j+1);
     y_req=y_req+prod*DD(1,j+3);
 end


plot(axes,x_req,y_req,'--');
end

for i = 1:n

 plot(axes,x(i),y(i),'or');
end
%%%%%%%%%%%%%%%func
x_req=sym('x');
r =sym((x_req-x(1))/h); 
y_req=sym(y(1));
prod=sym(1);
 for j=0:n-2
     prod=prod*(r-j)/(j+1);
     y_req=y_req+prod*DD(1,j+3);
 end
 func=expand(y_req);

end

