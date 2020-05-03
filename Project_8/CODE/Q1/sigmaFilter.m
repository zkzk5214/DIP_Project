%%%%%%%%%%%%%  Function sigmaFilter  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Purpose:  
%       Sigma Filtering  
%
%  Input Variables:
%       image_in        MxN size of a 2-D input image 
%       sigmavalue      Sigma value
%       filtersize      The edge length of the filter
%
%  Returned Results:
%       image_out       M1XN1 size of a 2-D filtered image
% 
%  Processing Flow:
%       1.  Choose the good region.
%       2.  Do sigma filter.
%     
%  Restrictions/Notes:
%       One of the parameters is the edge length of the filter
%
%  The following functions are called:
%       None
%
%  Author:      Zekai Liu, Wenrui Wang, Naichao Yin
%  Date:        27/03/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [image_out] = sigmaFilter(image_in, sigmavalue,filtersize)

k = floor(filtersize/2);
[m, n]=size(image_in);
image_out=zeros(m,n);

% Convert image to double precision
if ~isa(image_in,'double')
    image_in = double(image_in);
end

for y=1:n
    for x=1:m        
        % Set sum and number of pixels to 0
        sum_pix=0; 
        num_pix=0;   
        mid_pix=image_in(x,y);
        
        % Choose the good region
        for y_roi=-k+y:1:k+y   % filter size = 5
            if y_roi < 1 || y_roi > n
                continue
            end                         
            for x_roi=-k+x:1:k+x   % filter size = 5
                if x_roi < 1 || x_roi > m
                    continue
                end              
                % Newpixel is one to compare to middle pixel
                new_pix=image_in(x_roi,y_roi); 
                % Check to see if difference is less than sigma value
                
                if abs(mid_pix - new_pix) < sigmavalue
                    % If it is, bin that pixel value into a matrix
                    sum_pix = sum_pix + new_pix; 
                    num_pix = num_pix + 1;
                    
                end               
            end
        end       
        
        % Average those selected pixels
        if num_pix > 0
            image_out(x,y)=sum_pix/num_pix;
        else
            image_out(x,y)=mid_pix;
        end     
        
    end
end

image_out = uint8(image_out);

end
    
