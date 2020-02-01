%%%%%%%%%%%%%  Function disk_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Generates the structuring element A 
%
% Input Variables:
%     r     radius of the disk
%      
% Returned Results:
%     A     Generate the structuring element A
%
% Processing Flow:
%     1.  Determine the diameter of the disk.
%     2.  Create matrix of zeros
%     3.  Scan the image and find the radial distance from the center. If
%     the distance is less or equal to specified radius then make pixel 1.
%     4.  Invert the image to create disk window
% 
%  Restrictions/Notes:
%     None
%
%  The following functions are called:
%     None
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/01/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ A ] = disk_lma( r )
s = 2*r;
A = zeros(s+1);

% Scan through horizontal and vertical pixels, if the radial distance from
% the center is less than or eqaul the specified R0 value, then make the 
% pixel to 1.
for i=1:(s+1)
    for j=1:(s+1)
        x = i - r - 1;
        y = j - r - 1;
        R  = sqrt((x).^2 + (y).^2);
        if R<=r
            A(i,j)=1;
        end
    end
end

% Reverse image
A = ~A;
end

