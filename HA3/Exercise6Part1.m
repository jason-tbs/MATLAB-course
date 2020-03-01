a = 0;
b = 10;

Ta = 15;
Tb = 15;

k = 1;
n = 500;

x = linspace(a,b,n)'; %kolonnvektor
f = x - 3 + 5*sin(pi*x) %f1, f2 ,f3, ..., fn
dx = (b-a)/(n-1);
% Skapa L-matris (n-2 x n-2 matris) Alla tal förutom de två man känner
% till.
L = zeros(n-2);
for i =1: n-2
    L(i,i) = 2* (1/dx^2);
end

for i =1: n-3
    L(i,i+1) = -1/(dx^2);
    L(i+1,i) =  -1/(dx^2);
end

B = [Ta/dx^2; zeros(n-4,1); Tb/dx^2]...
    + (1/k) * f(2:n-1)
T = L\B;
T = [Ta; T; Tb];
plot(x,T)


