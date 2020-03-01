%b.
c = 0.25;
g = 9.81;
v = 5;
dz = @(t,z) [z(2)
    -c*sqrt(z(2).^2 + z(4).^2)*z(2)
    z(4)
    -c*sqrt(z(2).^2 + z(4).^2)*z(4)-g];
maxVal = -10000;
degree = 0;

for i = 1:89
    
    opt = odeset('Events', @fun);
    [t,z] = ode45(dz, [0 20], [0 v*cosd(i) 0 v*sind(i)], opt);
    if z(end,1) > maxVal
        maxVal = z(end,1);
        degree = i;
        
    end
end

i = degree;
v
degree
maxVal
[t,z] = ode45(dz, [0 20], [0 v*cosd(i) 0 v*sind(i)], opt);
plot(z(:,1), z(:,3)), hold on
grid on

function [value, isterminal, direction] = fun(t,z)
value = z(3);
isterminal = 1;
direction = -1;

end
