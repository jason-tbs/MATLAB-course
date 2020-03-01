massPoint = "Enter amount of mass points: "; % How many mass points we wish to examine.
mp = input(massPoint) % Store the value written in massPoint
amountNode = "Enter amount of nodes: "   %
node = input(amountNode) %
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

l = [0:mp-1]; % Positions for the end points and
                % mass points as a column vector
%figure(1)
% smallest k
k = sqrt(-D(node,node)); % the amount of nodes can determine how the 
                        %animation oscillates
for t = 0:0.1:time*pi % Duration of how long animation should go on
        u = sin(k*t)*[ C(:,node) ]; % u as a column vectors,
                                   % u = 0 for the end points
        plot(l,u,l,u, 'o') 
        ylim([-1 1])
        pause (0.01)
end