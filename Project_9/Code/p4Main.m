%%%%%%%%%%%%%  Main Function p4Main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply gabor filte to seprate different texture 
%
% Input Variables:
%      img2       MxN input 2D gray-scale image to be downsampled
%      fzero   MxN image full of zeroes
%      M, N    rows (M) and columns (N) in f
%      n       n times (original image:processed image)
% Returned Results:
%      img2Filt                result after applying gabor filter
%      filtDisplay            result after applying displayGabor
%      img2FiltSmooth          result after applying gaussianSmooth
%      img_final_show          result after applying segment and edge
% Processing Flow:
%      By calling different functions to get different results
%
%  Restrictions/Notes:
%      None  
%
%  Calling functions
%      gaborFilter, displayGabor, segment, gaussianSmooth
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/08/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear;

%% Question 1
%Part 1: img = 'texture2.gif', F = 0.059; Theta = 135 degrees; sigma = 8
img2 = imread('texture2.gif');
figure,img2=img2>0;
imshow(img2,[]);
imwrite(img2,'original.jpg');
img2Filt = gaborFilter(img2,0.059,135,8);
%Cast image to uint8 and display real portion
figure,mesh(img2Filt);
filtDisplay = displayGabor(img2Filt);
%Compute Gaussian Smoothing
img2FiltSmooth = gaussianSmooth(img2Filt,8);
x = 1:size(img2FiltSmooth,1);
y = 1:size(img2FiltSmooth,2);
[X,Y] = meshgrid(x,y);
figure, mesh(X,Y,img2FiltSmooth);
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
img_final=img_final>0;
img_seg = segment(img2FiltSmooth, img2, 0.04);
ed = edge(img_seg, 'canny', 0.5); 
img_final_show = img_final+ed;
figure;imshow(img_final_show);
imwrite(img_final_show,'final1.jpg');

%% Question 2
%Part 2: img = 'texture2.gif', F = 0.042; Theta = 0 degrees; sigma = 24
img2 = imread('texture1.gif');
figure,img2=img2>0;
imshow(img2,[]);
img2Filt = gaborFilter(img2,0.042,0,24);
%Cast image to uint8 and display real portion
x = 1:size(img2Filt,1);
y = 1:size(img2Filt,2);
[X,Y] = meshgrid(x,y);
figure, mesh(X,Y,img2Filt);
filtDisplay = displayGabor(img2Filt);
%Compute Gaussian Smoothing
img2FiltSmooth = gaussianSmooth(img2Filt,24);

x = 1:size(img2FiltSmooth,1);
y = 1:size(img2FiltSmooth,2);
[X,Y] = meshgrid(x,y);
figure, mesh(X,Y,img2FiltSmooth);
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
img_final=img_final>0;
img_seg = segment(img2FiltSmooth, img2,0.045);
ed = edge(img_seg, 'canny', 0.5); 

img_final_show = img_final+ed;
figure;imshow(img_final_show);
imwrite(img_final_show,'final2.jpg'); 
