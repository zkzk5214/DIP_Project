%%%%%%%%%%%%% proj3q1_1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     (1) Implement the following filters to "disk" image
%        i. 5×5 mean
%        ii. 5×5 median
%        iii. 5×5 alpha-trimmed mean (? = 0.25) 
%        iv. 5×5 sigma filter (? = 20);
%        v. 5×5 symmetric nearest-neighbor mean.
%
% Input Variables:
%     image       input 2D image
%      
% Returned Results:
%     image_i     image after 5×5 mean filtering
%     image_ii    image after 5×5 median filtering
%     image_iii   image after 5×5 alpha-trimmed mean filtering (? = 0.25)
%     image_iv    image after 5×5 sigma filtering (? = 20)
%     image_v     image after 5×5 symmetric nearest-neighbor mean filtering
%
%  The following functions are called:
%     meanFilter
%     medianFilter
%     sigmaFilter
%     snnFilter
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/3/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear; close all;

image = imread('disk.gif');
% figure,imshow(image), title('Original');

% Filter Size
k = 5;
Filter = ones(k, k, 'uint8');
%% 5*5 mean
% From function meanFilter
image_i = meanFilter(image, Filter);
% figure,imshow(image_i), title('Mean1');

% From MATLAB
% filter_M = fspecial('average',[5,5]);
% image_i_M=imfilter(image,filter_M,'symmetric');
% figure,imshow(image_i_M), title('5*5 mean');

%% 5*5 median
% From function meanFilter
image_ii = medianFilter(image, Filter);
% figure,imshow(image_ii), title('Median1');

% From MATLAB
% image_ii_M = medfilt2(image,[5 5],'symmetric');
% figure,imshow(image_ii_M), title('5*5 median');

%% 5×5 alpha-trimmed mean (alpha = 0.25)
% y_k = 1/13 summation(i=7 to 19) x(i)
temp = zeros(256);

for i= 7:19
B = ordfilt2(image,i,ones(5,5),'symmetric');
temp = temp+im2double(B);
end

image_iii = im2uint8(temp/13);
% figure,imshow(image_iii), title('Alpha1');

%% 5×5 sigma filter (sigma = 20)
sigmavalue=20;
image_iv = sigmaFilter(image, sigmavalue,k);
% figure,imshow(image_iv), title('Sigma1');

%% 5×5 symmetric nearest-neighbor mean.
image_v = snnFilter(image, k);
% figure,imshow(image_v), title('SNN1');
