%%%%%%%%%%%%%  Function gefGenerator %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Generate a 2D discrete GEF with width 4sigma + 1
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      lam,k   parameter of the Anisotropic Diffusion filter
%      iter    iteration times
%
% Returned Results:
%      New image after GEF  
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [GEF] = gefGenerator(F,theta,sigma)
theta = theta * pi / 180;
Gaussian = circleGaussian(sigma);
Exponential = zeros(4*sigma+1);

for m = 1:4*sigma+1
    for n = 1:4*sigma+1
        % Points need to be translated to the interval
        % -2 sigma <= x <= 2 sigma
        k = m - 2*sigma - 1;
        l = n - 2 * sigma - 1;
        Exponential(m,n) = exp(2*pi*1i*F*(k*cos(theta) + l * sin(theta)));
    end
end

GEF = Gaussian .* Exponential;

end
