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
% The following functions are called:
%     ErosionOwn
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/1/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function imnew= ErosionOwn(im,kernel)
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

