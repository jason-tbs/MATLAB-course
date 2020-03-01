%f.m
%test for euler and runge
left = input('Enter left interval ')
right = input('Enter right interval ')
n = input('Enter points ')

[t, y] = runge(@fun, left, right, 1, n); % runge-kutta
plot(t,y,'r'), hold on
[t, y] = euler(@fun,left, right, 1,n); % euler
plot(t,y,'-b'), hold on
[t, y] = ode45(@fun,[left right],1 ); % test med ode45
plot(t,y,':k')
legend('Runge-Kutta', 'Euler', 'ODE45')
function F = fun(t,y)
%F = sin(t) + cos(y)
%F = y -t.^2 + 1;
F = -y + sin(t);
end
