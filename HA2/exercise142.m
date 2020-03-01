% Exercise 14.2
% % 

[t,z] = ode45(@fun, [0 20], [10; 0 ; 15 ; 0]);
plot(t,z(:,1),t,z(:,2),t,z(:,3),t,z(:,4))  % first col of z, second col of z...
legend('y1','dy1/dt','y2','dy2/dt')
function dz = fun(t,z)
dz = [z(2)  
    -2*z(1) + z(3) 
    z(4)
    z(1) - z(3)] 
end

