function [ calc, exact, err, h, n ] = simpson_3_8( func, a, b, horn, horn_code, plot1 )
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
    if(rem(i,3) ~= 0)
        coeff = 3;
    else
        coeff = 2;
    end
    fis(i+1,1) = feval(func, a+i*h);
    calc = calc + coeff*fis(i+1,1);
end
fis(n+1,1) = feval(func, a+n*h);
calc = calc+fis(n+1,1);
calc = 3*h*calc/8;
exact = integral(func, a, b);
err = abs(calc-exact);

for i=1:n
    x = a-(b-a)/10:h/10:b+(b-a)/10;
    y = func(x);
    p = plot(plot1,x,y);hold on;
    set(p,'LineWidth',2);
    if(mod(i,3) == 1)        
        poly = polyfit([a+(i-1)*h,a+i*h,a+(i+1)*h,a+(i+2)*h],[feval(func,a+(i-1)*h),feval(func,a+i*h),feval(func,a+(i+1)*h),feval(func,a+(i+2)*h)],3);
        x = a+(i-1)*h:h/100:a+(i+2)*h;
        y = polyval(poly,x);
        area(plot1,x,y,'FaceColor','g');
        x = a+(i-1)*h-h/2:h/100:a+(i+2)*h+h/2;
        y = polyval(poly,x);
        pol = plot(plot1,x,y,':');
        set(pol,'Color','red','LineWidth',1);
        hold on;
    end
end
hold on;
l1 = plot(a,0,'or');
l2 = plot(b,0,'or');
x = a-(b-a)/10:h/100:b+(b-a)/10;
xaxis = line(x,0);
set(l1,'Color','red','LineWidth',5);
set(l2,'Color','red','LineWidth',5);
set(xaxis,'LineWidth',3);
    legend(func2str(func),'Areas','3rd deg. poly.');
    xlabel('x');
    ylabel('y');

hold off;


end