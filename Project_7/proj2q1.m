%%%%%%%%%%%%% proj2q1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     (1)Create structuring elements Bi
%     (2)Do Thinning opeartion between original image and Bi
%     (3)Iteration n times
%
% Input Variables:
%     x       input 2D image
%     n       iteration times
%      
% Returned Results:
%     y        image after thinning 
%     z        image as a superposition of y on the original image x
%
%  The following functions are called:
%     hitormiss
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        21/2/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;close all;

% Input image
x = imread('penn256.gif');
% x = imread('bear.gif');
y = zeros(256);
z = x;

% Iteration times
n=2;
% n=5;
% n=10;
% n=999;

% Looping
for i = 1:n
    for j = 1:8
        
       %B_f = diskB(j,1);       % B_f
       %B_b = diskB(j,-1);      % B_b
       %x_b = bwhitmiss(x,B_f,B_b);
        x_b = hitormiss(x,j);   % hit-or-miss transform       
        x = x-x_b;              % thinning transform   
    end
    
    % Compare the output image X(X_i) of this iteration to the last 
    % iteration Y (X_i-1). If nothing changes, looping will stop
    % while{ Xi ~= Xi_1 }  
    if all(y(:) == x(:))
        break;
    else
        y = x;
    end
    
end

% Superposition
z = z+y;
figure,imshow(z,[]),title(n);
