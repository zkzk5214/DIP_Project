%%%%%%%%%%%%%  Function gaborFilter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Apply gaborFilter on the particular image
%
% Input Variables:
%      image       MxN input 2D gray-scale image
%      F          pixel frequency for the filter
%      theta      angle for filter in degrees
%      sigma      variance for filter
% Returned Results:
%     new image after applying gabor filter
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ Ifilt ] = gaborFilter(Image,F,theta,sigma)
%   Perform gaborFiltering on the input Image
%   Inputs: Image: image to be modified
%   	F: pixel frequency for filter
%	theta: angle for filter in degrees
%	sigma: variance for filter
    GEF = gefGenerator(F,theta,sigma);
    Ifilt = convolve2D(Image,GEF);
    Ifilt = abs(Ifilt);
end

