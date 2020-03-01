global L g
L = 1;
g = 9.82;
[t,theta] = ode45(@thetat, [0 10], [pi/4; 0]);
plot(t, theta)