%%%%%%%%%%%%%  Function diskB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Create the structuring element Bi 
%
% Input Variables:   
%      num     indix of structuring element Bi    
%      flag    1 for foreground B_f ; -1 for background B_b
%      
% Returned Results:
%      Structuring element Bi 
%
% Restrictions/Notes:
%     This function takes an int 1-8 as first input.
%     This function takes an int -1;1 as second input.
%
% The following functions are called:
%     None
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        21/2/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A] = diskB(num,flag)

A = zeros(3);

% Create Bi, i == num
if num ==1
    A(1,1) = -1*flag;   A(1,2) = -1*flag;   A(1,3) = -1*flag;
    A(2,1) = 0;         A(2,2) = 1*flag;    A(2,3) = 0;
    A(3,1) = 1*flag;    A(3,2) = 1*flag;    A(3,3) = 1*flag;
elseif num == 2
    A(1,1) = 0;         A(1,2) = -1*flag;   A(1,3) = -1*flag;
    A(2,1) = 1*flag;    A(2,2) = 1*flag;    A(2,3) = -1*flag;
    A(3,1) = 1*flag;    A(3,2) = 1*flag;    A(3,3) = 0;
elseif num == 3
    A(1,1) = 1*flag;    A(1,2) = 0;         A(1,3) = -1*flag;
    A(2,1) = 1*flag;    A(2,2) = 1*flag;    A(2,3) = -1*flag;
    A(3,1) = 1*flag;    A(3,2) = 0;         A(3,3) = -1*flag;
elseif num == 4
    A(1,1) = 1*flag;    A(1,2) = 1*flag;    A(1,3) = 0;
    A(2,1) = 1*flag;    A(2,2) = 1*flag;    A(2,3) = -1*flag;
    A(3,1) = 0;         A(3,2) = -1*flag;   A(3,3) = -1*flag;
elseif num == 5
    A(1,1) = 1*flag;    A(1,2) = 1*flag;    A(1,3) = 1*flag;
    A(2,1) = 0;         A(2,2) = 1*flag;    A(2,3) = 0;
    A(3,1) = -1*flag;   A(3,2) = -1*flag;   A(3,3) = -1*flag;
elseif num == 6
    A(1,1) = 0;         A(1,2) = 1*flag;    A(1,3) = 1*flag;
    A(2,1) = -1*flag;   A(2,2) = 1*flag;    A(2,3) = 1*flag;
    A(3,1) = -1*flag;   A(3,2) = -1*flag;   A(3,3) = 0;
elseif num == 7
    A(1,1) = -1*flag;   A(1,2) = 0;         A(1,3) = 1*flag;
    A(2,1) = -1*flag;   A(2,2) = 1*flag;    A(2,3) = 1*flag;
    A(3,1) = -1*flag;   A(3,2) = 0;         A(3,3) = 1*flag;
elseif num == 8
    A(1,1) = -1*flag;   A(1,2) = -1*flag;   A(1,3) = 0;
    A(2,1) = -1*flag;   A(2,2) = 1*flag;    A(2,3) = 1*flag;
    A(3,1) = 0;         A(3,2) = 1*flag;    A(3,3) = 1*flag;
end

% Set pixel<0 to 0
for x=1:3
    for y = 1:3
        if A(x,y) <0
            A(x,y) = 0;
        end
    end
end

end


