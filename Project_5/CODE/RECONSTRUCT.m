function [k]=RECONSTRUCT(f,j)
%RECONSTRUCT USE FOR RECONSTRUCT TALL CHARACTERS: 1.DO DILATION FOR f BY 
%  MASK 3X3 2.DO LOGIC OPERATE "AND" BETWEEN THE "MAKER" IMAGE (f1) AND 
%  THE CONSTRAINT MASK (j). THE IMAGE(k) IS THE RESULT OF AN ITERATION.    
%  WHERE (f) IS THE EROSION-LETTER IMAGE

[M,N]=size(f);
k=zeros(M,N);
f1=zeros(M,N);

%  DILATION
for x=2:M-1
    for y=2:N-1
      if f(x-1,y-1)==0 || f(x,y-1)==0 || f(x+1,y-1)==0||...
            f(x-1,y)==0 || f(x,y)==0 || f(x+1,y)==0||...
            f(x-1,y+1)==0 || f(x,y+1)==0 || f(x+1,y+1)==0 
         f1(x,y) = 0;
      else
         f1(x,y) = 255;
     end
    end
end

%  SET THE UNDILATION LINE TO 255
for x=1
    for y=1:N
        f1(x,y) = 255;
    end
end
for x=409
    for y=1:N
        f1(x,y) = 255;
    end
end
for x=1:M
    for y=1
        f1(x,y) = 255;
    end
end
for x=1:M
    for y=409
        f1(x,y) = 255;
    end
end

%  AND
for x=1:M
    for y=1:N       
        if (j(x,y)==0)&&(f1(x,y)==0)
            k(x,y) = 0;
        elseif (j(x,y)==255)&&(f1(x,y)==0)
            k(x,y) = 255;
        elseif (j(x,y)==0)&&(f1(x,y)==255)
            k(x,y) = 255;
        else
            k(x,y) = 255;
        end     
    end    
end
%figure,imshow(k,[]),title('RECONSTRUCT-LETTER');

end

