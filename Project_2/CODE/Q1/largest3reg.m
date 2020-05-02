function [BW] = largest3reg(BW,M,N)
%  LARGEST3REG Choosing an assigned threshold and find the 8-connected 
%              components of the threshold image, then save the 3 largest 
%              components of  the labeled image and delete the other 
%              components by setting constituent pixels to 0.
%  Input: 
%       BW   The label matrix that contains labels for the 8-connected 
%            objects found in BW.
%       M    Row of the BW
%       N    Column of the BW
%  Output:
%       BW   The keep the 3 largest components of the input image 

% Measure Area of image regions
stats = regionprops(BW,'Area');     
[~,index]=sort([stats.Area],'descend'); 

for x = 1:M
    for y = 1:N
        if BW(x,y)==index(1)||BW(x,y)==index(2)||...
                BW(x,y)==index(3) 
            BW(x,y)=1;
        else
            BW(x,y)=0;        
        end
    end
end

end 
