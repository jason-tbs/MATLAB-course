%a
format long
R = 6370000; % Radius of the solid sphere
N = 100000; % Number of random numbers used
Nsphere = 0; % Initiate Nsphere
fsum = 0; % Initiate fsum


for i = 1: N % While the number of points inside the domain
    % is less than N
    x = -R+2*R*rand; % x is assigned a random number between -R and R
    y = -R+2*R*rand; % y is assigned a random number between -R and R
    z = -R+2*R*rand; % z is assigned a random number between -R and R
    r2 = x.^2 + y.^2 + z.^2; % Distance squared of the point (x,y,z) from origo
    if r2 < R^2
        
        if r2 < 1200000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 14000;
            
        elseif r2 < 3460000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 11000;
            
        elseif r2 < 5630000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 4850;
            
        elseif r2 < 6340000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 3800;
            
        elseif r2 < 6370000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 2600;
        end
    end
end
massEarth = ((Nsphere/N * 8*R.^3) * fsum) / Nsphere % Divide by 100.^3 going back from km^3 to m^3
inertiaWithMonteCarloMass = 2/5 * massEarth * R^2

for i = 1: N % While the number of points inside the domain
    % is less than N
    x = -R+2*R*rand; % x is assigned a random number between -R and R
    y = -R+2*R*rand; % y is assigned a random number between -R and R
    z = -R+2*R*rand; % z is assigned a random number between -R and R
    r2 = x.^2 + y.^2 + z.^2; % Distance squared of the point (x,y,z) from origo
    if r2 < R^2
        
        if r2 < 1200000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 14000 * (x^2 + y^2);
            
        elseif r2 < 3460000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 11000 * (x^2 + y^2);
            
        elseif r2 < 5630000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 4850 * (x^2 + y^2);
            
        elseif r2 < 6340000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 3800 * (x^2 + y^2);
            
        elseif r2 < 6370000^2
            Nsphere = Nsphere + 1;
            fsum = fsum + 2600 * (x^2 + y^2);
        end
    end
end
momentOfInertia = ((Nsphere/N * 8*R.^3) * fsum) / Nsphere 
pavg = 5514;
m = pavg * 4*pi/3 * R^3;
I = 2/5 * m * R^2
%momentofinertia = massEarth * (x^2 + y^2)