function imageXOR(A,B)
%IMAGELOG For image A and B with size M*N, make two images do logic
%  operate (XOR) pixels by pixels.

%  Read image
I=imread(A);
J=imread(B);

%  Returens the number of rows and columns in M,N
[M, N] = size(I);

%  Logic operate 
for x = 1:M
    for y = 1:N

        %XOR
        if I(x,y) == J(x,y)
            I4(x,y) = 0;
        else
            I4(x,y) = 1;
        end
    end
end

%  Show the image
figure,imshow(I4);

end
