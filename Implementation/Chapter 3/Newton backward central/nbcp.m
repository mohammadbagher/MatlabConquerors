function [func,x_ans] = nbcp(X,Y,X_request,axes)
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

r =(x_req-x(ceil(n/2)))/h; 
y_req=y(ceil(n/2));
prod=1;
 for j=0:n-2
     prod=prod*((r+(-1)^(j+1)*floor((j+1)/2))/(j+1));
     y_req=y_req+prod*DD(floor((n-j+1)/2),j+3);
 end
 
x_ans=y_req;
plot(axes,x_req,y_req,'+');hold on;



 plot(axes,x,y,'or');
%%%%%%%%%%func
x_req=sym('x');
r =sym((x_req-x(ceil(n/2)))/h); 
y_req=sym(y(ceil(n/2)));
prod=sym(1);
 for j=0:n-2
     prod=prod*((r+(-1)^(j+1)*floor((j+1)/2))/(j+1));
     y_req=y_req+prod*DD(floor((n-j+1)/2),j+3);
 end
 func=expand(y_req);
 hnew=(x(2)-x(1))/20;
 x=min(x):hnew:max(x);
 plot(x,eval(func));
 hleg1 = legend('requestpoint','firstpoints','newtonbackwardcentralinterpolation');
 xlabel('points');
ylabel('approximations');
end

