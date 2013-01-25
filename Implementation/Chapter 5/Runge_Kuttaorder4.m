function [ ans1 ]=Runge_Kuttaorder4(func,x0,y0,h,x_request)

n=(x_request-x0)/h+1;
syms x;
syms y;

func=subs(func);

k1=h*func;
k2=h*subs(func,[x y],[x+h/2,y+k1/2]);
k3=h*subs(func,[x y],[x+h/2,y+k2/2]);
k4=h*subs(func,[x y],[x+h,y+k3]);

tempy=y+(k1+2*k2+2*k3+k4)/6;
ans1(1,2)=y0;
ans1(1,1)=x0;
x0=x0+h;

for i=2:n
    ans1(i,1)=x0;
    ans1(i,2)=subs(tempy,[x y],[x0-h, ans1(i-1,2)]);
    x0=x0+h;
end
end
