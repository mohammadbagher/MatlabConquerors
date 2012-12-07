function root = false_position( func,a,b,max_step,tol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%a,b = brackets of the root, bolzano condition should apply on the
%interval.
format long;
s = a;
e = b;
xis = zeros(max_step,1);
for i=1:max_step
    fa = feval(func,s);
    fb = feval(func,e);
    if(fa == 0)
        root = s;
        return;
    end
    if(fb == 0)
        root = e;
        return;
    end
    
    xis(i,1) = (s*fb-b*fa)/(fb-fa);
    fc = feval(func,xis(i,1));
    if(i~=1 && abs(xis(i-1,1)-xis(i,1))<tol);
        root = xis(i,1);
        return;
    end
    if fc*fa<0
        e=xis(i,1);
    else
        s = xis(i,1);
    end
end
root = xis(max_step,1);
end

