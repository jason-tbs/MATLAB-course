% gamma = fzero(@fun,25) % fzero finds the gamma that makes shooting zero
% dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
% [x,T] = ode45(dT,[0 10],[15 ; gamma]); % solve equation for the found gamma
% plot(x,T(:,1)), xlabel('x'), ylabel('T')
% function deltaT = fun(gamma)
% k = 1;
% dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
% [x,T] = ode45(dT,[0 10],[15 ; gamma]);
% deltaT = 15 - T(length(x),1); % Difference between boundary value 15
% % and the computed solution at b = 10
% end
k = 1;
gamma = fzero(@fun,25) % fzero finds the gamma that makes shooting zero
dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
[x,T] = ode45(dT,[0 10],[15 ; gamma]); % solve equation for the found gamma
plot(x,T(:,1)), xlabel('x'), ylabel('T')
function deltaT = fun(gamma,k)
k = 1;
dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
[x,T] = ode45(dT,[0 10],[15 ; gamma]);
deltaT = 15 - T(length(x),1); % Difference between boundary value 15
% and the computed solution at b = 10
end
