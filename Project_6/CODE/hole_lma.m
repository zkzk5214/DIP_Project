%%%%%%%%%%%%%  Function hole_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Generates the structuring element B(W-A from notes) 
%
% Input Variables:
%     r     radius of the hole
%      
% Returned Results:
%     B     Generate the structuring element B(W-A from notes)
%
% Processing Flow:
%     1.  Determine the diameter of the disk.
%     2.  Create matrix of zeros
%     3.  Scan the image and find the radial distance from the center. If
%     the distance is less or equal to specified radius then make pixel 1.
%      
%  Restrictions/Notes:
%     None.
%
%  The following functions are called:
%     None
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        28/01/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ B ] = hole_lma( r )
d = 2*r;
B = zeros(d+1);

% Scan through horizontal and vertical pixels, if the radial distance from
% the center is less than or eqaul the specified R0 value, then make the 
% pixel to 1.
for i=1:(d+1)
    for j=1:(d+1)
        R  = sqrt((i-r-1).^2 + (j-r-1).^2);
        if R<=r
            B(i,j)=1;
        end
    end
end

end