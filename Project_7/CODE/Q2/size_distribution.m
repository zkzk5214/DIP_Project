%%%%%%%%%%%%%  Function size_distribution %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Compute size_distribution of image, B is 3*3 square
%
% Input Variables:
%      imnew       MxN input 2D gray-scale image
%      r           computing times    
% Returned Results:
%     Image after size_distribution
%
%  Restrictions/Notes:
%      This function takes an 8-bit image as input.  
%
%  The following functions are called:
%     DiationOwn erosion
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        20/2/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function imnew=size_distribution(im,r)
if r==0
    imnew=im;
else
    kernelr=ones(2*r+1);
    im1=erosion(im,kernelr);
    imnew=DilationOwn(im1,kernelr);
end

end

