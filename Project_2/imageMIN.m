function E = imageMIN(C,D)
%IMAGEMIN For image C and D with size M*N, assigns the minimum pixels of 
%  the two images(C, D) to the output image(E).

%  Read in image C, D then get the first "layer", if the image is in tif 
%  format, returns the number of rows and columns in M, N.
I = imread(C);I = I(:,:,1);
J = imread(D);J = J(:,:,1);
[M, N] = size(I);
E = zeros(M,N);

% Compare and choose the minimum pixels. 
for x = 1:M
    for y = 1:N
        if (I(x,y) < J(x,y))
            E(x,y) = I(x,y);
            %disp(I(x,y))
        else
            E(x,y) = J(x,y);
            %disp(J(x,y))
            
        end
    end
end
end