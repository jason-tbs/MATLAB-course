% function z = integrand(x,y)
% x = linspace(-2,0);
% y = linspace(-1,1);
% n = length(x);
% z = zeros(1,n);
% for i = 1:n
%      if (x(i) >= -2 & x(i) <= 0) & (x(i)+1).^2 + y.^2 < 1
%          z(i) = x(i)^3*y + x(i)^2*y^2
%
%      end
% end
I = dblquad(@integrand,-2,0,-1,1)
function z = integrand(x,y)
n = length(x);
z = zeros(1,n);

for i = 1:n
    if(x(i) >= -2 & x(i) <= 0) & (x(i)+1)^2 + y^2 < 1
       z(i) = ((x(i).^3).*y + (x(i).^2).*(y.^2));
    end
end
end

