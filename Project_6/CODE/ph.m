%%%%%%%%%%%%%  Function ph %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To get the histogramb pr(r) of image
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      M, N    rows (M) and columns (N) in f 
%      
% Returned Results:
%     a array storing values of pr(r)
%
% Processing Flow:
%      1.  Traverse every point on the image
%      2.  Plus 1 in the index equal to the gray value of the pixel in the array
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/01/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [p] = ph(f,M, N)

p = zeros(1,256); 
for i=1:M
    for j=1:N
        k = f(i,j);
        p(k+1) = p(k+1)+1;  % pr(r)
    end
end

end