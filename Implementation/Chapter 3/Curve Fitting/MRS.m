function [ err ] = MRS( y,approximateY )
err=0;
for i=1:length(y)
    err=err+(y(i)-approximateY(i))^2;
end
err=err/length(y);
err=err^0.5;


end

