%%%%%%%%%%%%%  Function m_and_d  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Purpose:  
%       To get Mean and standard deviation of image  
%
%  Input Variables:
%       image_in    256x256  size of a 2-D input image 
% 
%  Returned Results:
%       mean        Average or mean value of image                   
%       image_out     Standard deviation of image
% 
%  Processing Flow:
%       1.  Manually define the target region
%       2.  Calculate mean
%       3.  Calculate standard deviation
%     
%  Restrictions/Notes:
%       Target region 180*256
%
%  The following functions are called:
%       None
%
%  Author:      Zekai Liu, Wenrui Wang, Naichao Yin
%  Date:        27/03/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Mean,Standard_deviation] = m_and_d(image_in)
Count = 0;
f_target = zeros(256);

%  Mean
Sum = 0;
for x = 1:180 % Target region       
    for y = 1:256
        if image_in(x,y) > 194  % Threshold 194
            f_target(x,y) = f_target(x,y) + image_in(x,y);
            Count = Count+1;
        end
    end
end

for x = 1:256
    for y = 1:256
        Sum = Sum + im2double(f_target(x,y)); % Summation all target pixels        
    end
end

Mean = Sum/Count;

%  Standard_deviation
DiffSquare=zeros(256);
Diff=zeros(256);

for x=1:256
    for y=1:256
        if f_target(x,y)~= 0
            Diff(x,y)=f_target(x,y)-Mean;
            DiffSquare(x,y)=Diff(x,y)*Diff(x,y);
        end
    end
end

DiffSquareSummation=0;

for x=1:256
    for y=1:256
            DiffSquareSummation=DiffSquareSummation+DiffSquare(x,y);     
    end
end

Standard_deviation = sqrt(DiffSquareSummation/Count);

end

