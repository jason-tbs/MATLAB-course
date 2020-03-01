% function n = throwarrows

% n = input("Enter number of elemnts: ")
%  x = -1 + 2*rand(1,n);
%  y = -1 + 2*rand(1,n);
% circleArea = pi
% target(x,y,n);


%B
n = input("Enter number of elemnts: ")
a = input("Enter a value for a that is larger than zero: ") 
b = input("Enter a value for b that is larger than zero: ")  
x = -a + 2*a*rand(1,n); %% For b)
y = -b + 2*b*rand(1,n);  %% For b)
ellipsArea = a*b*pi
target(a,b,x,y,n)  %% For b)
