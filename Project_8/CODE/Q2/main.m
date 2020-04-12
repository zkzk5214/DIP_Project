%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1. Apply Anisotropic Diffusion filter in cwheelnoise.gif 
%      2. Give the result after 0,5,20,and 100 iterations
%      3. Plot Gtay scale histogram of every image
%      4. Segment out 'spokes' of the image
%
% Input Variables:
%      f       input 2D image
%      iteration times
%      the value of lam
%      the calue of parameter K
%      
%      
% Returned Results:
%      wheelIad0      image after applying Anisotropic Diffusion filter 0
%      times
%     wheelIad5      image after applying Anisotropic Diffusion filter 5
%      times
%      wheelIad20      image after applying Anisotropic Diffusion filter 20
%      times
%      wheelIad100      image after applying Anisotropic Diffusion filter 100
%      times
%      spoke           image segmented out
%
%  The following functions are called:
%      Anisodiff.m   
%      Anisodiff2.m
%      findspokes.m
%      ph.m
%    
% Author: Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        03/25/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=imread('cwheelnoise.gif')
f=f(:, :, 1);
f=double(f);
k1=20;
wheelIad0=Anisodiff(f,0.25,k1,0);
A=wheelIad0(:,128);figure;plot(A,'-');
ph0=ph(round(wheelIad0),256,256);
figure;bar(ph0);
wheelIad5=Anisodiff(f,0.25,k1,5);
wheelIad20=Anisodiff(f,0.25,k1,20);
wheelIad100=Anisodiff(f,0.25,k1,100);
A=wheelIad5(:,128);figure;plot(A,'-');
ph5=ph(round(wheelIad5),256,256);
figure;bar(ph5);
A=wheelIad20(:,128);figure;plot(A,'-');
ph20=ph(round(wheelIad20),256,256);
figure;bar(ph20);
A=wheelIad100(:,128);figure;plot(A,'-');
ph100=ph(round(wheelIad100),256,256);
figure;bar(ph100);
spoke=findspokes(wheelIad100,80,120);
figure,imshow(spoke,[0,255]);

figure;
subplot(2,2,1);; imshow(wheelIad0,[0,255]);title('original(no iteration)');
subplot(2,2,2);; imshow(wheelIad5,[0,255]);title('5 iteration');
subplot(2,2,3);; imshow(wheelIad20,[0,255]);title('20 iteration');
subplot(2,2,4);; imshow(wheelIad100,[0,255]);title('100 iteration');
%
k2=05;

wheelIad5=Anisodiff2(f,0.25,k2,5);
wheelIad20=Anisodiff2(f,0.25,k2,20);
wheelIad100=Anisodiff2(f,0.25,k2,100);
A=wheelIad5(:,128);figure;plot(A,'-');
ph5=ph(round(wheelIad5),256,256);
figure;bar(ph5);
A=wheelIad20(:,128);figure;plot(A,'-');
ph20=ph(round(wheelIad20),256,256);
figure;bar(ph20);
A=wheelIad100(:,128);figure;plot(A,'-');
ph100=ph(round(wheelIad100),256,256);
figure;bar(ph100);
spoke=findspokes(wheelIad100,80,125);
figure,imshow(spoke,[0,255]);

figure;
subplot(2,2,1); imshow(wheelIad0,[0,255]);title('original(no iteration)');
subplot(2,2,2); imshow(wheelIad5,[0,255]);title('5 iteration');
subplot(2,2,3); imshow(wheelIad20,[0,255]);title('20 iteration');
subplot(2,2,4); imshow(wheelIad100,[0,255]);title('100 iteration');
