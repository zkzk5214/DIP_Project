%%%%%%%%%%%%% Main Function Q3Q4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1.Apply gabor filte to seprate different texture 
%
% Input Variables:
%      img2       MxN input 2D gray-scale image to be downsampled
%      fzero   MxN image full of zeroes
%      M, N    rows (M) and columns (N) in f
%      n       n times (original image:processed image)
% Returned Results:
%     img2Filt                result after applying gabor filter
%     filtDisplay            result after applying displayGabor
%     img2FiltSmooth          result after applying gaussianSmooth
%     img_final_show          result after applying segment and edge
% Processing Flow:
%    By calling different functions to get different results
%
%  Restrictions/Notes:
%      none  
%
%  Calling functions
%     gaborFilter, displayGabor, segment, gaussianSmooth
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/08/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear;
%% Question 3
%Part 3: img = 'd9d77.gif', F = 0.063; Theta = 60 degrees; sigma = 36
img2 = imread('d9d77.gif');
figure, imshow(img2,[]);
img2Filt = gaborFilter(img2,0.063,60,36);
%Cast image to uint8 and display real portion

figure, mesh(img2Filt);
 
filtDisplay = displayGabor(img2Filt);
%Compute Gaussian Smoothing
img2FiltSmooth = gaussianSmooth(img2Filt,36);

figure, mesh(img2FiltSmooth);
 
displaySmooth = displayGabor(img2FiltSmooth);

img_s=zeros(size(img2,1),size(img2,2));
for x=1:size(img2FiltSmooth,1)
    for y=1:size(img2FiltSmooth,2)
        if img2FiltSmooth(x,y)>0
            img_s(x,y)=1;
        end
    end
end
img_final=double(img2).*img_s;
 
img_seg = segment(img2FiltSmooth, img2,0.8);
ed = edge(img_seg, 'canny', 0.3); 
 

img_final_show = img_final+ed*255;
figure;imshow(img_final_show,[]);
figure;imshow(img_seg);

%% Question 4
%Part 3: img = 'd9d77.gif', F = 0.6038; Theta = -50.5 degrees; sigma = 8
img2 = imread('d4d29.gif');
figure, imshow(img2,[]);
img2Filt = gaborFilter(img2,0.6038,50,8);
%Cast image to uint8 and display real portion

figure, mesh(img2Filt);
 

filtDisplay = displayGabor(img2Filt);
%Compute Gaussian Smoothing
img2FiltSmooth = gaussianSmooth(img2Filt,40);

figure, mesh(img2FiltSmooth);
 
displaySmooth = displayGabor(img2FiltSmooth);

img_s=zeros(size(img2,1),size(img2,2));
for x=1:size(img2FiltSmooth,1)
    for y=1:size(img2FiltSmooth,2)
        if img2FiltSmooth(x,y)>0
            img_s(x,y)=1;
        end
    end
end
img_final=double(img2).*img_s;
 
img_seg = segment(img2FiltSmooth, img2,0.024);
ed = edge(img_seg, 'canny', 0.5); 
 
img_final_show = img_final+ed*255;
figure;imshow(img_final_show,[]);
figure;imshow(img_seg);
