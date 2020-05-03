%%%%%%%%%%%%%  Function snnFilter  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Purpose:  
%       SNN Filtering  
%
%  Input Variables:
%       image_in        MxN size of a 2-D input image 
%       filtersize      The edge length of the filter
%
%  Returned Results:
%       image_out       M1XN1 size of a 2-D filtered image
% 
%  Processing Flow:
%       1.  Symmetric padding input image.
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
function [image_out] = snnFilter(image_in,filtersize)

% Convert image to double precision
if ~isa(image_in,'double')
    image_in = im2double(image_in);
end

P = floor(filtersize/2);
image_pad = padarray(image_in,[P P],'symmetric','pre');
[m,n] = size(image_pad);
Out = zeros(size(image_in));

for i = (P+1):(m-P)
    for j = (P+1):(n-P)
        
        % Transformation filter matrix 
        M = image_pad((i-P):(i+P),(j-P):(j+P));
        
        % Top of the mask 
        M_top = M(1:P,:)';
        M_top = M_top(:)';  % One row
        M_top = [M_top M(P+1,1:P)];
        
        % Bottom of the mask 
        M_bot = M((end-P+1):end,:)';
        M_bot = M_bot(:)';
        M_bot = [M(P+1,(end-P+1):end) M_bot];
        M_bot = fliplr(M_bot);
        
        % Conbine the Top and the Bottom
        NN = [M_top; M_bot];
        NN_diff = abs(NN - M(P+1,P+1)); % Minus mid_pix
        [~,ids] = min(NN_diff); % ids is the min num indicator
        
        for k = 1:length(ids)
            snn(k) = NN(ids(k),k);  % snn is the best pixel
        end
        
        % Average those selected pixels
        Out(i,j) = mean([snn image_pad(i,j)]); 
        
    end   
    
image_out = im2uint8(Out);

end