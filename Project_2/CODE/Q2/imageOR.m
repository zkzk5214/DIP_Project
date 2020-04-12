function imageOR(A,B)
%IMAGELOG For image A and B with size M*N, make two images do logic
%  operate (OR) pixels by pixels.

%  Read image
I=imread(A);
J=imread(B);

%  Returens the number of rows and columns in M,N
[M, N] = size(I);

%  Logic operate 
for x = 1:M
    for y = 1:N

        %OR
        if (I(x,y)==0)&&(J(x,y)==0)
            I2(x,y) = 0;
        elseif (I(x,y)==1)&&(J(x,y)==0)
            I2(x,y) = 1;
        elseif (I(x,y)==0)&&(J(x,y)==1)
            I2(x,y) = 1;
        else
            I2(x,y) = 1;
        end

    end
end

%  Show the image
figure,imshow(I2);
end
