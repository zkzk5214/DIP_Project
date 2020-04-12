function findim=findspokes(im,thre1,thre2);
[M,N]=size(im);
imnew=zeros(M,N);

for i=1:M
    for j =1:N
        if im(i,j)>thre1 && im(i,j)<thre2
            imnew(i,j)=im(i,j);
        end
    end
end
findim=imnew;
        

