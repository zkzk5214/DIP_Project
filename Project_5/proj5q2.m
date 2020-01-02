%%%%%%%%%%%%% mainproj5question2.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      MORPHOLOGICAL IMAGE PROCESSING
%       
% Input Variables:
%      f       2D IMAGE (proj5)
%      
% Returned Results:     
%      f2      TRUE BINARY-VALUED IMAGE 
%      f4      OPENING     
%      f5      CORRUPTION REDUCED  
%      ff      RECONSTRUCT TALL CHARACTERS
%      fff     EDGE DETECTION     
%
% The following functions are called:
%      RECONSTRUCT.m   
%      EDGE_DETECTION.m
%
%  Author:      Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:        12/6/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all;close all;

%----------------------------(A)-------------------------------------------
%  READ IMAGE
%  EXTRACT THE ROW(M) AND COLUMN(N) OF IMAGE
%  SET ZEROS FOR F3 F4 F5 F6
f = imread('proj5.gif');          
[M,N] = size(f);                  
f2 = zeros(M,N);
f3 = zeros(M,N);                  
f4 = zeros(M,N);
f5 = zeros(M,N);
f6 = zeros(M,N);

%  SET THRESHOLD(75) TO MAKE IMAGE BECOME BINARY-VALUED IMAGE, WHERE 
%  BLACK ("0") CONSTITUTES THE FOREGROUND AND WHITE("255") THE BACKGROUND 
for x=1:M                       
    for y=1:N                   
        if f(x,y) >= 75          
           f2(x,y) = 255;       
        else 
           f2(x,y) = 0;
        end
    end
end
%HISTOGRAMS(f);
figure,imshow(f2,[]),title('BINARY');

%---------------------------(B)--------------------------------------------
%  DO OPENING(EROSION AND DILATION) FOR BINARY-VALUED IMAGE(f2) TO REMOVE
%  "X" GET f4, MASK 3X3. 
%  DO "AND" LOGICAL BETWEEN f4 AND f2 FOR REDUCE ALL CORRUPTIONS(f5)  

for x=2:M-1                     
    for y=2:N-1                   
        if  f2(x-1,y-1)==0 && f2(x,y-1)==0 && f2(x+1,y-1)==0 &&...
            f2(x-1,y)==0 && f2(x,y)==0 && f2(x+1,y)==0 &&...
            f2(x-1,y+1)==0 && f2(x,y+1)==0 && f2(x+1,y+1)==0
                                             
            f3(x,y) = 0;
        else
            f3(x,y) = 255;
        end
    end
end
%figure,imshow(f3,[]),title('OPENING-EROSION');
for x=2:M-1                     
    for y=2:N-1                   
        if  f3(x-1,y-1)==0 || f3(x,y-1)==0 || f3(x+1,y-1)==0 ||...
            f3(x-1,y)==0 || f3(x,y)==0 || f3(x+1,y)==0 ||...
            f3(x-1,y+1)==0 || f3(x,y+1)==0 || f3(x+1,y+1)==0
                                            
            f4(x,y) = 0;
        else
            f4(x,y) = 255;
        end
    end
end
%figure,imshow(f4,[]),title('OPENING-DILATION');
for x=1:M
    for y=1:N 
       
        if (f2(x,y)==0) && (f4(x,y)==0)
            f5(x,y) = 0;
        elseif (f2(x,y)==255) && (f4(x,y)==0)
            f5(x,y) = 255;
        elseif (f2(x,y)==0) && (f4(x,y)==255)
            f5(x,y) = 255;
        else
            f5(x,y) = 255;
        end     
    end
    
end
%figure,imshow(f5,[]),title('CORRUPTION-REDUCED');

%  DO EROSION FOR F2 BY MASK 45X4
%  THIS IS THE MINIMUM SIZE TO REMOVE THE SHORT CHARACTERS INCLUDE "t" 
%  AND KEEP THE OTHER TALL CHARACTERS(D,P,I,l).
for x=1:M-1                     
    for y=1:N                   
        if f5(x,y)==0 && f5(x+1,y)==0 && f5(x+2,y)==0 && f5(x+3,y)==0 &&...
                         f5(x+4,y)==0 && f5(x+5,y)==0 && f5(x+6,y)==0 &&f5(x+7,y)==0 &&...
                         f5(x+8,y)==0 && f5(x+9,y)==0 && f5(x+10,y)==0 &&f5(x+11,y)==0 &&...
                         f5(x+12,y)==0 && f5(x+13,y)==0 && f5(x+14,y)==0 &&f5(x+15,y)==0 &&...
                         f5(x+16,y)==0 && f5(x+17,y)==0 && f5(x+18,y)==0 &&f5(x+19,y)==0 &&...
                         f5(x+20,y)==0 && f5(x+21,y)==0 && f5(x+22,y)==0 &&...
                         f5(x-1,y)==0 && f5(x-2,y)==0 && f5(x-3,y)==0 &&...
                         f5(x-4,y)==0 && f5(x-5,y)==0 && f5(x-6,y)==0 &&f5(x-7,y)==0 &&...
                         f5(x-8,y)==0 && f5(x-9,y)==0 && f5(x-10,y)==0 &&f5(x-11,y)==0 &&...
                         f5(x-12,y)==0 && f5(x-13,y)==0 && f5(x-14,y)==0 &&f5(x-15,y)==0 &&...
                         f5(x-16,y)==0 && f5(x-17,y)==0 && f5(x-18,y)==0 &&f5(x-19,y)==0 &&...
                         f5(x-20,y)==0 && f5(x-21,y)==0 && f5(x-22,y)==0 &&...
                         f5(x,y-1)==0 &&f5(x,y+1)==0 && f5(x,y+2)==0                         
            f6(x,y) = 0;
        else
            f6(x,y) = 255;
        end
    end
end
%figure,imshow(f6,[]),title('EROSION-LETTER');

%  N(55) INTERATION TO RECONSTRUCT TALL CHARACTERS
for n=1:55
   ff = RECONSTRUCT(f6,f5); 
   f6 = ff;  
end 
figure,imshow(ff,[]);

%---------------------------(C)--------------------------------------------
%  EDGE DETECTION
fff = EDGE_DETECTION(ff);
        

