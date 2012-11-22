function [] = nbcp(X,Y)
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

% Create a matrix Prod, that has DD(1,3)*(x-x(1))/h in the first row,

% DD(1,4)*(r-1) in the second and so on.

% We first create a n-1 by n matrix of zeros. If we have n points, we will

% get a n-1 degree polynomial.
h=x(2)-x(1);
Prod = zeros(n-1,n);

p = conv(1,[1,-x(floor(n/2))])/h; % creates a poly (x-x(n/2))/h

for i = 1:n-1

 Prod(i,(n-(length(p)-1)):n) = DD(floor((n-i+2)/2),i+2)*p;

 p = ((conv(p,[1,-x(ceil(n/2))])/h)+floor((i+1)/2)*(-1)^(i+1))/(i+1);

end
% sum the columns of the matrix Prod to produce the polynomial P

P = sum(Prod,1);

% add y(1) to the last element of P, which is a_0 in a polynomial

P(1,n)=P(1,n)+y(floor(n/2));

% plot polynomial p for values x_eval

x_eval = min(x):0.1:max(x);

y_eval = polyval(P,x_eval);

plot(x_eval,y_eval); hold on;

% plot points used

for i = 1:n

 plot(x(i),y(i),'or');

end

