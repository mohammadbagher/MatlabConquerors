function root = fixed_point_iterator( gfunc, start, tol )
%fixed point iterator This funtion assumes that we have a g(x) function
%that g(x)=x. 
%
% OUTPUT:
%   returns NaN if the method can't converge.
err = zeros(100,1);
xis = zeros(100,1);
xis(1,1) = start;

for i=2:max_step+1
    xis(i,1) = feval(gfunc,xis(i-1));
    err(i,1) = abs(xis(i,1)-xis(i-1,1));
    if(i>2 && err(i,1)>err(i-1,1))
        root = NaN;
        return;
    end
    if(err(i,1)<tol)
        root = xis(i,1);
        return;
    end
end

end