clf
clear
clc

E0 = 0.7;                   % Initial energy
npart = 1000;                % Number of particles to be simulated
pabs = 0.2;             % Probability for interaction through absorbtion
counter = 0;
pplot10 = false;
% Construction of circular target
r = 0.3;                    % Target radius
center = 0.5;               % Center of target on y-axis
th = linspace(0,2*pi);
xx = r*cos(th);
yy = center+r*sin(th);
plot(xx,yy,'r');
hold on

Edep = 0;                   % Initialize deposited energy
for j=1:npart               % Loop over number of particles
    clear xtrack             % Clear track in x-direction
    clear ytrack             % Clear track in y-direction
    
    i = 1;                   % Initialize interaction counter i
    k = 0;
    
    % Position of particle gun and initial particle energy
    E = E0;                  % Initial energy of particles
    xtrack(i) = 0;           % Particles are fired from x=0 and
    ytrack(i) = 0;           % y=0
    
    i = i + 1;
    
    d = (center-r) + E*rand;    % Deduce range of particles before interaction
    if d < (center+r)           % If particle interacts within target
        xtrack(i) = xtrack(i-1); % Update x-position of particle track
        ytrack(i) = ytrack(i-1) + d; % Update y-position of particle track
        thetaold = 0;            % Store direction of particle
        i = i + 1;
    else                        % Particle does not interact within target
        xtrack(i) = xtrack(i-1); % Particle is transported far outside the target
        ytrack(i) = 1000*d;
        k = 1;                   % End track
    end
    
    while k<1                   % While particle is inside target and not yet absorbed
        pint = rand;
        if pint < pabs        % If absorbition
            Edep = Edep + E;      % Increment deposited energy
            k = 1;                % End particle track
        else                     % If elastic scattering
            theta = -pi+2*pi*rand + thetaold;  % Determine deflection angle
            phi = -pi+2*pi*rand;
            E = 0.5*E*(1-cos(phi));           % Update energy
            theta = phi/2;
            Edep = Edep + E;      % Increment deposited energy
            d = E*rand;           % Range before interaction
            x = d*sin(theta);     % Change in x-position due to scattering
            y = d*cos(theta);     % Change in y-position due to scattering
            thetaold = theta;     % Store direction of particle
            xtrack(i) = xtrack(i-1) + x;  % Update x-position of track
            ytrack(i) = ytrack(i-1) + y;  % Update y-position of track
            
            % If new position outside target the particle is transported
            % away from the target and track ends
            if (xtrack(i).^2+(ytrack(i)-center).^2) > r.^2
                xtrack(i) = 1000*x;
                ytrack(i) = 1000*y;
                k = 1;                  % End particle track
            end
            i = i + 1;
            
        end
    end
   if (i == 10 && counter < 10)
       %  if (pplot10 && counter < 10)
        plot(xtrack,ytrack,'--o')        % Plot particle track
        title('10 Particles')
        hold on
        counter = counter + 1;
        legend()
        pause(0.5)
        
    end
end
xlabel('x');
ylabel('y');
axis([-0.6 0.6 0 1])
Edep = Edep/npart                   % Compute average deposited energy