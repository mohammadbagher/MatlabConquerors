function [ calc, exact, err, h, n ] = trapezoidal(func, a, b, horn, horn_code, plot)
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
calc = fis(1,1)/2;
for i=1:n-1
    fis(i+1,1) = feval(func, a+i*h);
    calc = calc + fis(i+1,1);
end
fis(n+1,1) = feval(func, a+n*h);
calc = calc+fis(n+1,1)/2;
calc = h*calc;
exact = integral(func, a, b);
err = abs(calc-exact);
t = 0:pi/100:2*pi;
y = sin(t);
axes(plot);
plot(t,y);

return;
end