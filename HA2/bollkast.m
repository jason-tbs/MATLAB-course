% c = 0.05;
% g = 9.81;
% dz = @(t,z) [z(2)
%     -c*sqrt(z(2).^2 + z(4).^2)*z(2)
% z(4)
% -c*sqrt(z(2).^2 + z(4).^2)*z(4)-g];
% opt = odeset('Events', @fun);
% [t,z] = ode45(dz, [0 2], [0 10 0 10], opt);
% plot(z(:,1), z(:,3))
% ylim([-1 4])
% grid on
% function [value, isterminal, direction] = fun(t,z)
% value = z(3);
% isterminal = 1;
% direction = -1;
% 
% end


%b.
c = 0.25;
g = 9.81;
v = 10;
dz = @(t,z) [z(2)
    -c*sqrt(z(2).^2 + z(4).^2)*z(2)
    z(4)
    -c*sqrt(z(2).^2 + z(4).^2)*z(4)-g];
maxVal = -10000;
degree = 0;
for v = 10:10:100
    for i = 1:89
        
        opt = odeset('Events', @fun);
        [t,z] = ode45(dz, [0 20], [0 v*cosd(i) 0 v*sind(i)], opt);
        if z(end,1) > maxVal
            maxVal = z(end,1);
            degree = i;
            
        end
    end
    [t,z] = ode45(dz, [0 20], [0 v*cosd(i) 0 v*sind(i)], opt);
    plot(z(:,1), z(:,3)), hold on
   
end
% i = degree;
% [t,z] = ode45(dz, [0 20], [0 v*cosd(i) 0 v*sind(i)], opt);
% % legend('Angle = 10 ', 'Angle = 10 ', 'Angle = 20 ', ...  
% % 'Angle = 20 ',   'Angle = 20 ',   'Angle = 20 ', ...   
% % 'Angle = 20 ',   'Angle = 70 ',   'Angle = 80 ', ...
% % 'Angle = 90 ',   'Angle = 100 ')
% grid on
% maxVal
% degree
% 
% 
function [value, isterminal, direction] = fun(t,z)
value = z(3);
isterminal = 1;
direction = -1;

end

% 
