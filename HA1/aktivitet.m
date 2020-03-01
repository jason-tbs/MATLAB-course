%   aktivitet.m
%load aktivitet.mat
%a0 = [5000 ; 0.05 ; 20000 ; 0.1]; %Kolonnvektor'
[a,n] = gaussnewton(@fun, @dfun, a0, t, y, 1e-5)