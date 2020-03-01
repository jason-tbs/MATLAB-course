
% target.m
% 
%  function t = throwarrows(x,y,n)
% x1=-1;  % for c )
% x2=1;   % for c )
% y1=-1;  % for c )
% y2=1;   % for c )
% xplot = [x1, x2, x2, x1, x1];    % for c )
% yplot = [y1, y1, y2, y2, y1];    % for c )
% hold on % for c )
% t = linspace(0,2*pi);  % for c )
% xc = cos(t);    % for c )
% yc = sin(t);    % for c )
% plot(xc,yc);
% axis equal;   % for c )
% hold on
% plot(xplot, yplot, 'b-', 'LineWidth', 1); % for c ) 
% 
% a)
% onTarget = (x.^2) + (y.^2);
% areaSquare = 2*2;
% countOnTarget = onTarget < 1;
% s = sum(countOnTarget);
% throws = s/n;
% targetArea = areaSquare * throws
% for i = 1:s
%     if (x(i)^2 + y(i)^2 < 1)
%         plot(x(i),y(i), 'o');
%        % pause(0.1); % for c )
%     end
% end


%B )
function t = throwarrows(a,b,x,y,n)
onTarget = ((x.^2)./(a.^2) + (y.^2)./(b.^2));
areaSquare = (2*a)*(2*b);
countOnTarget = onTarget <= 1;
s = sum(countOnTarget);
throws = s/n;
targetArea = areaSquare * throws
 plot(x(countOnTarget),y(countOnTarget), 'o');
