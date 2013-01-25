function [ calc, exact, err, h, n ] = simpson_1_3( func, a, b, horn, horn_code, plot )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
format long;
switch horn_code
    case 1
        h = horn;
        n = (b-a)/h;
    case 2
        n = horn;
        h = (b-a)/n;
end
fis = zeros(n+1,1);
fis(1,1) = feval(func, a);
calc = fis(1,1);
for i=1:n-1
    if(rem(i,2) == 1)
        coeff = 4;
    else
        coeff = 2;
    end
    fis(i+1,1) = feval(func, a+i*h);
    calc = calc + coeff*fis(i+1,1);
end
fis(n+1,1) = feval(func, a+n*h);
calc = calc+fis(n+1,1);
calc = h*calc/3;
exact = integral(func, a, b);
err = abs(calc-exact);
return;


end