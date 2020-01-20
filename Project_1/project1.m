%%%%%%%%%%%%% project1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Q1
% Usage: Main MATLAB code file for interpolating images using nearest-neighbor method
% Purpose: 
% 1. Downsampling and upsampling the 512 x512 pixel-image. 
% 2. Do nearest neighbor interpolation for several spatial resolution images and save to file
% Input variables: No need to input variables for Q1 
% Returned results: 
% Q1 256----Upsampled image by interpolating 256x256 pixel-image
% Q1 128----Upsampled image by interpolating 128x128 pixel-image
% Q1 32----Upsampled image by interpolating 32x32 pixel-image
% Processing flow: 
% 1.	Downsample to determined resolutions. 
% 2.	Upsample using nearest neighbor interpolation
% 3.	Export the 512 x512 image

%Module: Q2
% Usage: Main MATLAB code file for interpolating images using bilinear method
% Purpose: 
% 1. Downsampling and upsampling the 512 x512 pixel-image. 
% 2. Do bilinear interpolation for 32 x 32 pixel-image and save to file
% Input variables: No need to input variables for Q2
% Returned results: 
% Q2 32----Upsampled image by interpolating 32x32 pixel-image
% Processing flow: 
% 1.	Downsample to 32 x32 resolutions. 
% 2.	Upsample using bilinear interpolation
% 3.	Export the 512 x512 image

% Module: Q3
% Usage: Main MATLAB code file for quantization images 
% Purpose: 
% Change the gray-level quantization of the original 512 x 512 image by reducing the number
% of bits per pixel from 8 to 7, 6, 5, 4, 3, 2 and 1 bits/pixel
% Input variables: No need to input variables for Q3
% Returned results: 
% Figure 'Q3-N-bit' -----quantization by reducing the pixel to N bits/pixel. 
% Processing flow: 
% 1.	Divide the pixels of the original image by 2n to change the gray-level quantization of the original image from 8 to (8-n) bits/pixel.
% 2.	Then Multiply n to Make the gray levels span the 8-bit range in the new image.
% 
% Module: Q4
% Usage: Main MATLAB code file for interpolaration and quantization images for 256x256 and 6bits
% Purpose: 
%   1. Interpolated the 25 x256 to 512 x512 use bilinear interpolation
%   2. Change the gray-level quantization of the original 512 x 512 image by reducing the number
% of bits per pixel  6 bits/pixel
% Input variables: No need to input variables for Q4
% Returned results: 
% Figure 'Q4-256-6-bit' -----interpolate the image from 256x256 to 512x512
% and quantization by reducing the pixel to 6 bits/pixel. 
% Processing flow: 
% 1.    interpolate the 256 x256 to 512x 512
% 2. 	Divide the pixels of the original image by 2n to change the gray-level quantization of the original image from 8 to (8-n) bits/pixel.
%       Then Multiply n to Make the gray levels span the 8-bit range in the new image.
% 


%  Author: Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:9/13/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out all memory
clc;clear;close all; 

%  Read in image "walkbridge.tif" into array "f" then get the first "layer"?
%     of the tif image and convert it to MATLAB double precision
%  Returns the number of rows and columns in M, N.

f = imread('walkbridge.tif');
f = f(:,:,1);
f256 = zeros(256);
f128 = zeros(128);
f32 = zeros(32);
f512 = zeros(512);
[M, N] = size(f);

%------Q1-----------------------------------------------------------------%
%  For image f with size M*N, sample it s times to get the low resolution 
%  image with size (M/s)*(N/s). Change the s*s pixels into one pixel, and 
%  the value of this pixel is euqal to the first value of pixels in the s*s. 
%  Then replicate pixels using nearest-neighbor interpolation to reach the 
%  desired size (512*512).

% Downsample to half res
for x = 1 : M
    for y = 1 : N
        if (mod((x+1), 2) == 0)
        if (mod((y+1), 2) == 0)
            f256((x+1)/2, (y+1)/2) = f(x,y);
        end
        end
    end
end

% Downsample to quarter res
for x = 1 : M
    for y = 1 : N
        if (mod((x+3), 4) == 0)
        if (mod((y+3), 4) == 0)
            f128((x+3)/4, (y+3)/4) = f(x,y);
        end
        end
    end
end

% Downsample to 16th resolution
for x = 1 : M
    for y = 1 : N
        if (mod((x+15), 16) == 0)
        if (mod((y+15), 16) == 0)
            f32((x+15)/16, (y+15)/16) = f(x,y);
        end
        end
    end
end

% Up sample
% Nearest-neighbor interpolation
for x = 1:256
    for y = 1:256
        f256_up(2*(x-1)+1:2*x,2*(y-1)+1:2*y) =  f256(x,y);
    end
end

for x = 1:128
    for y = 1:128
        f128_up(4*(x-1)+1:4*x,4*(y-1)+1:4*y) =  f128(x,y);
    end
end

for x = 1:32
    for y = 1:32
        f32_up(16*(x-1)+1:16*x,16*(y-1)+1:16*y) =  f32(x,y);
    end
end
%save and show images

