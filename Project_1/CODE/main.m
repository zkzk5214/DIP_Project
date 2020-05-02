%%%%%%%%%%%%% Project1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Module: Q1
%
% Usage: 
%   Main code for interpolating images using the nearest-neighbor method
%
% Purpose: 
%   1. Downsampling and Upsampling the 512x512 image. 
%   2. Nearest-neighbor interpolation for several spatial resolution images
%   
% Input variables: 
%   walkbridge.tif 
%
% Returned results: 
%   Q1-256    Upsampled image by interpolating 256x256 image
%   Q1-128    Upsampled image by interpolating 128x128 image
%   Q1-32     Upsampled image by interpolating 32x32 image
%
% Processing flow: 
%   1.	Downsample to determined resolutions
%   2.	Upsample using nearest-neighbor interpolation
%   3.	Export the 512 x512 image
%--------------------------------------------------------------------------
% Module: Q2
%
% Usage: 
%   Main code for interpolating images using the bilinear method
%
% Purpose: 
%   1. Downsampling and upsampling the 512x512 image
%   2. Bilinear interpolation for 32x32 image 
%
% Input variables: 
%   walkbridge.tif 
%
% Returned results: 
%   Q2 32----Upsampled image by interpolating 32x32 image
%
% Processing flow: 
%   1.	Downsample to 32 x32 resolutions
%   2.	Upsample using bilinear interpolation
%   3.	Export the 512 x512 image
%--------------------------------------------------------------------------
% Module: Q3
%
% Usage: 
%   Main code for Quantization images 
%
% Purpose: 
%   Change the gray-level Quantization of the original 512 x 512 image 
%   by reducing the number of bits per pixel from 8 to 7, 6, 5, 4, 3, 2, 1 
%   bits/pixel
%
% Input variables: 
%   walkbridge.tif 
%
% Returned results: 
%   Q3-N-bit    Quantization by reducing the pixel to N bits/pixel
%
% Processing flow: 
%   1.	Divide the pixels of the original image by 2n to change the 
%       gray-level Quantization of the original image from 8 to (8-n) 
%       bits/pixel.
%   2.	Multiply n to Make the gray levels span the 8-bit range in the new 
%       image.
%--------------------------------------------------------------------------
% Module: Q4
%
% Usage: 
%   Main code for interpolation and quantization images  
%
% Purpose: 
%   1. Interpolated the 25 x256 to 512 x512 use bilinear interpolation
%   2. Change the gray-level quantization of the original 512 x 512 image 
%      by reducing the number of bits to 6 bits/pixel
%
% Input variables: 
%   walkbridge.tif 
%
% Returned results: 
%   Q4-256-6-bit    interpolate the image from 256x256 to 512x512
%                   and quantization by reducing the pixel to 6 bits/pixel
%
% Processing flow: 
%   1.  Interpolate the 256x256 to 512x512
%   2. 	Divide the pixels of the original image by 2n to change the 
%       gray-level quantization of the original image from 8 to (8-n) 
%       bits/pixel.
%   3.  Multiply n to make the gray levels span the 8-bit range in the 
%       new image.
%
%--------------------------------------------------------------------------
%  Author: Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:9/13/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clear out all memory
clc;clear;close all; 
%%
%  Read image "walkbridge.tif" then get the first channel of the tif image 
%  and convert it to MATLAB double precision. Returns the number of rows 
%  and columns in M, N.

f = imread('walkbridge.tif');
f = f(:,:,1);
f512=zeros(512); f256 = zeros(256); f128 = zeros(128); f32 = zeros(32); 
[M, N] = size(f);

%% ------Q1---------------------------------------------------------------%
%  For image f with size M*N, sample it s times to get the low resolution 
%  image with size (M/s)*(N/s). Change the s*s pixels into one pixel, and 
%  the value of this pixel is euqal to the first value of pixels in the s*s. 
%  Then replicate pixels using nearest-neighbor interpolation to reach the 
%  desired size (512*512).

% Downsample to half res
for x = 1 : size(f,1)
    for y = 1 : size(f,2)
        if (mod((x+1), 2) == 0) && (mod((y+1), 2) == 0)
            f256((x+1)/2, (y+1)/2) = f(x,y);
        end
    end
end
% Downsample to quarter res
for x = 1 : size(f,1)
    for y = 1 : size(f,2)
        if (mod((x+3), 4) == 0) && (mod((y+3), 4) == 0)
            f128((x+3)/4, (y+3)/4) = f(x,y);
        end
    end
end
% Downsample to 16th resolution
for x = 1 : size(f,1)
    for y = 1 : size(f,2)
        if (mod((x+15), 16) == 0) && (mod((y+15), 16) == 0)
            f32((x+15)/16, (y+15)/16) = f(x,y);
        end
    end
end

% Up sample
% Nearest-neighbor interpolation
for x = 1:size(f256,1)
    for y = 1:size(f256,2)
        f256_up(2*(x-1)+1:2*x, 2*(y-1)+1:2*y) =  f256(x,y);
    end
end
for x = 1:size(f128,1)
    for y = 1:size(f128,2)
        f128_up(4*(x-1)+1:4*x,4*(y-1)+1:4*y) =  f128(x,y);
    end
end
for x = 1:size(f32,1)
    for y = 1:size(f32,2)
        f32_up(16*(x-1)+1:16*x,16*(y-1)+1:16*y) =  f32(x,y);
    end
end

