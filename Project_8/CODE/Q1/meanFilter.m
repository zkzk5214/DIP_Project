%%%%%%%%%%%%%  Function MeanFilter  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Purpose:  
%     Mean Filtering  
%
%  Input Variables:
%     image_in    M1xN1 size of a 2-D input image 
%     filter      M2xM2 size of a 2-D filter
% 
%  Returned Results:
%     image_out   M1XN1 size of a 2-D filtered image
% 
%  Processing Flow:
%     1.  Periodic padding input image.
%     2.  Do mean filter.
%     
%  Restrictions/Notes:
%     This function inputs binary image and filter
%
%  The following functions are called:
%     None
%
%  Author:      Zekai Liu, Wenrui Wang, Naichao Yin
%  Date:        27/03/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [image_out] = meanFilter(image_in, filter)

[m, n] = size(image_in);
image_out = zeros(m, n, 'uint8');

[mf, ~] = size(filter);
k = (mf - mod(mf,2)) / 2;
image_temp = zeros(m+2*k, n+2*k, 'double');

coeff = sum(filter(:)); % coeff = filter size

% Periodic Padding
for i = 1+k : m+k
    for j = 1+k : n+k
        image_temp(i, j) = image_in(i-k, j-k);
    end
end
for i = 1 : k
    for j = 1 : n
        image_temp(i, j+k) = image_in(1, j);
        image_temp(m+k+i, j+k) = image_in(m, j);
    end
end
for i = 1 : m
    for j = 1 : k
        image_temp(i+k, j) = image_in(i, 1);
        image_temp(i+k, n+k+j) = image_in(i, n);
    end
end
for i = 1 : k
    for j = 1 : k
        image_temp(i, j) = image_in(1, 1); 
        image_temp(i, j+n+k) = image_in(1, n); 
        image_temp(i+n+k, j) = image_in(m, 1); 
        image_temp(i+n+k, j+n+k) = image_in(m, n);
    end
end

% Mean Filter
for i = 1+k : m+k
    for j = 1+k : n+k
        mask = image_temp(i-k:i+k, j-k:j+k);
        mask1 = double(filter') .* double(mask);    % Array multip
        mask2 = sum(mask1(:)) / coeff;
        image_out(i-k, j-k) = uint8(mask2);
    end
end

end