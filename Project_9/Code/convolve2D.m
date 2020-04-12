%%%%%%%%%%%%%  Function convolve2D%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     Apply convolution on the particular image by the given kernel
%
% Input Variables:
%      image       MxN input 2D gray-scale image
%      kernel     2D gray-scale image
% Returned Results:
%     new image after applying convolution by the given kernel
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/09/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function I = convolve2D(Image,Kernel)
%Compute 2D convolution of image by the given kernel
%Zero out pixels too near border to compute
width = size(Kernel,1); %assume Kernel is symmetric
offset = floor(width/2) + 1;
dimensions = size(Image);
I = double(zeros(dimensions));
for i = offset:dimensions(1)-offset
  for j = offset:dimensions(2) - offset
    %Extract window for current mask position
    window = Image(i-(offset-1):i+(offset-1),j-(offset-1):j+(offset-1));
    mat = Kernel .* double(window);
    I(i,j) = sum(sum(mat)); %/sum(sum(Kernel))
  end
end
end