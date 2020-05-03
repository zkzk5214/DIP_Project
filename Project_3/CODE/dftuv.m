function [U, V] = dftuv(M, N)
%  Gives an MxN array needed by
%     lowpass filter function lpfilter.m 
%
%  Taken directly from Chapter 4 of
%     Digital Image Processing using MATLAB
%     by Gonzalez, Woods, and Eddins

u = 0:(M-1);
v = 0:(N-1);

% Half
idx = find(u > M/2);
idy = find(v > N/2);

% idx = 0 ~ 128, -127 ~ -1
u(idx) = u(idx) - M;
v(idy) = v(idy) - N;
[V, U] = meshgrid(v,u);
% surf(V,U)
end
