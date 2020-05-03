%%%%%%%%%%%%%  Function gaussianSmooth%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Gaussian Smoothing on a particular image
%
% Input Variables:
%      Image       MxN input 2D gray-scale image 
%      var         the parameter of circle Gaussion
% Returned Results:
%     new image after applying circleGaussian
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/08/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ Smooth ] = gaussianSmooth(Image,var)

    Kernel = circleGaussian(var);
    Smooth = convolve2D(Image,Kernel);
    
end

