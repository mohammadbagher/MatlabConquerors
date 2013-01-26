function [ calc, exact, err, h, n ] = trapezoidal(func, a, b, horn, horn_code, plot1, romberg)
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
if(nargin == 6)

    l1 = plot(a,0,'or');hold on;
    l2 = plot(b,0,'or');
    x = a-(b-a)/10:h/100:b+(b-a)/10;
    xaxis = line(x,0);
    set(l1,'Color','red','LineWidth',5);
    set(l2,'Color','red','LineWidth',5);
    set(xaxis,'LineWidth',4);
    for i=1:n
        area(plot1,[a+(i-1)*h a+i*h],[feval(func,a+(i-1)*h) feval(func,a+i*h)],'FaceColor', 'g');
    end
    x = a-(b-a)/10:h/10:b+(b-a)/10;
    y = func(x);
    p = plot(plot1,x,y);
    set(p,'LineWidth',2);
    legend('a','b',func2str(func),'Trapezoidals');
    xlabel('x');
    ylabel('y');
    hold off;
end
return;
end