function diff_plot( func, h, x0, diff_x0, axes1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
t = -20*h+x0:h/10:x0+20*h;
g = func(t);
plot(axes1, t,g);
hold on;
t = -15*h+x0:h/10:x0+15*h;
g = diff_x0*(t-x0)+feval(func,x0);
p =plot(axes1,t,g,':');
    set(p,'Color','red' ,'LineWidth',2);
    plot(x0,feval(func,x0),'or','LineWidth',5,'Color','g');
hold off;

end

