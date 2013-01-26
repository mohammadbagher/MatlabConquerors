function [ calc, exact, err, h, n ] = trapezoidal(func, a, b, horn, horn_code, plot1)
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

x = a-(b-a)/3:h/10:b+(b-a)/3;
y = func(x);
p = plot(plot1,x,y);
hold on;
x = -10:0.1:10;
l1 = plot(a,0,'or');
l2 = plot(b,0,'or');
x = a-(b-a)/3:h/100:b+(b-a)/3;
xaxis = line(x,0);
set(l1,'Color','red','LineWidth',5);
set(l2,'Color','red','LineWidth',5);
set(xaxis,'LineWidth',4);

hold off;
return;
end