function [hist] = ph(image_in)
%%%%%%%%%%%%%  Function ph  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     To get the histogramb pr(r) of image
%
% Input Variables:
%     f       256x256 size of a 2-D input image  
%      
% Returned Results:
%     A array storing values of pr(r)
%
% Processing Flow:
%      1.  Traverse every point on the image
%      2.  Plus 1 in the index equal to the gray value of the pixel in the 
%          array
%
%  Author:      Zekai Liu, Wenrui Wang, Naichao Yin
%  Date:        27/03/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hist = zeros(1,256); 

for i=1:256
    for j=1:256
        k = image_in(i,j);
        hist(k+1) = hist(k+1)+1; % calculate Prob of each grayscale
    end
end

figure,bar(hist);
end