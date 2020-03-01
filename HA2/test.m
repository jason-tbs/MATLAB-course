% v0 = input('Enter Initial Velocity of Ball in m/s and Press Return: ');
% angle=(5:5:85);
% g=9.81;
% hold on
% for angle = 1:89
%     if()
% tges=(2*v0.*sin(angle.*(pi/180)))/g;
% t =linspace(0,tges);
% vx = v0.*cos(angle.*(pi/180));
% vy = v0.*sin(angle.*(pi/180));
% sx = vx.*t;
% sy=vy.*t-0.5*g.*t.^2;
% plot(sx,sy);
% end
% hold off

vo = 100;  % initial velocity, m/s
a = -9.8;  % acceleration, m/s^2

angle = 5:10:85;       % angles in degrees
angle = angle*pi/180;  % convert to radians

figure;  hold on;      % create a figure and hold it for multiple lines.

% loop over each angle and create the plot for its trajectory.
for i=1:length(angle)
  vox = vo*cos( angle(i) );  % initial x-velocity for this angle
  voy = vo*sin( angle(i) );  % initial y-velocity for this angle
  tf = -2*voy/a;             % time of flight for this angle
  t  = linspace(0,tf);       % a vector of time points for our plot.
  x = vox * t;               % x-position at each point in time.
  y = voy * t + 0.5*a*t.^2;  % y-position at each point in time.
  plot( x, y );              % plot this trajectory.
  
  % annotate the plot by adding a label to the line at the peak of the
  % trajectory indicating the angle that this line corresponds to.

  % find the index for the max height.  There may be more than one if
  % we had a point on either side of the maximum.  In this case,
  % choose the first one.
  maxpt = find( y==max(y) );
  if( length(maxpt)>1 )
    maxpt=maxpt(1);
  end;
  text( x(maxpt), y(maxpt), num2str(angle(i)*180/pi) );
end

grid on;
axis tight;
xlabel('x (m)');
ylabel('y (m)');
title('Projectile Trajectories at Various Angles');