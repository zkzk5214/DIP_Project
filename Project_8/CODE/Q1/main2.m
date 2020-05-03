%%%%%%%%%%%%% proj3q1_5.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     (1) Implement the following filters to "disk" image for five
%     iterations
%        i. 5×5 mean
%        ii. 5×5 median
%        iii. 5×5 alpha-trimmed mean (? = 0.25) 
%        iv. 5×5 sigma filter (? = 20);
%        v. 5×5 symmetric nearest-neighbor mean.
%     (2)For each result give the gray-scale histogram
%     (3)For each result give the mean and standard deviation of the 
%        interior of the large disk region  
%
% Input Variables:
%     image       input 2D image
%      
% Returned Results:
%     image_i     image after 5 iterations 5×5 mean filtering
%     image_ii    image after 5 iterations 5×5 median filtering
%     image_iii   image after 5 iterations 5×5 alpha-trimmed mean filtering 
%     image_iv    image after 5 iterations 5×5 sigma filtering 
%     image_v     image after 5 iterations 5×5 symmetric nearest-neighbor 
%                 mean filtering
%
%  The following functions are called:
%     meanFilter
%     medianFilter
%     sigmaFilter
%     snnFilter
%     ph
%     m_and_d

%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/3/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear; close all;

image = imread('disk.gif');
% figure,imshow(image), title('Original');
p0 = ph(image); 

%filter
k = 5;
Filter = ones(k, k, 'uint8');

%% 5*5 mean
% From function meanFilter
image_i = image;

for i =1:5
    image_i = meanFilter(image_i, Filter);
end

% figure,imshow(image_i), title('Mean5');
% p1 = ph(image_i); 
[mean_i,standard_deviation_i] = m_and_d(image_i);

%% 5*5 median
% From function meanFilter
image_ii = image;

for i =1:5
    image_ii = medianFilter(image, Filter);
end

% figure,imshow(image_ii), title('Median5');
% p2 = ph(image_ii); 
[mean_ii,standard_deviation_ii] = m_and_d(image_ii);

%% 5×5 alpha-trimmed mean (alpha = 0.25)
% y_k = 1/13 summation(i=7 to 19) x(i)
image_iii = image;

for i=1:5
    temp = zeros(256);
    for j= 7:19
        B = ordfilt2(image_iii,j,ones(5,5),'symmetric');
        temp = temp+im2double(B);       
    end
    image_iii = im2uint8(temp/13);
end

% figure,imshow(image_iii), title('Alpha5');
% p3 = ph(image_iii); 
[mean_iii,standard_deviation_iii] = m_and_d(image_iii);

%% 5×5 sigma filter (sigma = 20)
image_iv = image;

sigmavalue=20;
for i = 1:5
image_iv = sigmaFilter(image_iv, sigmavalue,k);
end

% figure,imshow(image_iv), title('Sigma5');
% p4 = ph(image_iv); 
[mean_iv,standard_deviation_iv] = m_and_d(image_iv);

%% 5×5 symmetric nearest-neighbor mean.
image_v = image;

for i =1:5
image_v = snnFilter(image_v, k);
end

% figure,imshow(image_v), title('SNN5');
% p5 = ph(image_v); 
[mean_v,standard_deviation_v] = m_and_d(image_v);