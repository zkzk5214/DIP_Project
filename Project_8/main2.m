%%%%%%%%%%%%% main2.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1. Apply Anisotropic Diffusion filter in cameraman.tif 
%      2. Give the result after 0,5,20,and 100 iterations
%      
% Input Variables:
%      f       input 2D image
%      iteration times
%      the value of lam
%      the calue of parameter K
%      
%      
% Returned Results:
%      fcamexp0      image after applying Anisotropic Diffusion filter 0
%      times
%     fcamexp5      image after applying Anisotropic Diffusion filter 5
%      times
%      fcamexp20      image after applying Anisotropic Diffusion filter 20
%      times
%      fcamexp100      image after applying Anisotropic Diffusion filter 100
%      times
%      
%  The following functions are called:
%      Anisodiff.m   
%      Anisodiff2.m
%      
% Author: Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        03/25/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k1=20;
k2=5;
fcam=imread('cameraman.tif');
fcam=fcam(:,:,1);
fcam=double(fcam);
fcamexp0=Anisodiff(fcam,0.25,k1,0);
figure;
subplot(2,2,1);imshow(fcamexp0,[0,255]);title('original(no iteration)');

fcamexp5=Anisodiff(fcam,0.25,k1,5);
subplot(2,2,2);imshow(fcamexp5,[0,255]);title('5 iteration');

fcamexp20=Anisodiff(fcam,0.25,k1,20);
subplot(2,2,3);imshow(fcamexp20,[0,255]);title('20 iteration');

fcamexp100=Anisodiff(fcam,0.25,k1,100);
subplot(2,2,4);imshow(fcamexp100,[0,255]);title('100 iteration');

figure;
fcam0=Anisodiff2(fcam,0.25,k2,0);
subplot(2,2,1);imshow(fcam0,[0,255]);title('original(no iteration)');

fcam5=Anisodiff2(fcam,0.25,k2,5);
subplot(2,2,2);imshow(fcam5,[0,255]);title('5 iteration');

fcam20=Anisodiff2(fcam,0.25,k2,20);
subplot(2,2,3);imshow(fcam20,[0,255]);title('20 iteration');

fcam100=Anisodiff2(fcam,0.25,k2,100);
subplot(2,2,4);imshow(fcam100,[0,255]);title('100 iteration');