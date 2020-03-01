m = 1;
k = 2;
c = 0.0001;
t = linspace(0,10);
f = @(t) exp(-0.0005*t).*sin(1.41421*t) + exp(-0.0005*t).*cos(1.41421*t);
g = @(t) sin(sqrt(k/m)*t) + cos(sqrt(k/m)*t);
y = f(t);
y1 = g(t);
plot(t,y,'b'), hold on
plot(t,y1,'r'), hold on
legend('c close to zero', 'c = 0')

omega0 = sqrt(k/m);
omega = 1;
%dy = @(t,y) [y(2) ; -(k/m) * y(1)+ cos(omega*t)/m];
dy = @(t, y) [y(2) ; -c*y(2)-y(1)+cos(omega0*t) ]
[t,y ] = ode45(dy,  [0 10], [0 0]);
plot(t,y(:,1),':'), hold on