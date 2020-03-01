m = 1;
k = 1;
c = 0.1;
omega0 = sqrt(k/m);
omega = 1;
%dy = @(t,y) [y(2) ; -(k/m) * y(1)+ cos(omega*t)/m];
dy = @(t, y) [y(2) ; -c*y(2)-y(1)+cos(omega*t) ]
[t,y ] = ode45(dy,  [0 50], [0 0]);
plot(t,y(:,1)), hold on




