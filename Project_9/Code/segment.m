%%%%%%%%%%%%%  Function segment%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      lam,k   parameter of the Anisotropic Diffusion filter
%      iter    iteration times
%
% Returned Results:
%     
% Processing Flow:
%  
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/08/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ img_seg ] = segment(GEF, Image, Threshold)

img_s=zeros(size(Image,1),size(Image,2));

for x=1:size(GEF,1)
    for y=1:size(GEF,2)
        
        if GEF(x,y)>=Threshold
            img_s(x,y)=1;
        end
        
    end
end

img_seg = img_s;
%img_seg=double(f).*img_s;

end

