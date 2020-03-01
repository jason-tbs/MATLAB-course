
% 
% syms x y
% 
% f = @(x,y) (x.^3).*y + (x.^2).*(y.^2);
% I1 = dblquad(f,-2,0,-1,1)
% 
% 
% n = length(x);
% z = zeros(1,n);
% for i = 1:n
%     if (x(i) >= -2 & x(i) <= 0) & (x(i)+1).^2 + y.^2 < 1
%         z(i) = ((x.^3).*y + (x.^2).*(y.^2));
%     end
% end


I = dblquad(@integra,1,3,1/3,10/3)
function z = integra(x,y)

n = length(x);
z = zeros(1,n);

for i = 1:n
    if (x(i) >= -2 & x(i) <= 0) & (x(i)+1).^2 + y.^2 < 1
        z(i) = ((x.^3).*y + (x.^2).*(y.^2));
    end
end
end


