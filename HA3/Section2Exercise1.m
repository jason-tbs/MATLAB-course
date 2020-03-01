% Monte Carlo Section 2 Exercise 1

a = 0; % Start of interval
b = 10; % End of interval
for i = 2:7
    
    N = 10.^i; % Number of random numbers
    x = a+(b-a)*rand(1,N); % A vector x is constructed with N random
    % numbers on the interval [a, b]
    y = x.*exp(-x); % A vector y is constructed with N random
    % function values on the interval [a, b]
    Iest = (b-a)/N*sum(y) % Computes an estimate of the integral
end
f = @(x) x.*exp(-x);
Itest = integral(f,a,b)