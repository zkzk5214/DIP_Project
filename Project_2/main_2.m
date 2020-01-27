%%%%%%%%%%%%%%%%%%% main_2.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PROJECT 2
% Module: Q2
% Usage: Main MATLAB code file for LOGICAL (SET) OPERATIONS
% Purpose: 
% 1. Build the logical operator 
% 2. Build the minimum operator
% Input variables: 'input image 1' and 'input image 2' that needs to be 
% processed in the former operator
% Returned results: 
% 'AND_Result.tif' AND operator processed image
% 'OR_Result' OR operator processed image
% 'XOR_Result.tif' XOR operator processed image
% 'NOT_Result.tif' NOT operator processed image
% 'Image_Minimum.tif' Minimum operator processed image
% Processing flow: 
% 1.	input images
% 2.	logical(set) operations of those images pixels by pixels
% 3.	show the output image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Clear out all memory
clc;clear;close all;

%  Build the logic operator (AND, OR, XOR and NOT) by function    
imageAND('match1.gif','match2.gif')
imageOR('match1.gif','match2.gif')
imageXOR('match1.gif','match2.gif')
imageNOT('match1.gif')

%  Build the minimum operator by function "imageMIN " 
E=imageMIN('cameraman.tif','mandril_gray.tif');
figure,imshow(E,[]);
