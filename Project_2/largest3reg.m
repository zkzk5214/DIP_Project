function image=largest3reg(threshold)
%LARGEST3REG Choosing an assigned threshold and find the 8-connected 
%  components of the threshold image, then save the 3 largest components 
%  of the labeled image and delete the other components by setting 
%  constituent pixels to 0.

f=imread('lenna.gif');
[M, N] = size(f);

for x = 1:M
    for y = 1:N
        if f(x,y)>=threshold % threshold = 188
            f(x,y)=1;
        else
            f(x,y)=0;        
        end
    end
end

fthresh=f;

figure,imshow(fthresh,[]);title('fthresh');saveas(gcf,'Q1a_fthresh.tif');

[flabel,~] = bwlabel(fthresh,8);

stats = regionprops(flabel,'Area');     
[~,index]=sort([stats.Area],'descend'); 

for x = 1:M
    for y = 1:N
        if flabel(x,y)==index(1)||flabel(x,y)==index(2)||flabel(x,y)==index(3); 
            flabel(x,y)=1;
        else
            flabel(x,y)=0;        
        end
    end
end

image=imshow(flabel,[]);

end 
