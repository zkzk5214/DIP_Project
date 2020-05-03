%%%%%%%%%%%%%  Main Function P5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Fractal Generation Using Iterated Function Systems(IFS)
%
% Input Variables:
%      XY       a random point w(x,y)
%
% Returned Results:
%     Img                   result(scatter plot) 
%     Result                result(graylevel plot)
%
% Processing Flow:
%    Accoding to RenderIFS Alogrithm
%    By calling different functions to get different running probabilities
%
%  Restrictions/Notes:
%    The number of iterations N shall vary according to the requirements  
%
%  Calling functions
%     RandByP, RandByP1, RandByP2, RandByP3, RandByP4
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/24/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%% Main

% [x,y]' seed value for random number generator
XY=rand(2,1);

% Use an image size of 10241024
Result = zeros(1024,1024);  

% Affine Linear Transformation Matrix
% Data is from L23-11
A(:,:,1)=[0.00,0.00;0.00,0.16];
A(:,:,2)=[0.2,-.26;0.23,0.22];
A(:,:,3)=[-.15,0.28;0.26,0.24];
A(:,:,4)=[0.85,0.04;-.04,0.85];
% Shift Matrix
B(:,:,1)=[0;0];
B(:,:,2)=[0;0.16];
B(:,:,3)=[0;0.44];
B(:,:,4)=[0;1.6];

% Iterations
N=10000000;  % Change
Pt=zeros(2,N);

% Randomly pick Transformation Matrix
for j=1:N
    Pt(:,j)=XY;
       x=RandByP();   
%      x=RandByP1();
%      x=RandByP2();
%      x=RandByP3();
%      x=RandByP4();    
    XY=A(:,:,x)*XY+B(:,:,x);    % Do AFL
end

% Scatter plot
figure, img = scatter(Pt(1,:),Pt(2,:),3, 'k','filled'); axis([-4 4 0 8]);
title(['Iterations:',num2str(N)]);

% Low/High x,y-value of image window 
xmin = min(min(Pt));   
xmax = max(max(Pt));    
y = (Pt-xmin).*(1.00-0.00)./(xmax-xmin);    % Normalization

% Compute indices of pixel and Spread over whole image
for j=1:N
    XY = y(:,j);
    XY = XY*1024+1;
    XY = uint16(XY);
    Result(XY(1),XY(2))=1; 
end

% result=imrotate(Result, 90);
% figure,imshow(Result, []);