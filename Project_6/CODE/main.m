%%%%%%%%%%%%% Project1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     (1)Filtering the salt pepper noise 
%     (2)Generating disk and hole for small and big disk
%     (3)Computing hit and miss transforms
%
% Input Variables:
%     f       input 2D image
%     M, N    rows and columns in f
%      
% Returned Results:
%     f1        binary image
%     X        image after reducing noise
%     temp     image after erosion by Bs
%     temp2    image after dialation by Bs
%     f9       the final result
%
%  The following functions are called:
%     DilationOwn
%     ErosionOwn
%     disk_lma
%     hole_lma
%     compare_lma
%     ph
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        27/1/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1) Read in image "RandomDisks-P10.jpg" into array "f", get 2D dimensions
clc;clear;close all;

f=imread('RandomDisks-P10.jpg');
f=rgb2gray(f);  % Converts the truecolor image RGB to the grayscale image
disp('read input image and convert to 2-D image')
figure;imshow(f);title('input image');

%% 2) Thresholding to 0 and 1
[M, N] = size(f);
f1 = zeros(M,N);

% Get the histogramb pr(r) of image f
figure;
p1 = ph(f,M,N); 
bar(p1);

% Threshold is 127
for x = 1 : M
    for y = 1 : N
        if f(x,y) > 127
            f1(x,y) = max(f(x,y),255);
        else
            f1(x,y) = 0;
        end
    end
end
%f1=f1>1;
disp('thresholded image');
figure;imshow(f1);title('thresholded image');

%% 3) Filtering the salt and pepper noise. 
% Comment this part if image with size of the filter to remove noise;
% Size set as 3*3
kernel=zeros(3,3);
for x=1:3
    for y=1:3
        kernel(x,y)=1;
    end
end

% Opening: the dilation of the erosion of f by a structuring element kernel
f2=DilationOwn(ErosionOwn(f1,kernel),kernel);   

% Closing: the erosion of the dilation of f by a structuring element kernel
X=ErosionOwn(DilationOwn(f2,kernel),kernel);   

figure;imshow(X);title('cleaned main image');

% Do not apply any denoise operation
% X = f1;

%% 4) generating disk and hole for small and big disk
disp('generating masks..')
% Generated disk A for smallest disk
As=disk_lma(10); As = double(As);
% Generated disk A for biggest disk
Ab=disk_lma(36); Ab = double(Ab);
% Generated w-a mask (B) for smallest disk
Bs=hole_lma(8); Bs = double(Bs);
 % Generated w-a mask (B) for biggest disk
Bb=hole_lma(31); Bb = double(Bb);

%% 5) computing hit and miss for smallest and biggest disk
% Smallest
X=~X;   % Reverse image
temp = ErosionOwn(X,Bs);   % Computing X minksub A using number of 1s in A
temp2 = DilationOwn(X,As);   % Computing X minksum B
out=compare_lma(temp,temp2);   % Compare the result of minksum and minksub

% Biggest
temp = ErosionOwn(X,Bb);    % Computing X minksub A using number of 1s in A
temp2 = DilationOwn(X,Ab);  % Computing X minksum B
out1=compare_lma(temp,temp2);   % Compare the result of minksum and minksub

%% Comapre and magnify the result to get desired result

for i = 1:M
    for j = 1:N
        % Get location of biggest disks
        if (i<33)||(j<33)||((M-i)<33)||((N-j)<33)
            out1(i,j) = 0;
        end
        
        % Get location of smallest disks
        if (i<10)||(j<10)||((M-i)<10)||((N-j)<10)
            out(i,j) = 0;
        end
    end
end

% Combine the location of both above
union_result = zeros(M,N,'uint8');
for i = 1:M
    for j = 1:N
        if out(i,j) || out1(i,j)
            union_result(i,j) = 255;
        end
    end
end

figure;
imshow(out);title('location of smallest disks');
figure;
imshow(out1);title('location of biggest disks');
figure;
imshow(union_result);title('location of smallest and biggest disks');

%% Restore the biggest and smallest disks
f9 = union_result;

% Repeat 50 times
for i=1:50
    f9 = DilationOwn(f9,kernel);
    f9 = f9&X;
end

% Reverse back
f9 = ~f9;
figure,imshow(f9);