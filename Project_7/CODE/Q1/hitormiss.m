%%%%%%%%%%%%%  Function hitormiss %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     apply hit-or-miss to image
%
% Input Variables:
%      f       MxN input 2D gray-scale image
%      num     indix of structuring element Bi    
%
% Returned Results:
%     Image after hit-or-miss operation 
%
% Restrictions/Notes:
%     This function takes an 8-bit image as first input.
%     This function takes an int 1-8 as second input.
%
% The following functions are called:
%     diskB
%     ErosionOwn
%     DilationOwn
%     compare_lma
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        21/2/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [output] = hitormiss(f,num) 

B_f=diskB(num,1);    % B_f
B_b=diskB(num,-1);    % B_b

temp1 = ErosionOwn(f,B_f);   % Computing B_f erosion X
temp2 = DilationOwn(f,B_b);   % Computing B_b dilation X
output=compare_lma(temp1,temp2);   % Do subtract

function imnew = DilationOwn(im,kernel)
%%%%%%%%%%%%%  Function DilationOwn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     apply dilation to image
%
% Input Variables:
%      f       MxN input 2D gray-scale image
%      kx,ky   rows (kx) and columns (ky) in kernel
%      ix,iy   rows (ix) and columns (iy) in im
%      i       x coordinate of a pixel
%      j       y coordinate of a pixel   
%
% Returned Results:
%     Image after dilation 
%
% Restrictions/Notes:
%     This function takes an 8-bit image as input.  
%
% The following functions are called:
%     DilationOwn
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the outer border
[kx,ky]=size(kernel);
sx=(kx-mod(kx,2))/2;
sy=(ky-mod(ky,2))/2;

[ix,iy]=size(im);
imnew=im;

% Start at good point
for i=sx+1:ix-sx-1
    for j=sy+1:iy-sy-1
        imblock=im(i-sx:i+sx,j-sy:j+sy);
        
        andresult=kernel&imblock;
        ar=sum(sum(andresult));
        if ar>0
            imnew(i,j)=255;
        else
            imnew(i,j)=0;
        end
    end
end
end

function imnew = ErosionOwn(im,kernel)
%%%%%%%%%%%%%  Function ErosionOwn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     apply erosion to image
%
% Input Variables:
%      f       MxN input 2D gray-scale image
%      kx,ky   rows (kx) and columns (ky) in kernel
%      ix,iy   rows (ix) and columns (iy) in im
%      i       x coordinate of a pixel
%      j       y coordinate of a pixel   
%
% Returned Results:
%     Image after erosion
%
% Restrictions/Notes:
%     This function takes an 8-bit image as input.  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the outer border
[kx,ky]=size(kernel);
sx=(kx-mod(kx,2))/2;
sy=(ky-mod(ky,2))/2;

[ix,iy]=size(im);
imnew=im;

% Reverse image
for i=1:ix
    for j=1:iy
        if im(i,j)==0
           im(i,j)=255;
        else
           im(i,j)=0;
        end
    end
end

% Start at good point
for i=sx+1:ix-sx-1
    for j=sy+1:iy-sy-1
        imblock=im(i-sx:i+sx,j-sy:j+sy);
        andresult=kernel&imblock;
        ar=sum(sum(andresult));
        if ar>0
            imnew(i,j)=255;
        else
            imnew(i,j)=0;
        end
    end
end

% Reverse back
for i=1:ix
    for j=1:iy
        if imnew(i,j)==0
           imnew(i,j)=255;
        else
           imnew(i,j)=0;
        end
    end
end

end

function [ temps ] = compare_lma( temp2,temp3 )
%%%%%%%%%%%%%  Function compare_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes two images 
%
% Input Variables:
%      temp2    mXn size of a 2-D input image 
%      temp3    mXn size of a 2-D input image
% 
% Returned Results:
%      temps   mXn size of a 2-D ouput image
% 
% Processing Flow:
%      1.  Create a mXn temps image with gray level 1(white).
%      2.  Check pixel by pixel grey value of two image.
%      3.  If grey level in both images are zero then put zero in the
%      particular pixel of image temps
% 
%  Restrictions/Notes:
%      This function inputs 2 binary images
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m,n]=size(temp2);
temps = temp2;

for i=1:m
    for j=1:n
        if temp2(i,j)&& temp3(i,j)
            temps(i,j) = 0;
        end
    end
end
end

end
