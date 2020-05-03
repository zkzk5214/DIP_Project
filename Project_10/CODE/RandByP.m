%%%%%%%%%%%%%  Function RandByP  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Creat a set of probabilities apply for ALF
%
% Input Variables:
%      None
%
% Returned Results:
%      Index of Transformation Matrix
%
% Restrictions/Notes:
%      Probablity of choosing x 
%      P(x=1)=20%, P(x=2)=35%
%      P(x=3)=35%, P(x=4)=10%
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/24/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x] = RandByP()

y = rand(1);

if y < 0.2
    x = 1;
elseif y < 0.55
    x = 2;
elseif y < 0.9
    x = 3;
else
    x = 4;
end

end