% Monte Carlo
N = 100; % Number of scattered points
% Constructs unit radius quarter circle
xx = linspace(0,1,100);
yy = sqrt(1-xx.^2);
plot(xx,yy,'r')
axis square % Gives the same scaling of the axes so that a
% circle will not look elongated.
hold on
Ncircle = 0; % Initiate Ncircle
for i = 1:N % Loop over N
    x = rand; % x is assigned a random number between 0 and 1
    y = rand; % y is assigned a random number between 0 and 1
    plot(x,y,'x') % Plot the point (x,y)
    hold on
    r2 = x.^2+y.^2; % Distance squared of point from origo
    if r2 < 1.0 % If point inside quarter circle
        Ncircle = Ncircle + 1; % Increment Ncircle
    end
end
piest = 4*Ncircle/N; % Compute estimated value of pi
disp('piest:'),disp(piest); % Display estimated value of pi
