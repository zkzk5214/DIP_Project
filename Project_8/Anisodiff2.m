%%%%%%%%%%%%%  Function Anisodiff2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      to creat an Anisotropic Diffusion filter by applying exponential
%      function
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be interpolated
%      lam,k   parameter of the Anisotropic Diffusion filter
%      iter    iteration times
% Returned Results:
%     new image after applying Anisotropic Diffusion filter
%
% Processing Flow:
%      1.  Calculate the divergence of the image in four direction
%      2.  Apply inverse quadratic function in the filter
%      3.  Calculate the final result
%  
%
% The following functions are called:
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        03/25/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ad=Anisodiff2(f,lam,k,iter)
[M,N]=size(f);
I=f;
IN=zeros(M,N);
a=zeros(M,N);
IS=zeros(M,N);
IE=zeros(M,N);
IW=zeros(M,N);
cs=zeros(M,N);
cw=zeros(M,N);
cn=zeros(M,N);
ce=zeros(M,N);
for p=0:iter
    for i =2:M-1
        for j = 2:N-1
            IN(i,j)=I(i,j+1)-I(i,j);
            IS(i,j)=I(i,j-1)-I(i,j);
            IW(i,j)=I(i-1,j)-I(i,j);
            IE(i,j)=I(i+1,j)-I(i,j);
            cn(i,j)=1/(1+power((abs(IN(i,j)/k)),2));
            cs(i,j)=1/(1+power((abs(IS(i,j)/k)),2));
            cw(i,j)=1/(1+power((abs(IW(i,j)/k)),2));
            ce(i,j)=1/(1+power((abs(IE(i,j)/k)),2));
            a(i,j)=(lam*(cn(i,j)*IN(i,j)+cs(i,j)*IS(i,j)+cw(i,j)*IW(i,j)+ce(i,j)*IE(i,j)));
             
        end
    end
    I=I+a;
end
ad=I;