%%%%%%%%%%%%% proj5main1.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      MEDIAN FILTERING
%       
% Input Variables:
%      f1       2D IMAGE (proj5)
%      f2       2D IMAGE (wheelpepper)
%      
% Returned Results:     
%      fnew1      MEDIAN FILTERED(f1) 
%      fnew2      MEDIAN FILTERED(f2)     
%
% The following functions are called:
%      HISTOGRAMS.m        
%
%  Author:      Jonathan Lausch, Qiong Li, Zekai Liu
%  Date:        12/6/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;close all;

%% ----------------------------(A)-----------------------------------------
%  APPLY A 3X3 MEDIAN FILTER TO IMAGE(proj5) 
%  SHOW THE ORIGINAL IMAGE AND FILTERED IMAGE WITH HISTOGRAMS

f1 = imread('proj5.gif');   

% 3*3 MEDIAN FILTER
fnew1 = medfilt2(f1,[3 3]);

figure,subplot(2,2,1),imshow(f1,[]),title('Original-proj5');
subplot(2,2,2),histogram(f1), title('histogram-original');
hold on
subplot(2,2,3),imshow(fnew1,[]),title('Filtered-proj5');
subplot(2,2,4),histogram(fnew1);title('histogram-new');
hold off 
saveas(gcf,'ori-new-f1','tif')
close all

% Enlarge f1
mainax = axes;
histogram(mainax, f1, 'BinLimits', [10 74]);
ylim(mainax, [0 600]) % To make room for sub axes.

subax = axes('Position',[0.2 0.7 0.2 0.2]);
histogram(subax, f1);title('histogram-ENLARGEori');
saveas(gcf,'histogramORI','tif');
close all

% Enlarge fnew1
mainax = axes;
histogram(mainax, fnew1, 'BinLimits', [10 74]);
ylim(mainax, [0 600]) % To make room for sub axes.

subax = axes('Position',[0.2 0.7 0.2 0.2]);
histogram(subax, fnew1);title('histogram-ENLARGEnew');
saveas(gcf,'histogramnew','tif');

%% ----------------------------(B)-----------------------------------------
%  APPLY A 3X3 MEDIAN FILTER TO IMAGE(wheelpepper) 
%  SHOW THE ORIGINAL IMAGE AND FILTERED IMAGE WITH HISTOGRAMS

f2 = imread('wheelpepper.gif');

% 3*3 MEDIAN FILTER
fnew2 = medfilt2(f2,[3 3]);    

subplot(2,2,1),imshow('wheelpepper.gif'),title('Original-wp2');
subplot(2,2,2),histogram(f2); title('histogram-originalwp');
hold on
subplot(2,2,3),imshow(fnew2,[]),title('Filtered-wp2');
subplot(2,2,4),histogram(fnew2);title('histogram-new2');
hold off 
saveas(gcf,'ori-new-f2','tif')
close all
