%%%%%%%%%%%%%  Function circleGaussian%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Purpose:  
%     Apply circleGaussian on the particular image
%
%  Input Variables:
%     sigma      variance for filter
%  Returned Results:
%     New image after applying circleGaussian
%
%  The following functions are called:
%
%  Restrictions/Notes:
%     Compute discrete values for a 2D symettric circular gaussian 
%     distribution with standard deviation sigma. Since this is discrete
%     and non-infinite, it is an approximation. We are computing 2 standard 
%     deviations in either direction (i.e. approximating 95 percent of  
%     values in the gaussian distribution
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function G = circleGaussian(Sigma)
G = zeros(4*Sigma+1);

for i = 1:4*Sigma+1
    for j = 1:4*Sigma+1
        
        % Points need to be translated to the interval 
        % -2 sigma <= x <= 2 sigma
        x = i - 2*Sigma - 1;
        y = j - 2 * Sigma - 1;
        G(i,j) = 1/(2*pi*Sigma^2) * exp(-(x^2 + y^2)/(2*Sigma^2));
        
    end
end

end