% Save and show images
figure,imshow(uint8(f256_up));title('Q1-256');saveas(gcf,'q1-256.tif');
figure,imshow(uint8(f128_up));title('Q1-128');saveas(gcf,'q1-128.tif');
figure,imshow(uint8(f32_up));title('Q1-32');saveas(gcf,'q1-32.tif');

%% ------Q2---------------------------------------------------------------%
%  Create an interpolated 512*512 image from 32*32 image of Q1 using
%  bilinear interpolation

ur = 16;
f32_=double(f32);
%f(1:ur:end,1:ur:end);

for x = 1:size(f512,1)
    for y = 1:size(f512,2)
        
        group_x = floor((x-1)/ur) + 1;  % 32
        group_y = floor((y-1)/ur) + 1;  % 32
        
        group_x_1 = group_x+1;
        if group_x_1 > size(f32_,1)
            group_x_1 = size(f32_,1);
        end      
        group_y_1 = group_y+1;
        if group_y_1 > size(f32_,2)
            group_y_1 = size(f32_,2);
        end
        
        index_x = mod(x, ur);   % index_x = x-x1
        if index_x == 0 
            index_x = ur;
        end        
        index_y = mod(y, ur);   % index_y = y-y1
        if index_y == 0
            index_y = ur;
        end
        
        % X direction
        % f1 = x2-x/x2-x1 * f(x1,y1) + x-x1/x2-x1 * f(x2,y1) 
        % f2 = x2-x/x2-x1 * f(x1,y2) + x-x1/x2-x1 * f(x2,y2) 
        % x2-x1 = ur , x-x1 = index_x
        f_1 = (ur-index_x)/ur * f32_(group_x, group_y) + ...
            index_x/ur * f32_(group_x_1, group_y);
        f_2 = (ur-index_x)/ur * f32_(group_x, group_y_1) + ... 
            index_x/ur * f32_(group_x_1, group_y_1);
        
        % Y direction
        % f(x,y) = y2-y/y2-y1 * f_1 + y-y1/y2-y1 * f_2
        % y2-y1 = ur , y-y1 = index_y
        f512(x,y) = (ur-index_y)/ur * f_1 + index_y/ur * f_2;

    end
end
%%
figure,imshow(uint8(f512)),title('Q2-Bilinear Interpolation');
saveas(gcf,'Q2-Bilinear Interpolation.tif');

%% ------Q3----------------------------------------------------------------%
%  Change the gray-level quantization of the original 512*512 image by 
%  reducing the number of bits per pixel from 8 to 7, 6, 5, 4, 3, 2 and 1 
%  bits/pixel. eg.Divide the pixels of the original image by 2 to change 
%  the gray-level quantization of the original image from 8 to 7 bits/pixel.
%  Then Multiply2 to Make the the gray levels span the 8-bit range in the 
%  new image.

% Create array of zeros
J1=zeros(M,N); J2=zeros(M,N); J3=zeros(M,N); J4=zeros(M,N);
J5=zeros(M,N); J6=zeros(M,N); J7=zeros(M,N);
f_d = double(f(:,:,1));

% Change the gray-level quatization
for i=1:size(f,1)
    for j=1:size(f,2)
        J1(i,j)=floor(f_d(i,j)/2)*2;
        J2(i,j)=floor(f_d(i,j)/4)*4;
        J3(i,j)=floor(f_d(i,j)/8)*8;
        J4(i,j)=floor(f_d(i,j)/16)*16;
        J5(i,j)=floor(f_d(i,j)/32)*32;
        J6(i,j)=floor(f_d(i,j)/64)*64;
        J7(i,j)=floor(f_d(i,j)/128)*128;
    end
end

% Convert J1 to unsigned 8-bit iNteger
K1=uint8(J1); K2=uint8(J2); K3=uint8(J3); K4=uint8(J4);
K5=uint8(J5); K6=uint8(J6); K7=uint8(J7);

% Show images
figure,imshow(K1,[0,254]);title('Q3-7-bit');saveas(gcf,'Q3-7-bit.tif');
figure,imshow(K2,[0,252]);title('Q3-6-bit');saveas(gcf,'Q3-6-bit.tif');
figure,imshow(K3,[0,248]);title('Q3-5-bit');saveas(gcf,'Q3-5-bit.tif');
figure,imshow(K4,[0,240]);title('Q3-4-bit');saveas(gcf,'Q3-4-bit.tif');
figure,imshow(K5,[0,224]);title('Q3-3-bit');saveas(gcf,'Q3-3-bit.tif');
figure,imshow(K6,[0,192]);title('Q3-2-bit');saveas(gcf,'Q3-2-bit.tif');
figure,imshow(K7,[0,128]);title('Q3-1-bit');saveas(gcf,'Q3-1-bit.tif');

%% ------Q4---------------------------------------------------------------%
%  Make a 512*512 image (i) changes the spatial resolution to 256*256 
%  pixels and (ii) has 6 bits/pixel gray-scale resolution.

J8=zeros(size(f256,1),size(f256,2));

% Quantize gray level
for i=1:size(f256,1)
    for j=1:size(f256,2)
        J8(i,j)=floor(f256(i,j)/4)*4;
    end
end

% Upscale
for x = 1:size(f256,1)
    for y = 1:size(f256,2)
        Q4(2*(x-1)+1:2*x , 2*(y-1)+1:2*y) =  J8(x,y);
    end
end

figure,imshow(uint8(Q4));title('Q4-256-6-bit');
saveas(gcf,'Q4-256-6-bit.tif');