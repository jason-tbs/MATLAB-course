% function [t,y] = euler(f,a,y0,n)
% h = (a(2)-a(1))/n;
% y(1) = y0;
% t(1) = a(1);
% for i = 1:n
%     y(i+1) = y(i) + h*f(t(i),y(i));
%     t(i+1) = a(1) + h*i;
% end

function [t,y] = euler(f,a,b,A,n)
h = (b-a)/n; % steglängd
t(1) = a;
y(1) = A;
for i = 1:n
    y(i+1) = y(i) + h*f(t(i),y(i));
    t(i+1) = t(i) + h;
end
