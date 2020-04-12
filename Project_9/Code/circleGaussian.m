%%%%%%%%%%%%%  Function circleGaussian%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Apply circleGaussian on the particular image
%
% Input Variables:
%      sigma      variance for filter
% Returned Results:
%     new image after applying circleGaussian
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function G = circleGaussian(sigma)
%Compute discrete values for a 2D symettric circular gaussian distribution
%with standard deviation sigma
%Since this is discrete and non-infinite, it is an approximation.  We are
%computing 2 standard deviations in either direction (i.e. approximating
%95 percent of values in the gaussian distribution
G = zeros(4*sigma+1);
for i = 1:4*sigma+1
  for j = 1:4*sigma+1
    %Points need to be translated to the interval -2 sigma <= x <= 2 sigma
    k = i - 2*sigma - 1;
    l = j - 2 * sigma - 1;
    G(i,j) = 1/(2*pi*sigma^2) * exp(-(k^2 + l^2)/(2*sigma^2));
  end
end
