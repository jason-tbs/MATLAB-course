%% Home assignment
%% Exercise 2.a
f = @(x) exp(-x.^2)
g = @(x) exp(-(x-1).^2)
x = linspace(-2,2);
y = f(x);
y1 = g(x);

plot(x,y,'blue'), hold on
plot(x,y1,'red')
grid on
xlabel('x')
ylabel('y')
title('Two functions, f and g')
legend('f(x)', 'g(x)')

%% Exercise 2.b
%a = x.^2 + x + 1;
%b = ((x-1).* (x-2));
%f = a./b;
f = @(x) (x.^2 + x + 1)./((x-1).*(x-2))
x1 = linspace(-2,1);
x2 = linspace(1,2);
x3 = linspace(2,5);
y = f(x1);
z = f(x2);
u = f(x3);
plot(x1,y,'blue')
hold on
plot(x2,z,'red')
hold on
plot(x3,u,'yellow')

ylim([-200 250])
grid on

%% Exercise 3
A = @(t1) 202 * exp(-0.42*t1)
f = @(t) 202 * exp(-0.42*t) - 101
t1 = 0:1:6;
t = linspace(0,6);
y = A(t1);
y1 = f(t);
plot(t,y1, 'red')
hold on
scatter(t1,y,'blue')
halfpoint = fzero(f,1.6)

%% Exercise 4
r = linspace(0,50);
A = sqrt(1/6.75);
P = @(r) A.*r.*exp(-r/3) .* (1 - 2/3.*r + 2/27 .* r.^2)
f = @(r) (A.*r.*exp(-r/3) .* (1 - 2/3.*r + 2/27 .* r.^2)).^2;
y = P(r);
I = integral(f, 0, Inf)
plot(r,y), grid on
root1 = fzero(P, 0)
root2 = fzero(P,1.8182)
root3 = fzero(P,6.969)

%% Exercise 5
f = @(x,y) exp(-(x.^2 + y.^2))
x = linspace(-2, 2);
y = linspace(-2, 2);

[X,Y] = meshgrid(x,y);
Z = exp(-(X.^2 + Y.^2));
figure(1)
mesh(X,Y,Z) % plot
xlabel('x'), ylabel('y'), zlabel('z')
figure(2)
contour(X,Y,Z)

%% Exercise 6
% t = -15:-1;
% f = @(x) x.^3
% f1 = 10.^t;
% y = f(x);
% plot(t,f1)

% f = @(x) x.^3;
% x = linspace(0,1);
% y = f(x);
% plot(x,y,'g')
% hold on;
% h = 10^(-15);
% df = (f(x+h)-f(x))./h;
% df2 = (f(x+h)-f(x-h))./(2*h);
% plot(x,df,'r',x,df2,'b')

f = @(x) x.^3;
x=linspace(0,1); 
plot(x,f(x),'r');
hold on
h = 1*10^(-13);  % h för litet ej bra.
df = (f(x+h)-f(x))/h;
df2 = ((f(x+h)-f(x-h))./(2.*h));
plot(x,df2,'b')
hold on
plot(x,df, 'k--')

%% Exercise 13.1 a


%% Exercise 2
% Exercise 2 part 2
load('CCD.MAT');
imagesc(C,[3,7]), colormap('gray')
for i=2:99
    for j=2:99
        if(C(i,j) == 0)
            C(i,j) = median(median(C(-1+i:i+1,-1+j:1+j)));
        end
    end
end
%D )
figure(2)
imagesc(C,[3,7]), colormap('gray')




%% Exercise 3
tol = input(' Give value of tol ')
T0 = (650/4)*ones(100,100); % initial distribution T0
T0(1,:) = 100;
T0(100,:) = 200; % set edge temp
T0(:,1) = 100;
T0(:,100) = 250; % set edge temp
T0(50:70,30:50) = 250; % set middle temp.
T1 = T0; % dimension T1
diff = Inf; % make sure to enter the loop
while diff > tol
    diff = 0; % set max difference to 0
    for i = 2:99
        for j = 2:99
            if(i >  50 && i <= 70) && (j > 30 && j < 50)
            else
                T1(i,j)=(T0(i+1,j)+T0(i-1,j)+T0(i,j+1)+T0(i,j-1))/4;
            end
            if abs(T1(i,j) - T0(i,j)) > diff
                diff = T1(i,j) - T0(i,j); % Update difference
               
            end
        end
    end
    imagesc(T1) % plot temp. distribution
    colormap('hot'), colorbar % color sclae
    pause(0.1)
    T0 = T1; % uppdate temp. distribution
