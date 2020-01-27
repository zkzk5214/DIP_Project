%%%%%%%%%%%%%%%%%%% output_q1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PROJECT 2
% Module: Q1
% Usage: Main MATLAB code file for FIND THE BRIGHTEST REGION
% Purpose: 
% 1. Find the brighted region 
% 2. color label
% 3. find the largest 3 region
% Input variables: for (c), 188 represents the threshold of labeled image,
% you can input what ever threshold you like
% Returned results: 
% 'Q1a_fthresh.tif' threshold image
% 'Q1b_fRGB.tif' color labeled image
% 'Q1c_LargestReg.tif' three largest region
% Processing flow: 
% 1.	input threshold
% 2.	color label
% 3.	select 3 regions by employing largest3reg Function
%  Author: Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:9/26/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;close all;

f=imread('lenna.gif');
[M, N] = size(f);

%------(a)----------------------------------------------------------------%
%  For image f with size M*N, choose a threshold 188 so that turn the pixels 
%  gray-level above 188 into one otherwise into zero.

threshold=188;
for x = 1:M
    for y = 1:N
        if f(x,y)>=threshold % threshold = 188
            f(x,y)=1;
        else
            f(x,y)=0;        
        end
    end
end
fthresh=f;
figure,imshow(fthresh,[]);title('fthresh');saveas(gcf,'Q1a_fthresh.tif');

%------(b)----------------------------------------------------------------%
%  Find the connected components of the thresholded image using "bwlabel",
%  then display the labeled image with colored components using "label2rgb".

[flabel,sum] = bwlabel(fthresh,8);
fRGB = label2rgb(flabel);

figure,imshow(fRGB);title('fRGB');saveas(gcf,'Q1b_fRGB.tif');

%------(c)----------------------------------------------------------------%
%  Measure is of connected components using "largest3reg" and sorts the 
%  stats area domain by descending, then save the 3 largest components  
%  of the labeled image and delete the other components by setting  
%  constituent pixels to 0

image=largest3reg(threshold);
title('3 largest components');saveas(gcf,'Q1c_LargestReg.tif')

