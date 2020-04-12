function [k] = EDGE_DETECTION(f)
%EDGE_DETECTION USE FOR ERODES INPUT IN x & y DIRECTIONS SEPARATELY.
%  COMBINES EACH EROSION TO 1 IMAGE.
%  INVERT COMBINATION AND SUBTRACT FROM INPUT.
%  WHERE f IS THE EXTRACTED LETTES IMAGE

%  erode f
[M, N] = size(f);   
k0 = zeros(M, N);
k1 = zeros(M, N);
a = zeros(1, 3);

%  x direction
    for x = 2 : (M - 1)
        for y = 1 : N

            for i = -1 : 1
                a( i + 2 ) = f( x-i, y );  
            end
            
            k0(x,y) = max(a);
            
        end
    end
    
    %figure, imshow( k0 )
    
%  y direction
    for x = 1 : M
        for y = 2 : (N-1)
            
            for i = -1 : 1
                a( i + 2 ) = f( x, y-i );  
            end
            
            k1(x,y) = max(a);
            
        end
    end 
    
    %figure, imshow( k1 )
    
%  combine x & y directions into 1 image
    k = k0 | k1;   
    k = f | ( ~k );  
    
    figure, imshow( k );

end