end


%% Exercise 20.1
x = -1:0.2:1;
y = [0.04 0.06 0.1 0.2 0.5 1 0.5 0.2 0.1 0.06 0.04];
p = polyfit(x,y,10);
xip = linspace(-1,1); % x-values between -1 and 1
yip = polyval(p,xip); % values of the polynomial
figure(1)
plot(x,y,'o',xip,yip) % plot
legend('data points','n=10')
a = interp1(x,y,xip,'spline')
figure(2)
plot(x,y,'o',xip,a)

%% Exercise 20.2
%record

%% Exercise 20.3


%% Exercise 20.4   i ) 
load co2.data
whos 
%linear 
x = ([1:234]');
y = [co2];
A = [x.^0 x.^1 x.^2];
a = A\y
%fitted function, y =  339.9577x.^0    0.0325 x.^1     0.0001 x.^2
 plot(x,y, '+')
 hold on
 xm = 0:0.1:234;
 ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2;
 plot(xm,ym)
 

% Non linear 1 with polyfit
% x = ([1:234]');
% y = [co2];
% p = polyfit(x,y,2)
% plot(x,y, '+')
%  hold on
% xm = 0:0.1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

%% Exercise 20.4 ii)
load co2.data
whos 
% x = ([1:234]');
% y = [co2];
% p = polyfit(x,y,4) 
% plot(x,y, '+')
%  hold on
% xm = 0:0.1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

x = ([1:234]');
y = [co2];
k = (18*pi)/234;
A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x)];
a = A\y
plot(x,y, '+')
hold on
xm = 0:1:234;
ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm);
plot(xm,ym)


%% Exercise 20.4 iii)
load co2.data
whos 
% x = ([1:234]');
% y = [co2];
% k = 18*pi;
% A  = [x.^0 x.^1 x.^2 sin(k.*x) cos(k.*x) sin(2*k.*x) cos(2*k.*x)];
% p = polyfit(x,y,6)
% plot(x,y,'+'), hold on
% xm = 0:1:234;
% ym = polyval(p,xm);
% plot(xm,ym)

x = ([1:234]');
y = [co2];
k = (18*pi)/234;
A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x) sin(2*k*x) cos(2*k*x)];
a = A\y
plot(x,y, '+'), hold on
xm = 0:1:234;
ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm) + a(6)*sin(2*k*xm) + a(7)*cos(2*k*xm);
plot(xm,ym)

% x = ([1:234]');
% y = [co2];
% k = 18*pi;
% A  = [x.^0 x.^1 x.^2 sin(k.*x) cos(k.*x) sin(2*k.*x) cos(2*k.*x)];
% a = A\y
% plot(x,y, '+')
% hold on
% xm = 0:1:234;
% ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4).*sin(k.*xm).*xm.^0 + a(5).*cos(k.*xm).*xm.^0 + a(6).*sin(2*k.*xm).*xm.^0 + a(7).*cos(2*k.*xm).*xm.^0;
% plot(xm,ym)

%% Exercise 20.4 d)
load co2.data
whos
x = ([1:234]');
y = [co2];
k = (18*pi)/234;
A  = [x.^0 x.^1 x.^2 sin(k*x) cos(k*x) sin(2*k*x) cos(2*k*x)];
a = A\y

xm = 0:1:1000;
ym = a(1)*xm.^0 + a(2)*xm.^1 + a(3)*xm.^2 + a(4)*sin(k*xm) + a(5)*cos(k*xm) + a(6)*sin(2*k*xm) + a(7)*cos(2*k*xm);
s = spline(xm, ym, xm);
plot(xm, s)
t = 817;  % 26 * (2012-1981) + 11 (22 veckor till maj, en punkt varannan vecka)
st = s(817)
y1 = a(1)*t.^0 + a(2)*t.^1 + a(3)*t.^2 + a(4)*sin(k*t) + a(5)*cos(k*t) + a(6)*sin(2*k*t) + a(7)*cos(2*k*t)

