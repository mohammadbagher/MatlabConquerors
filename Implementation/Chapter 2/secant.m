function root = secant( func,x1,x2,max_step,tol )
% Finds a bracketed zero of f(x) by secant method.
% USAGE: root = secant(func,x0,x1,n)
% INPUT:
%   func = handle of function that returns f(x).
%   x1 = first x near root.
%   x2 = second x near root.
%   max_step = maximum number of steps to calculate the root, 
%               if error becomes lower than tol in a step lower than
%               max_step, program will end.
%   tol = error tolerance of answer, note that program iterates 
%           max_steps either the tol is provided or not.
% OUTPUT:
%   root = zero of f(x), or NaN if the method can't find any roots.
format long;
xis = zeros(max_step,1);
xis(1,1)=x1;
xis(2,1)=x2;
for i=3:max_step
    fim1 = feval(func,xis(i-1,1));
    fim2 = feval(func,xis(i-2,1));
    if(fim1 == 0)
        root = xis(i-1);
        return;
    end
    if(fim2 == 0)
        root = xis(i-2);
        return;
    end
    xis(i,1) = (xis(i-2,1)*fim1-xis(i-1,1)*fim2)/(fim1-fim2);
    e = abs(xis(i,1)-xis(i-1,1));
    fi = abs(feval(func,xis(i,1)));
    if(e<tol || fi<tol)
        root = xis(i,1);
        return;
    end
end

root = xis(max_step,1);

end
