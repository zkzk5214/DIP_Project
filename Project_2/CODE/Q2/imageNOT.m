function imageNOT(A)
%IMAGELOG For image A size M*N, make image do logic
%  operate (NOT) pixels by pixels.

%  Read image
I=imread(A);

%  Returens the number of rows and columns in M,N
[M, N] = size(I);
I3 = zeros(M,N);

%  Logic operate 
for x = 1:M
    for y = 1:N

        %NOT
        if I(x,y)==0
            I3(x,y) = 1;
        else
            I3(x,y) = 0;
        end
 
    end
end

% figure,imshow(I3);

end
