%%%%%%%%%%%%%  Function gaussianSmooth%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      to do the gaussianSmooth on a particular image
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

function [ smooth ] = gaussianSmooth(Image,var)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    Kernel = circleGaussian(var);
    smooth = convolve2D(Image,Kernel);
end

