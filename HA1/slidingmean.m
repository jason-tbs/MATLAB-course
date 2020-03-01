% slidingmean.m
load T8183.mat
n = length(T);
k = input(' give value on k ')
plot(T)
hold on
for i = 1:n
    n1 = max(1,i-k);
    n2 = min(n,i+k);
    Tm(i) = mean(T(n1:n2));
end
plot(Tm,'r')
xlim([0 n])
ylabel('T i ^oC')