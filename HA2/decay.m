[t, z] = ode45(@fun, [0 100], [1 0]);
plot(t, z(:,1),t,z(:,2))
legend('Bi','Po')
maxVal = max(z)
%index = find(max(z) == z)
%xi = interp1(z,t,maxVal) ;
% [maxZValue, indexAtMaxZ] = max(z);
% xValueAtMaxYValue = t(indexAtMaxZ(1))
function dz = fun(t,z)
L1 = log(2)/5.01;
L2 = log(2)/138.38;
dz = [-L1*z(1)
      L1*z(1)-L2*z(2)];
end

%b
% 24.58 by zooming in