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
x1 = fzero(f, 0.57)
x2 = fzero(f, 1.10)

%% Exercise 1c
f = @(x) 0.1*x.^3 - 5*x.^2 -x +exp(-x)
x = linspace(0, 2);
y = f(x);
plot(x,y), grid on
x1 = fzero(f, 0.32323)

%% Exercise 2
%f  = @(d) 1 - 4*(sqrt(3^2+d.^2)-3)*(d/sqrt(3^2+d.^2))
f = @(d) 4*(sqrt(d.^2 + 9) -3).*d - (sqrt(d.^2 + 9))
d = linspace(-10,10);
y = f(d);
ylim([0, 103])
plot(d,y);
grid on
d1 = fzero(f,2)


%% Exercise 3
% Output: f, value of function at v
n = 2;
R=0.0820578;
a=3.640; b=0.04267; %carbon dioxide
P=100;
T=500;

f = @(x) n*R*T./(x-n*b)-a*(n.^2 ./ x.^2) - P;
y=f(x);

x=linspace(0,3);
plot(x, y)
grid on
ylim([-80,80])
volume = fzero(f,0.7272)

%% Exercise 4
r = 1;
Pp = 700;
Pv = 1000;
g = 9.81;
x = linspace(-1,3);
bWeight = (pi*4*r.^3)/3 * Pp;
%V = pi*x.*(x-(x.^2)/3);
f = @(x) Pv*g*pi*(x.*(x-(x.^2)/3)) - bWeight;
y = f(x);
plot(x,y)
grid on
x1 = fzero(f, -0.3)
x2 = fzero(f, 0.3)


%% Exercise 5
k = 1.2;
e = 0.8;
T0 = 625;
%T1 = 
Tair = 300;
h  = 20;
o = 5.67*1e-8;
deltaX = 0.05;
x = linspace(-1000,1000)
f = @ (x) (e*o).*(x.^4 - Tair.^4) + h.*(x-Tair) - (k/deltaX).*(T0 - x)
y = f(x);
plot(x,y), grid on
T1 = fzero(f, 434)



%% Excercise 6 
syms x
f = x.^2/(x-1)
df = diff(f,x)
df2 = diff(f,x,2)

%% Exercise 7
syms x 
f = log(x)
tf = taylor(f,x,1,'order',5)

%% Exercise 8
%a)
syms x
f = @(x) -exp(-x).*sin(4*x)
g = @(x) -1*(-exp(-x).*sin(4*x)) %the reversed f function
%syms x
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

I2 = quad(f,0,10)

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
x = linspace(-65, 65);
f = @(x) c.*x.^2
c = 0.0084;
y = f(x);
plot(x,y),grid on

fx = @(x) sqrt(1 +(2*c.*x).^2);
L = quad(fx,-65,65,1e-15)



%% Exercise 15
% x = 0:0.01:3;
syms x
f = @(x) 0.02*sin(4*pi*x)
F = quad(f,0,3,1e-12)

%%

%%Exercise 16
syms x
%x = 0:1:5;
c = @(t) cos((pi.*t.^2)./2);
s = @(t) sin((pi.*t.^2)./2);
C = quad(c,0,5,1e-10)
S = quad(s,0,5,1e-10)
%% Exercise 1 Several Variables _______________________________________
% a )

x = -2:0.1:2;
y = -2:0.1:2;
[X,Y] = meshgrid(x,y);
Z = sin(X.^2 + Y.^2);
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')

%% Exercise 1 b)
r = 0:0.1:2;
theta = linspace(0,2*pi,40);
[R,THETA] = meshgrid(r,theta); % generate gridmatrices
X = R.*cos(THETA);
Y = R.*sin(THETA);
Z = sin(X.^2 + Y.^2);
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')

%% Exercise 1 c)
Z = sin(X.^2 + Y.^2);