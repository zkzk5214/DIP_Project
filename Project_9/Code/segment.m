%%%%%%%%%%%%%  Function segment%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      to creat an Anisotropic Diffusion filter by applying exponential
%      function
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      lam,k   parameter of the Anisotropic Diffusion filter
%      iter    iteration times
% Returned Results:
%     new image after applying Anisotropic Diffusion filter
%
% Processing Flow:
%      1.  Calculate the divergence of the image in four direction
%      2.  Apply inverse quadratic function in the filter
%      3.  Calculate the final result
%  
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        03/25/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ img_seg ] = segment(GEF, image,the)
f = image;
g = GEF;
img_s=zeros(size(f,1),size(f,2));
for x=1:size(g,1)
    for y=1:size(g,2)
        if g(x,y)>=the
            img_s(x,y)=1;
        end
    end
end
img_seg = img_s;
%img_seg=double(f).*img_s;

end

