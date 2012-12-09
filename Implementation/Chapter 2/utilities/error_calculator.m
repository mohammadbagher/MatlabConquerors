function error = error_calculator( func,found_root,sigfig )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
try
    error = abs(found_root - fzero(func,found_root));
catch
    error = NaN;
end
vpa(found_root,sigfig)
vpa(error,sigfig)
end