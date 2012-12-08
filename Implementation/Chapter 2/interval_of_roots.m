function intervals = interval_of_roots(func, a, b, delta )
%finds subintervals of [a b] that bolzano condition aplly in them, means
%that finds subintervals with one root in them.
%   Detailed explanation goes here
format long;
n = ceil((b-a)/delta)-1;
intervals = zeros(0);
for i=1:n
    s = a+(i-1)*delta;
    e = a+i*delta;
    fs=feval(func,s);
    fe=feval(func,e);
    t = size(intervals,1);
    if(t>1 && fs == 0.0 && intervals(end-1,1) == max(s-delta,a) && intervals(end-1,1) == e)
        intervals(t+1,1) = max(s-delta,a);
        intervals(t+1,2) = e;
    else if(fe == 0.0)
        intervals(t+1,1) = s;
        intervals(t+1,2) = min(e+delta,b);
    else if(fs*fe< 0.0)
        intervals(t+1,1) = s;
        intervals(t+1,2) = e; 
        end
        end
    end
end
s = a+n*delta;
e=b;
fs=feval(func,s);
fe=feval(func,e);
t = size(intervals,1);

if(fs*fe< 0.0)
    intervals(t+1,1) = s;
    intervals(t+1,2) = e; 
end
end