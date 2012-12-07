function error = error_calculator( func,found_root )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

error = abs(found_root - fzero(func,found_root));

end