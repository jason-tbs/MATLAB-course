%% Exercise 1a
f = @(x) tan(x) - x + 1;
x = linspace(0, 3*pi);
y = f(x);
plot(x,y), grid on
x = fzero(f, 4.4744)
x = fzero(f, 7.7112)

%% Exercise 1b
f = @(x) sin(x) -0.3*exp(x);
x = linspace(0,2);
y = f(x);
plot(x,y), grid on
x1 = fzero(f, 0.56566)
x2 = fzero(f, 1.0707)

%% Exercise 1c
f = @(x) 0.1*x.^3 - 5*x.^2 -x +exp(-x)
x = linspace(-5, 60);
y = f(x);
plot(x,y), grid on
x1 = fzero(f, 0.32323)
x2 = fzero(f, 50)

%% Exercise 2
%f  = @(d) 1 - 4*(sqrt(3^2+d.^2)-3)*(d/sqrt(3^2+d.^2))
f = @(d) 4*(sqrt(d.^2 + 9) -3).*d - (sqrt(d.^2 + 9))
d = linspace(-10,10);
y = f(d);
ylim([0, 103])
plot(d,y);
grid on
d1 = fzero(f,1.9192)


%% Exercise 3
% Output: f, value of function at v
n = 2;
R=0.0820578;
a=3.640; b=0.04267; %carbon dioxide
P=100;
T=500;

f = @(x) n*R*T./(x-n*b)-a*(n.^2 ./ x.^2) - P;
y=f(x);

x=linspace(0,10);
plot(x, y)
grid on
ylim([-80,80])
x1 = fzero(f,0.7071)

%% Exercise 4
r = 1;
Pp = 700;
Pv = 1000;
g = 9.81;
x = linspace(0,4);
bWeight = pi*4*r.^2/3 * Pp;
V = pi*x.*(x-(x.^2)/3);
f = @(x) Pv*g*(pi*x.*(x-(x.^2)/3)) - bWeight;
y = f(x);

plot(x,y)
grid on

x1 = fzero(f,0.333)
x2 = fzero(f, 2.494) % bollen är under ytan.

%% Exercise 5
k = 1.2;
e = 0.8;
T0 = 625;
%T1 = 
Tair = 300;
h  = 20;
o = 5.67*1e-8;
deltaX = 0.05;
x = linspace(-1000,1000);
f = @ (x) (e*o).*(x.^4 - Tair.^4) + h.*(x-Tair) - (k/deltaX).*(T0 - x)
y = f(x);
plot(x,y), grid on
T1 = fzero(f, 434)

%% Excercise 6 
syms x
f = x.^2/(x-1)
df = diff(f,x)

%% Exercise 7
syms x 
f = log(x)
tf = taylor(f,x,1,'order',5)

%% Exercise 8
%a)
%syms x
f = @(x) -exp(-x).*sin(4*x)
g = @(x) -1*(-exp(-x).*sin(4*x)) %the reversed f function
syms x
df = diff(f,x); %derive
a = solve(df,x); %find max/min
d2f = diff(f,x,2); %second deriv
x0 = 0.3333;
x1 = 1.909;
x2 = 1.121;

fmin = fminsearch(f, x0) %local
fmin2 = fminsearch(f, x1) %global
fmax = fminsearch(g, x2) % maxima
ymin = f(fmin)
ymin2 = f(fmin2)
ymax = g(fmax)
y = f(x);
xv = linspace(0,3);
fv = subs(y,x,xv);
plot(xv,fv) % plot f(x)
hold on
fv1 = subs(df,x,xv);
plot(xv,fv1,'-.'), grid on %plot deriv

% hold on
% fv2 = subs(d2f,x,xv);  %second derivetive
% plot(xv,fv2)

