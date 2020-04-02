function [mean,standard_deviation] = m_and_d(image_in)
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
count=0;
f_target=zeros(256);


%  Mean
sum=0;
for x=1:180       
    for y=1:256
        if image_in(x,y) > 194  % Threshold 194
            f_target(x,y)=f_target(x,y)+image_in(x,y);
            count = count+1;
        end
    end
end

for x=1:256
    for y=1:256
        % Summation all target pixels
        sum=sum+im2double(f_target(x,y));           
    end
end
mean=sum/count;


%  Standard_deviation
sss=zeros(256);
diff=zeros(256);
for x=1:256
    for y=1:256
        if f_target(x,y)~= 0
            diff(x,y)=f_target(x,y)-mean;
            sss(x,y)=diff(x,y)*diff(x,y);
        end
    end
end

ssss=0;
for x=1:256
    for y=1:256
            ssss=ssss+sss(x,y);     
    end
end
standard_deviation = sqrt(ssss/count);

end

