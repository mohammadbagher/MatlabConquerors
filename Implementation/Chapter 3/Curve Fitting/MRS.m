function [ err ] = MRS( y,approximateY )
err=0;
for i=1:size(y)
    err=err+(y(i)-approximateY(i))^2;
end
err=err/size(y,1);
err=err^0.5;


end