%% Exercise 8 b)
f = @(x) cos(2*x) + sin(x) + exp(-x.^2)
g = @(x) -1*(cos(2*x) + sin(x) + exp(-x.^2))
syms x
x0 = -1.596; % global min
x1 = 1.636; % local min
x2 = 0.1818; % maximum
fmin = fminsearch(f, x0) %local
fmin2 = fminsearch(f, x1) %global
fmax = fminsearch(g, x2) % maxima
ymin = f(fmin)
ymin2 = f(fmin2)
ymax = -1*g(fmax)
df = diff(f,x); %derive
a = solve(df,x); %find max/min
d2f = diff(f,x,2);
xv = linspace(-2,2);
y = f(x);
fv = subs(y,x,xv);
plot(xv,fv)
hold on
fv1 = subs(df,x,xv);
plot(xv,fv1,'-.'), grid on %plot deriv

%% Exercise 8 c
f = @(x) 1/((x-3).^2 + 1) - x./((x-1).^2 + 0.1)
g = @(x) -1*(1/(x-3).^2 - x./((x-1).^2 +0.1))
syms x
df = diff(f,x); %derive
a = solve(df,x); %find max/min
%d2f = diff(f,x,2);
x0 = 1.061; % global min
%x1 = 1.636; % local min
x2 = 3.485; % maximum
fmin = fminsearch(f, x0) %local
%fmin2 = fminsearch(f, x1) %global
fmax = fminsearch(g, x2) % maxima
ymin = f(fmin)
%ymin2 = f(fmin2)
ymax = -1*g(fmax)
xv = linspace(0,5);
y = f(x);
fv = subs(y,x,xv);
plot(xv,fv)
hold on
fv1 = subs(df,x,xv);
plot(xv,fv1,'-.'), grid on % plot deriv


%% Exercise 9 
% maxima are done within the previous exercise.

%% Exercise 10
syms x
f = @(x) x^2.*sin(x)
y = f(x);
I1 = int(y,x)

%% Exercise 11
syms x
f = @(x) x.*sin(x.^2)
y = f(x);
I1 = int(f,x,0,10)
I2 = integral(f,0,10)

%% Exercise 12
t = 0:0.01:3;
x = t.*cos(5*t); %x(t)
y = sin(3*t); % y(t)
plot(x,y), grid on
f = @(t) sqrt((cos(5*t)-5*t.*sin(5*t)).^2 + 3.*cos(3*t).^2); % function for curve length
L = quad(f,0,3) %integral of curve length - calculating length

%%
% Exercise 13
t = 0:0.1:2*pi;
x = 8.*cos(t);
y = sin(t);
plot(x,y), grid on
f = @(t) sqrt((-8.*sin(t)).^2 + cos(t).^2)
L = quad(f,0,2*pi,1e-15)
a = 1;
b = 8;
L1 = pi*(a + b + ((3*a+b).^2 / (10*(a+b) + sqrt(a.^2 + 14*a*b + b.^2))))
LError = L1 / L
%%***
%%
%%Exercise 14
c = 30/(60.^2);
x = linspace(-65, 65);
f = @(x) c.*x.^2
y = f(x);
plot(x,y),grid on

fx = @(x) sqrt(1 +(2*c.*x).^2);
L = quad(fx,-60,60,1e-15)  %length


%% Exercise 15

syms x
x = linspace (0, 3)
z = 4; % length in Z.
f = @(x) 0.02*sin(4*pi*x)
fprim = @(x) (2*pi*cos(4*pi*x))/25
y = f(x);
plot(x,y)
% df =  diff(f,x) = (2*pi*cos(4*pi*x))/25
xLength = @(x) sqrt(1 + (2*pi*(cos(4*pi*x))/25).^2) %sqrt of derivative
L = quad(xLength,0,3,1e-15) % length in x
A = L * z

%%
%%Exercise 16
syms x
%x = 0:1:5;
c = @(t) cos((pi.*t.^2)./2);
s = @(t) sin((pi.*t.^2)./2);
C = quad(c,0,5,1e-10)
S = quad(s,0,5,1e-10)

