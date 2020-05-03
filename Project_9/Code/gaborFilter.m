%%%%%%%%%%%%%  Function gaborFilter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Perform gaborFiltering on the input Image
%
% Input Variables:
%     Image       MxN input 2D gray-scale image
%     F           pixel frequency for the filter
%     theta       angle for filter in degrees
%     sigma       variance for filter
% Returned Results:
%     new image after applying gabor filter
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ Ifilt ] = gaborFilter(Image,F,Theta,Sigma)

    GEF = gefGenerator(F,Theta,Sigma);
    Ifilt = convolve2D(Image,GEF);
    Ifilt = abs(Ifilt);
    
end

