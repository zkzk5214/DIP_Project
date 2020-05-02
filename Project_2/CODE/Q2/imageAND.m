function imageAND(A,B)
%IMAGELOG For image A and B with size M*N, make two images do logic
%  operate (AND) pixels by pixels.

%  Read image
I=imread(A);
J=imread(B);

%  Returens the number of rows and columns in M,N
[M, N] = size(I);
I1 = zeros(M,N);

%  Logic operate 
for x = 1:M
    for y = 1:N

        %AND
        if (I(x,y)==0)&&(J(x,y)==0)
            I1(x,y) = 0;
        elseif (I(x,y)==1)&&(J(x,y)==0)
            I1(x,y) = 0;
        elseif (I(x,y)==0)&&(J(x,y)==1)
            I1(x,y) = 0;
        else
            I1(x,y) = 1;
        end
        
    end
end

% figure,imshow(I1);

end
