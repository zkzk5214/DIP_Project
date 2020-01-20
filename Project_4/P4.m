%%%%%%%%%%%%% mainproj3.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Sample items pertaining to Project #4
%      on Histogram Modification 
%
% Input Variables:
%      f       Input 2D image (truck)
%      
% Returned Results:     
%          r         Gamma
%          s1/s2     Gamma corrected image   
%          s         Contrast stretched image 
%          he_f      Equalized image
%
% The following functions are called:
%      pdfandcdf.m   
%      pdfandcdf_8BIN.m
%
%  Author:      Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:        11/6/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all;close all;

f = imread('truck.gif');
f = f(:,:,1);

%figure,imshow(f);

%% Q1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the image's histogram and cdf
% Using user-defined function "pdfandcdf" and "pdfandcdf_8BIN" 

pdfandcdf(f);
pdfandcdf_8BIN(f);

%% Q2 Gamma=5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gamma correction with gamma = 5 
% Use equation s=T(r)=255(r/255)^gamma

r= 5;
s1 = zeros(256);
row=size(f,1);
column=size(f,2);
for x=1:row
    for y=1:column
        s1(x,y)=round(255*((double(f(x,y))/255)^r));
    end
end

%Plot the image and associated histogram and cdf
imshow(s1,[]);title('gamma r=5');saveas(gcf,'Q2gamma5.tif');
pdfandcdf(s1);

%% Q2 Gamma=0.2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gamma correction with gamma = 0.2
% Use equation s=T(r)=255(r/255)^gamma

r= 0.2;
s2 = zeros(256);
row=size(f,1);
column=size(f,2);
for x=1:row
    for y=1:column
        s2(x,y)= round(255*((double(f(x,y))/255)^r));
    end
end

%Plot the image and associated histogram and cdf
imshow(s2,[]);title('gamma r=0.2');saveas(gcf,'Q2gamma02.tif');
pdfandcdf(s2);

%% Q3 Contrast Stretching%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Set all pixels with gray levels below 10% in the cdf to black.
%  Set all pixels with gray levels above 90% in the cdf to white.
%  Linearly stretch the range between the 10% and 90% gray levels to 
%cover the range 0 to 255.
%  Use the formula to apply histogram-modification:
%  s=T(r)=0,0<r<64; 255r/64-255,64<=r<128; 255,128<=r<255

%  PDF
pr_=zeros(1,256);
pr=zeros(1,256);
row=size(f,1);
column=size(f,2);
for x=1:row
    for y=1:column
        r = f(x,y);
        pr_(r+1) = pr_(r+1)+1;
        pr(r+1) = pr_(r+1)/(row*column);
    end
end

%  CDF
cr=zeros(1,256);
a=zeros(1,256);
for r = 1:256
    for j = 1:r
        a(r)=a(r)+pr(j);
    end
    cr(r)=cr(r)+a(j);
end

r=zeros(256);
s=zeros(256);
for x=1:row
    for y=1:column
        r(x,y) = f(x,y);
        s(x,y)=round((255/((max(find(cr<0.9))-min(find(cr>0.1)))))*(r(x,y)-(min(find(cr>0.1))-1)));
        if s(x,y)<0
            s(x,y)=0;
        elseif s(x,y)>255
            s(x,y)=255;
        end
    end
end

%Plot the image and associated histogram and cdf
subplot(1,2,1),imshow(r,[0 255]);title('original');
subplot(1,2,2),imshow(s,[0 255]);title('new');saveas(gcf,'Q3.tif');
pdfandcdf(s);

%% Q4 Histogram Equalization%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Equalize the original image us histogram equalization
%  Calculate the CDF cr(r) and Lmax*cr(r)
%  Transformation s=T(r)=nint[Lmax*cr(r)]
%  Equalized image: he_f(x,y)=T[f(x,y)]

% PDF
pr_=zeros(1,256);
pr=zeros(1,256);
row=size(f,1);
column=size(f,2);
for x=1:row
    for y=1:column
        r = f(x,y);
        pr_(r+1) = pr_(r+1)+1;
        pr(r+1) = pr_(r+1)/(row*column);
    end
end

% CDF
cr=zeros(1,256);
a=zeros(1,256);
s=zeros(1,256);
for r = 1:256
    for j = 1:r
        a(r)=a(r)+pr(j);
    end
    cr(r)=cr(r)+a(j);
    s=round(cr.*255);
end

% HE
he_f=zeros(row,column);
for i=1:row
    for j=1:column
      he_f(i,j) = s(f(i,j)+1);
       if he_f(i,j)>255
           he_f(i,j)=255; 
       end        
    end   
end

% Plot the image and associated histogram and cdf
figure,imshow(he_f,[0 255]);title('HE');saveas(gcf,'Q4.tif');
pdfandcdf(he_f);