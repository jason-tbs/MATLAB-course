load co2.data
whos 
%plot(co2, '+')
%%i)
%non linear 
% x = ([1:234]');
% y = [co2];
% A = [x.^0 x.^1 x.^2];
% a = A\y
% %p = polyfit(x,y,2)
% %fitted function, y =  339.9577x.^0    0.0325 x.^1     0.0001 x.^2
%  plot(x,y, '+')
%  hold on
%  xm = 0:0.1:234;
%  ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2;
% % ym = polyval(p,xm);
%  plot(xm,ym)
%  

%  linear 1 with polyfit
% x = ([1:234]');
% y = [co2];
% p = polyfit(x,y,2)
% plot(x,y, '+')
%  hold on
% xm = 0:0.1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

 % non-linear 2 with log
%  t = [1:234]';
%  y = [co2];
%  yt = log(y);
% % xt = log(t);
% % A = [xt.^0 xt.^1 xt.^2]; 
% A = [t.^0 t.^1 t.^2]
% % a = A\yt
%  a = A\y  
%  plot(t,y,'+')
%  hold on
%  xm = 0:0.1:234;
%  ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2;
% % ym = exp(a(1)*xm.^0) + exp(a(2)*xm.^1) + exp(a(3)*xm.^2);
%  plot(xm,ym)
%  




% ii )
%linear
% x = ([1:234]');
% y = [co2];
% p = polyfit(x,y,4)  
% plot(x,y, '+')
%  hold on
% xm = 0:0.1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

x = ([1:234]');
y = [co2];
k = (18*pi)/234;
A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x)];
a = A\y
plot(x,y, '+')
hold on
xm = 0:1:234;
ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm);
plot(xm,ym)

%non-linear
% x = ([1:234]');
% y = [co2];
% k = 18*pi;
% A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x)];
% a = polyfit(x,y,4)
% plot(x,y,'+'), hold on
% xm = 0:1:234;
% ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm);
% plot(xm,ym)

% 
% plot(x,y, '+')
%  hold on
% xm = 0:0.1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

% iii )
% linear
% 
% x = ([1:234]');
% y = [co2];
% k = 234/(18*pi);
% A  = [x.^0 x.^1 x.^2 sin(k.*x) cos(k.*x) sin(2*k.*x) cos(2*k.*x)];
% p = polyfit(x,y,6)
% plot(x,y,'+'), hold on
% xm = 0:1:234;
% ym = polyval(p,xm);
% % ym = (a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^3 + a(4)*sin(k*xm) + a(5)*cos(k*xm) + a(6)*sin(2*k*xm) + a(7)*cos(2*k*xm));
% plot(xm,ym)


x = ([1:234]');
y = [co2];
k = (18*pi)/234;
A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x) sin(2*k*x) cos(2*k*x)];
a = A\y
plot(x,y, '+'), hold on
xm = 0:1:234;
ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm) + a(6)*sin(2*k*xm) + a(7)*cos(2*k*xm);
plot(xm,ym)
%södra halvklotet 2kt
%norra halvklotet
% mindre co2 på sommaren träd tar upp co2
%mer på vintern -> blad förmultar släpper ut.

%d)




 