
%Analytical
t = linspace(0,10);
f = @(t) log((t.^2)/2 + 1/(exp(2)));
y = f(t);
figure(1)
plot(t,y)
title('Analytical plot')
xlabel('x')
ylabel('y')

%Numerical
[t z] = ode45(@fun,[0 10], -2);
figure(2)
plot (t,z)
title('ODE45')
xlabel('x')
ylabel('y')
function dz = fun(t,z)
dz = t.*exp(-z);
end