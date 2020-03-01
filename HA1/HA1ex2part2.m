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

