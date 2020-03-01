%% HA3

%% 2/3
massPoint = "Enter amount of mass points: "; % How many mass points we wish to examine.
mp = input(massPoint) % Store the value written in massPoint
amountMode = "Enter amount of modes: "   %
modeInput = input(amountMode) %
%mode = (mp + 1) - modeInput;
mode = modeInput;
duration = "Enter amount of oscillations: "; % How long the animation shall keep going
time = input(duration) % Stores the value written in duration and uses
% the value to determine the length of the animation.

twoVector = ones(1,mp)*-2; % Creates a 1 x mp vector and fills it with the value -2.
D = diag(twoVector); % Places  the -2 from the vector above diagonaly in a n x n matrix.

oneVector = ones(1,(mp-1))*1; % Creates a vector with 1 x mp-1 and fills it with the value 1.
D1 = diag(oneVector,1); % Places the 1 vector on one position above the diagonal.
D2 = diag(oneVector,-1); % Places the 1 vector on one position below the diagonal

DD = D + D1 + D2; % Uses the values in our 2-vector and 1-vectors to fill the n x n matrix.

[C,D] = eig(DD); % Eigenvectors and eigenvalues from our DD matrix.

l = [0:mp+1]; % Positions for the end points and
% mass points as a column vector

% smallest k
k = sqrt(-D(mode,mode)); % the amount of modes can determine how the
%animation oscillates
for t = 0:0.1:time*pi % Duration of how long animation should go on
    u = sin(k*t)*[0; C(:,mode);0]; % u as a column vectors,
    % u = 0 for the end points
    plot(l,u,l,u, 'o')
    ylim([-1 1])
    pause (0.02)
end

%% 4

%% 5

num = 5001; % Number of grid points (odd number)
% Constants ------------------------------------------------------------
hbar = 1.055e-34; % J.s
me = 9.109e-31; % kg electron mass
Ese = 1.6e-19; % Energy scaling factor
Lse = 1e-9; % Length scaling factor
Cse = -hbar^2/(2*me) / (Lse^2*Ese); % Schrodinger Eq constant
% Potential well parameters, well centered around x = 0 -----------------
% Width 0.1 nm depth - 400 eV

U = zeros(num,1);
U_matrix = zeros(num-2);
xMin = -0.20; % default = -0.25 nm
xMax = 0.20; % default = +0.25 nm
x1 = 0.15; % 1/2 well width: default = 0.05 nm
x2 = 0.05;
U1 = -400; % Depth of well (eV): default = -400 eV
U2 = -100
x = linspace(xMin,xMax,num);
for cn = 1 : num
    if abs(x(cn)) <= x1
        U(cn) = U1;
    end;
    if abs(x(cn)) <= x2
        U(cn) = U2;
    end
end;

% Plot potential well --------------------------------------------

plot(x,U,'LineWidth',3);
axis([xMin-eps xMax min(U)-50 max(U)+50]);
xlabel('x (nm)');
ylabel('energy (eV)');
grid on


%% 6

num = 501; % Number of grid points (odd number)

% Constants ------------------------------------------------------------
hbar = 1.055e-34; % J.s
me = 9.109e-31; % kg electron mass
Ese = 1.6e-19; % Energy scaling factor
Lse = 1e-9; % Length scaling factor
Cse = -hbar^2/(2*me) / (Lse^2*Ese); % Schrodinger Eq constant
% Potential well parameters, well centered around x = 0 -----------------
% Width 0.1 nm depth - 400 eV

U = zeros(num,1);
U_matrix = zeros(num-2);
xMin = -0.20; % default = -0.25 nm
xMax = 0.20; % default = +0.25 nm
x1 = 0.15; % 1/2 well width: default = 0.05 nm
x2 = 0.05;
U1 = -400; % Depth of well (eV): default = -400 eV
U2 = -100
x = linspace(xMin,xMax,num);
for cn = 1 : num
    if abs(x(cn)) <= x1
        U(cn) = U1;
    end;
    if abs(x(cn)) <= x2
        U(cn) = U2;
    end
end;

% Make potential energy matrix ----------------------------------
dx = (x(2)-x(1));
dx2 = dx^2;
for cn =1:(num-2)
    U_matrix(cn,cn) = U(cn+1); % diagonal matrix
end

k = 1;
gamma = fzero(@fun,25) % fzero finds the gamma that makes shooting zero
dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
[x,T] = ode45(dT,[0 10],[15 ; gamma]); % solve equation for the found gamma
figure(2)
plot(x,T(:,1)), xlabel('x'), ylabel('T')
function deltaT = fun(gamma,k)
k = 1;
dT = @(x,T) [T(2) ; -(x-3+5*sin(pi*x))/k];
[x,T] = ode45(dT,[0 10],[15 ; gamma]);
deltaT = 15 - T(length(x),1); % Difference between boundary value 15
% and the computed solution at b = 10

end

%% SECTION II

%% Monte Carlo 1
 % Clear figure