%% __________________________________PART 2 SEVERAL VARIABLES __________________________________
%% Exercise 1 Several Variables 
% a )

x = -2:0.1:2;
y = -2:0.1:2;
[X,Y] = meshgrid(x,y);
Z = sin(X.^2 + Y.^2);
figure(1)
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')
figure(2)
contour(X,Y,Z)


%% Exercise 1 b)
r = 0:0.1:2;
theta = linspace(0,2*pi); %standard resolution 100 steps
[R,THETA] = meshgrid(r,theta); % generate grid matrices
X = R.*cos(THETA);
Y = R.*sin(THETA);
Z = sin(X.^2 + Y.^2);
figure(1)
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')
figure(2) % Contour plot
contour(X,Y,Z)



%% Exercise 1 c)
% Contours in a and b
Z = sin(X.^2 + Y.^2);

%% Exercise 2
syms x y
f = sin(x.^2 + y.^2);
gradf = jacobian(f,[x y]);
pretty(gradf)

%% Exercise 3a
x = -2:0.1:2;
y = -2:0.1:2;
[X,Y] = meshgrid(x,y);
Z = sin(X.^2 + Y.^2);
[Fx,Fy] = gradient(Z,0.1,0.1);
contour(Z)
hold on
quiver(Fx,Fy)

%% Exercise 3b
r = 0:0.1:2;
theta = linspace(0,2*pi,40); % one period.
[R,THETA] = meshgrid(r,theta); % generate gridmatrices
X = R.*cos(THETA); 
Y = R.*sin(THETA);
Z = sin(X.^2 + Y.^2);
[Fx,Fy] = gradient(Z,0.1,0.1);
contour(X, Y, Z)
hold on
quiver(Fx,Fy)

%% Exercise 4
%Determine the Tangent plane in the point (6; 2; 3). Plot the function surface
%and the tangent plane in the same plot. Rotate the figure.
r = 0:0.1:7;
theta = linspace(0,2*pi); %standard resolution 100 steps
[R,THETA] = meshgrid(r,theta); % generate grid matrices
X = R.*cos(THETA);
Y = R.*sin(THETA);
Z = sqrt(49.0001 - X.^2 - Y.^2);
figure(1)
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')
hold on

x = linspace(-5, 10);
y = linspace(-5, 10);
[X,Y] = meshgrid(x,y);
Z = 49/3 - (2*Y)/3 - 2*X;
ylim = ([-10 10]);
xlim = ([-5 5]);
zlim = ([0 10]);
mesh(X,Y,Z)
scatter3(6,2,3)

syms x y z
f = sqrt(49 - (x.^2) - (y.^2));
t1 = taylor(f,[x y z], [6 2 3], 'order', 2) % tangent plane
pretty(t1)

%%
%%Exercise b)
syms x y z
f = sqrt(49 - (x.^2) - (y.^2));
t1 = taylor(f,[x y z], [6 2 3], 'order', 3) % tangent plane
pretty(t1)


%% Exercise 5
syms x y
%x = 9:0.1:9;
%y = 0:0.1:7;
f  = x - log(x - y.^2);
Z  = x - log(x - y.^2);
gradf = jacobian(f,[x y]);
[xst,yst] = solve(gradf(1),gradf(2),x,y)
hessian = jacobian(gradf,[x y]);
hessian_st = double(subs(hessian,[x y],[1 0]))
eigen = eigs(hessian_st)
%[X,Y] = meshgrid(x,y);
%mesh(X,Y,Z) % plot

%% Exercise 6
x = linspace (-2, 2)
f = @(x) sin(x)
y = f(x);

plot(x,y)
hold on

g = @(x) ((x.^2) + 2)
y1 = g(x);
plot(x,y1)

d = @(x) sqrt( (x(1)-x(2)).^2 + (sin(x(1))-(x(2)^2+2)).^2)
[xmin ymin] = fminsearch(d,[1 1]) % find the points % ymin represents the length

