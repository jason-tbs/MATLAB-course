e = 0.5;
[t, z] = ode45(@fun, [0, 2*pi], [1-e ; 0 ; 0 ; sqrt((1+e)/(1-e))]);

plot(z(:,1), z(:,3),'b'), hold on
axis equal
scatter(0.000,0.000) % sun
title('Planet orbit')

[t, z] = ode45(@fun, [0, 3*pi], [1-e ; 0 ; 0 ; sqrt((1.1+e)/(1-e))]);
plot(z(:,1), z(:,3),'r'), hold on


[t, z] = ode45(@fun, [0, 4*pi], [1-e ; 0 ; 0 ; sqrt((1.15+e)/(1-e))]);
plot(z(:,1), z(:,3),'g'), hold on


[t, z] = ode45(@fun, [0, 5*pi], [1-e ; 0 ; 0 ; sqrt((1.2+e)/(1-e))]);
plot(z(:,1), z(:,3),'k'), hold on


[t, z] = ode45(@fun, [0, 5*pi], [1-e ; 0 ; 0 ; sqrt((1.5+e)/(1-e))]);  % planet get loose from gravitational field
plot(z(:,1), z(:,3),'m')




function dz = fun(t,z)

G = 1;
M =1 ;

dz = [z(2)
    (-G*M)*z(1)/((z(1).^2+z(3).^2).^(3/2))
    z(4)
    (-G*M)*z(3)/((z(1).^2+z(3).^2).^(3/2))]
end