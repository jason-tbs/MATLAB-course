function dt = thetat(t, theta)
global L g
dt = [theta(2) -g*sin(theta(1))/L];
