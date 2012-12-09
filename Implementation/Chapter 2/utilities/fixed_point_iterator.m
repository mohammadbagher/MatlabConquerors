function [root , error] = fixed_point_iterator( func, gfunc, a, b, max_step, tol )
%fixed point iterator This funtion assumes that we have a g(x) function
%that g(x)=x. 
%
% OUTPUT:
%   returns NaN if the method can't converge.
start = (a+b)/2;
err = zeros(max_step,1);
xis = zeros(max_step,1);
xis(1,1) = start;
near_root = bisection(func,a,b,10,tol/2);
if(isnan(near_root))
    root = NaN;
    return;
end
for i=2:max_step+1
    xis(i,1) = feval(gfunc,xis(i-1));
    err(i,1) = abs(xis(i,1)-near_root);
%      if(i>2 && err(i,1)>err(i-2,1))
%          root = NaN;
%          return;
%      end
    if(err(i,1)<tol)
        root = xis(i,1);
        return;
    end
    
end
root=xis(max_step+1,1);
if(root < a || root >b)
    root = NaN;
end
