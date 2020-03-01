[x, y] = ode45(@fun,[0 10], [0 ; 0]);
plot (x,y(:,1))
hold on
plot (x,y(:,2),'--')
title('ODE45')
legend('y', 'dy^2/d^2x')
function dy = fun(x,y)
dy = ([y(2) ; sin(x) - y(1)]);
end



% 
% syms y(t)
% eqn = diff(y,2) == sin(t) -y;
% V = odeToVectorField(eqn);
% M = matlabFunction(V,'vars',{'t','Y'})
% %M = @(t,y)[Y(2) ; sint(t) - Y(1)]
% interval = [0 10];
% yInit = [0 0];
% ySol = ode45(M,[0 10],[0 0]);
% t = linspace(0,10);
% y = deval(ySol, t, 1);
% 
% plot(t,y) 
% hold on

