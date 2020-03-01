

[t, theta] = ode45(@fun, [0 10], [pi/4 ; 0]);
plot(t,theta(:,1))

function dt = fun(~, theta)
L = 1; g = 9.81;
dt = [theta(2) 
    (-g/L)*sin(theta(1))];
end