scatter(0.2795, ((0.2795.^2) + 2)) % point 1
scatter(0.9776, sin(0.9776)) % point 2
plot([0.9776, 0.2795], [sin(0.9776), ((0.2795.^2) + 2)], '-bo') %plot line between the points
% hold on
% x1 = linspace(-2,4)
% x2 = linspace(-2,4)
% h = @(x) sqrt((x1-x2).^2 + (sin(x)-(x.^2 + 2)).^2) 
% y2 = h(x);
% plot(x,y2)
%% Exercise 7
syms x y
f = @(x,y) exp(x).*(x+y);
I = int(int(f,x,0,2),y,-1,2) % Analytical
I2 = int(int(f,y,-1,2),x,0,2) % Analytical test, reversed values.

D = dblquad(f,0,2,(-1),2) % Numerical


%% Exercise 8a
x = 0:0.01:3;
y = 0:0.01:5;
[X Y] = meshgrid(x,y);
Z = 20 + (30./((X-2).^2 + (Y-1).^2 + 1));
mesh(X,Y,Z)
xlabel('x'), ylabel('y'), zlabel('z')


%% Exercise 8b
%x = 0:0.01:3;
%y = 0:0.01:5;
syms x y
f = @(x,y) 20 + (30./((x-2).^2 + (y-1).^2 + 1));
I = dblquad(f,0,3,0,5)
A = I / 15 %given from interval 1/3 * 1/5

%% Exercise 9
syms x y
f = @(x,y) 1./(1+x+y);
I = dblquad(f,0,2,0,1)

%% Exercise 10
f = @(x,y) ((x.^3).*y) + ((x.^2).*(y.^2)).*(((x + 1).^2 + y.^2) < 1)
I = dblquad(f,0,1,0,2*pi)

% r  = 0:0.01:1;
% theta = linspace(0,2*pi); %standard resolution 100 steps
% [R,THETA] = meshgrid(r,theta); % generate grid matrices
% X = R.*cos(THETA);
% Y = R.*sin(THETA);
% Z = ((X.^3).*Y + (X.^2).*(Y.^2));
% mesh(X,Y,Z) % plot
% xlabel('x'), ylabel('y'), zlabel('z')
% %I = dblquad(f

%% Exercise 6 test
%xtest = 0:0.5:3; ytest = 0:0.5:3;
%x = linspace(0,3)
x = linspace (-2, 2)
f = @(x) sin(x)
y = f(x);

plot(x,y)
hold on

g = @(x) ((x.^2) + 2)
y1 = g(x);
plot(x,y1)

d = @(x) sqrt( (x(1)-x(2)).^2 + (sin(x(1))-(x(2)^2+2)).^2)
[xmin ymin] = fminsearch(d,[1 1]) % find the points % ymin represents the length

scatter(0.2795, ((0.2795.^2) + 2)) % point 1
scatter(0.9776, sin(0.9776)) % point 2
plot([0.9776, 0.2795], [sin(0.9776), ((0.2795.^2) + 2)], '-bo') %plot line between the points


% ymin is the length
% xmin are the coordinates

%y = d(x);

%plot(x,y)


%% Exercise 10 test
%x = linspace(0,1);
%y = linspace(0,2);

%I = dblquad(f,-2,0,-1,1)
I = dblquad(@integrand,(-2),0,(-1),1)

function z = integrand(x,y)
%f = @(x,y) (x.^3).*y + (x.^2).*(y.^2);
n = length(x); %antal punkter i x - tänker att det är en vektor
z = zeros(1,n); % set to 0, then loop and z changes value
for i = 1:n %                    |         d         |
    if(x(i) >= -2 & x(i) <= 0) & (x(i)+1)^2 + y^2 < 1  
       z(i) = ((x(i).^3).*y + (x(i).^2).*(y.^2));
    end
end
end



