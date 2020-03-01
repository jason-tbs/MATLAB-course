%% Exercise 9.1
load freefall.mat
whos
%a )
plot(t,y)
%deriv = diff(t,y)

%%
load freefall.mat



a = 1;
b = 200;
n = 201;
h = (b-a)/(n-1);
t =a:h:b;
dy(1) = (y(2)-y(1))/h;
dy(201) = (y(201) - y(200))/h;
for i=2:n-1
    dy(i) = (y(i+1)-y(i-1))./(2*h);
end
figure(1)
plot(t,y)
title('figure 1')
figure(2)
plot(t,dy)
title('figure 2')

% %c )
for i =2:200
    d2y(i) = y(i+1) - 2*y(i) + y(i-1)/(h^2);
end
pt = [t(2) t(3) t(4)];
py = [d2y(2) d2y(3) d2y(4)];
p = polyfit(pt,py,2);
d2y(1) = polyval(p, t(1));
pt = [t(198) t(199) t(200)];
py = [d2y(198) d2y(199) d2y(200)];
p = polyfit(pt, py,2);
d2y(201) = polyval(p,t(201));
t20 = d2y(20)
t0 = d2y(1)

figure(3)
plot(t,d2y)
title('figure 3')


%% Exercise 9.2  trapez
format long
n = 101;
a = 0;
b = 3;
% x = 0:3/11:3;
x = linspace(0,3,n);
f = @(x) x.^2;

a = 0;
b = 3;
n = 201;
h = (b-a)/(n-1);
x = linspace(0,3,n);
y = x.^2;
Itot = 0.0;
for i = 1:n-1 % loop from i=1 to i=n-1
    dI = h/2*(y(i)+y(i+1)); % compute the area of the subinterval
    Itot = Itot + dI % accumulate Itot
end
test = integral(f,0,3)
%traps = trapz(x,y)



%% Exercise 9.2 simpons
format long
f = @(x) x.^2;
a = 0;
b = 3;
n = 201;
h = (b-a)/(n-1);
x = linspace(0,3,n);
y = x.^2;
Itot = 0.0; % initialize Itot
for i = 2:2:n-1 % loop from i=2 to i=n-1 is steps of 2
    dI = h/3*(y(i+1)+4*y(i)+y(i-1)); % compute area of subinterval
    Itot = Itot + dI % accumulate Itot
end
test = integral(f,0,3)


%% Exercise 9.3a
r = linspace(-1,10);
p = @(r) 0.084./(1 + exp(2*r - 8))
y = p(r);
plot(r,y)

%% Exercise 9.3 b
format long
a = 0;
b = 100000;
n = b;
h = (b-a)/(n-1);
r = linspace(a,b,n);
q = @(r) 4*pi.*((0.084./(1 + exp(2*r - 8))).*r.^2);
Itot = 0.0; % initialize Itot
for i = 2:2:n-1 % loop from i=2 to i=n-1 is steps of 2
    dI = h./3*(q(i+1)+4*q(i)+q(i-1)); % compute area of subinterval
    Itot = Itot + dI; % accumulate Itot
end
y = @(x) 4*pi.*((0.084./(1 + exp(2*x - 8))).*x.^2);
Test = integral(y,0,Inf);

disp('Simpsons rule'), disp(Itot)
disp('Normal integral'), disp(Test)


%% Exercise 9.3 c

% Q ~= 26 Fe (Iron)
%% Exercise 9.4


%% Exercise 9.5
%trisum.m
%exercise95.m

%% Exercse 14.1a



%% Exercise 14.1 b

%
% [x y] = ode45(@fun,[0 10], 0);
% plot (x,y)
%
% function xy = fun(x,y)
% xy = sin(x) - y2 -y1;
% end

% analytical 
 
f=@(x) sin(x)/2 -(x.*cos(x))/2;
x=linspace(0,10);
y = f(x);
figure(1)
plot(x,y)
xlabel('x'), ylabel('y')
title('Analytical')
% %numerical
dy = @(x,y) [y(2) ; -y(1)+sin(x)];
[x,y]= ode45(dy,[0 10],[0 0]);
figure(2)
plot(x,y(: ,1))
hold on
plot(x,y(: ,2),'--')
xlabel('x'), ylabel('y')
title('numerical figure')
legend('y', 'dy^2/d^2x')
dy = @(t,y) [y(2)+y(1) ; sin(t)];
[t,y] = ode45(dy,[0 10],[0 0]);


%% Exercie 14.2

%%  Exercise 14.3
m = 100;
v0 = 20;
k = 40;
g = 9.82;
time = [0 10];
f = @(t,v) g - (k/m) * v.^2;
[x y] = ode45(f,time,v0);
speed = y(end)

plot(x,y)
xlabel('Time in seconds, s')
ylabel('Velocity v in m/s')

% when time moves forward the velocity goes towards 4.95m/s



%% Exercise 14.4

%% Exercise 14.5


%% Exercise 18.1

%% Exercise 18.2
%% 2b



%% 2c
%c
m = 1;
k = 1;
omega0 = sqrt(k/m);
omega = 1;
dy = @(t,y) [y(2) ; -(k/m) * y(1)+ cos(omega*t)/m];

[t,y ] = ode45(dy,  [0 50], [0 0]);
plot(t,y(:,1)), hold on

%% 2d
%d
m = 1;
k = 1;
c = 0.1;
omega0 = sqrt(k/m);
omega = 1;
dy = @(t, y) [y(2) ; -c*y(2)-y(1)+cos(omega*t) ]
[t,y ] = ode45(dy,  [0 50], [0 0]);
plot(t,y(:,1))


%% 2e                  % damping constant 
m = 1;
k = 1;
for c = 0:10
t = linspace(1,2);
Fext = 0.5*(((abs(t-1))/(t-1)-(abs(t-2))/(t-2))/m);
dy = @(t,y) [y(2) ; -k*y(1)-c*y(2)+Fext]; 
opt = odeset('InitialStep', 0.0033, 'MaxStep',0.0033);
[t,y] = ode45(dy,[0 10], [0 0],opt);
subplot(5,3,c+1)
plot(t,y(:,1)),hold on     % plot x(t) 
title([" c = ", num2str(c)])
end


%% Exercise 18.3

%% Exercise 18.4

%% Exercise 18.5


