function [ ans1 ] = Adams_Multon(func,x0,y0,h,x_request)

n=(x_request-x0)/h;
corrector=Runge_Kuttaorder4(func,x0,y0,h,min(x_request,x0+3*h));
x0=x0+4*h;

syms x;
syms y;

func=subs(func);

for i=5:n
    f1=subs(func,[x y],[x0-h,corrector(i-1,2)]);
    f2=subs(func,[x y],[x0-2*h,corrector(i-2,2)]);
    f3=subs(func,[x y],[x0-3*h,corrector(i-3,2)]);
    f4=subs(func,[x y],[x0-4*h,corrector(i-4,2)]);
    f5=corrector(i-1,2)+h*(55*f1-59*f2+37*f3-9*f4)/24;
    f6=subs(func,[x y],[x0 f5]);
    corrector(i,2)=corrector(i-1,2)+h*(9*f6+19*f1-5*f2+f3)/24;
    corrector(i,1)=x0;
    x0=x0+h;
end

ans1=corrector;


end