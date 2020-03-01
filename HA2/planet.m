
% e = 0.;
% [t, z] = ode45(@fun, [0, 2*pi], [1-e ; 0 ; 0 ; sqrt((1+e)/(1-e))]);
% figure(1)
% plot(z(:,1), z(:,3)), hold on
% 
% e = 0.5;
% [t, z] = ode45(@fun, [0, 2*pi], [1-e ; 0 ; 0 ; sqrt((1+e)/(1-e))]);
% plot(z(:,1), z(:,3)), hold on
% 
% e = 0.9;
% [t, z] = ode45(@fun, [0, 2*pi], [1-e ; 0 ; 0 ; sqrt((1+e)/(1-e))]);
% plot(z(:,1), z(:,3)), hold on
% scatter(0,0) % sun
% legend('e = 0', 'e  = 0.5', 'e = 0.9', 'Sun')
% title('Sun orbit with different e')
% 


% Energy plot
e = 0.5;
[t, z] = ode45(@fun, [0, 2*pi], [1-e ; 0 ; 0 ; sqrt((1+e)/(1-e))]);
axis equal
figure(2)
Ekin = 0.5*(z(:,2).^2 + z(:,4).^2);
plot(t,Ekin)
title('Kinetic energy')
figure(3)
Epot = -1 ./ (sqrt(z(:,1).^2+z(:,3).^2));
plot(t, Epot)
title('Potential energy')
figure(4)
Etot = 0.5*((z(:,2).^2) + (z(:,4).^2))-(1./sqrt(z(:,1).^2+z(:,3).^2));
plot(t,Etot)
title('Total energy')
figure(5)
[t,z] = ode45(@fun,[0 3*pi],[1-e 0 0 sqrt(((1+e)/(1-e)))]);
plot(z(:,1), z(:,3))
hold on
Lz =  z(:,1).*z(:,4)-(z(:,3).*z(:,2));
plot(t,Lz)
ylim([-1.5 1.5])
title('Angular momentum')

function dz = fun(t,z)
% M = 1.989*10.^30; sun mass
% G = 9.81;
G = 1;
M =1 ;

dz = [z(2)
    (-G*M)*z(1)/((z(1).^2+z(3).^2).^(3/2))
    z(4)
    (-G*M)*z(3)/((z(1).^2+z(3).^2).^(3/2))]
end