figure,imshow(uint8(f256_up));title('Q1-256');saveas(gcf,'q1-256.tif');
figure,imshow(uint8(f128_up));title('Q1-128');saveas(gcf,'q1-128.tif');
figure,imshow(uint8(f32_up));title('Q1-32');saveas(gcf,'q1-32.tif');
%------Q2-----------------------------------------------------------------%
%  Create an interpolated 512*512 image from 32*32 image of Q1 using
%  bilinear interpolation

ur = 16;
f32_2=double(f32);
%f(1:ur:end,1:ur:end);
f512=zeros(512);

for x = 1:size(f512,1)
    for y = 1:size(f512,2)
        group_x = floor((x-1)/ur) + 1;
        group_y = floor((y-1)/ur) + 1;
        index_x = mod(x, ur);
        if index_x == 0
            index_x = ur;
        end
        index_y = mod(y, ur);
        if index_y == 0
            index_y = ur;
        end
        group_x_1 = group_x+1;
        if group_x_1 > size(f32_2,1)
            group_x_1 = size(f32_2,1);
        end
        group_y_1 = group_y+1;
        if group_y_1 > size(f32_2,2)
            group_y_1 = size(f32_2,2);
        end
        f_1 = (ur-index_x)/ur*f32_2(group_x, group_y) + index_x/ur*f32_2(group_x_1, group_y);
        f_2 = (ur-index_x)/ur*f32_2(group_x, group_y_1) + index_x/ur*f32_2(group_x_1, group_y_1);
        f512(x,y) = f_1*(ur-index_y)/ur + f_2*index_y/ur;

    end
end
% show image
figure,imshow(uint8(f512)),title('Q2-Bilinear Interpolation');saveas(gcf,'Q2-Bilinear Interpolation.tif');
%------Q3-----------------------------------------------------------------%
%  Change the gray-level quantization of the original 512*512 image by 
%  reducing the number of bits per pixel from 8 to 7, 6, 5, 4, 3, 2 and 1 
%  bits/pixel. eg.Divide the pixels of the origiNal image by 2 to change 
%  the gray-level quantization of the original image from 8 to 7 bits/pixel.
%  Then Multiply2 to Make the the gray levels span the 8-bit range in the 
%  new image.

% Create array of zeros
J1=zeros(M,N);
J2=zeros(M,N);
J3=zeros(M,N);
J4=zeros(M,N);
J5=zeros(M,N);
J6=zeros(M,N);
J7=zeros(M,N);
f_d = double(f(:,:,1));

% Change the gray-level quatization
for i=1:M
    for j=1:N
        J1(i,j)=floor(f_d(i,j)/2)*2;
    end
end
for i=1:M
    for j=1:N
        J2(i,j)=floor(f_d(i,j)/4)*4;
    end
end
for i=1:M
    for j=1:N
        J3(i,j)=floor(f_d(i,j)/8)*8;
    end
end
for i=1:M
    for j=1:N
        J4(i,j)=floor(f_d(i,j)/16)*16;
    end
end
for i=1:M
    for j=1:N
        J5(i,j)=floor(f_d(i,j)/32)*32;
    end
end
for i=1:M
    for j=1:N
        J6(i,j)=floor(f_d(i,j)/64)*64;
    end
end
for i=1:M
    for j=1:N
        J7(i,j)=floor(f_d(i,j)/128)*128;
    end
end

% Convert J1 to unsigned 8-bit iNteger
K1=uint8(J1);
K2=uint8(J2);
K3=uint8(J3);
K4=uint8(J4);
K5=uint8(J5);
K6=uint8(J6);
K7=uint8(J7);

%show images
figure,imshow(K1,[0,254]);title('Q3-7-bit');saveas(gcf,'Q3-7-bit.tif');
figure,imshow(K2,[0,252]);title('Q3-6-bit');saveas(gcf,'Q3-6-bit.tif');
figure,imshow(K3,[0,248]);title('Q3-5-bit');saveas(gcf,'Q3-5-bit.tif');
figure,imshow(K4,[0,240]);title('Q3-4-bit');saveas(gcf,'Q3-4-bit.tif');
figure,imshow(K5,[0,224]);title('Q3-3-bit');saveas(gcf,'Q3-3-bit.tif');
figure,imshow(K6,[0,192]);title('Q3-2-bit');saveas(gcf,'Q3-2-bit.tif');
figure,imshow(K7,[0,128]);title('Q3-1-bit');saveas(gcf,'Q3-1-bit.tif');


%------Q4-----------------------------------------------------------------%
%  Make a 512*512 image (i) changes the spatial resolution to 256*256 
%  pixels and (ii) has 6 bits/pixel gray-scale resolution.

[M,N] = size(f256);

% Quantize gray level
for i=1:M
    for j=1:N
        J8(i,j)=floor(f256(i,j)/4)*4;
    end
end
% Upscale
for x = 1:256
    for y = 1:256
        q4(2*(x-1)+1:2*x,2*(y-1)+1:2*y) =  J8(x,y);
    end
end
%show image
figure,imshow(uint8(q4));title('Q4-256-6-bit');saveas(gcf,'Q4-256-6-bit.tif');
