L = 1; 
g = 9.81;

dtheta = @(t,y) [y(2); (-g/L).*sin(y(1))];
[t, y] = ode45(dtheta, [0 10], [pi/4; 0]);
plot(t,y(:,1), t,y(:,2),':'),hold on


% Analytical solution b
t = linspace(0,10);
dtheta = @(t) (pi/4) * cos(sqrt(g/L)*t)
y = dtheta(t);
plot(t,y)
legend('Numerical','y(2)','Analytical')
