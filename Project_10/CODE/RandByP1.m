%%%%%%%%%%%%%  Function RandByP1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%      Zero out p1=0
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/24/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = RandByP1()

y = rand(1);

if y < 0.35
    x = 2;
elseif y < 0.7
    x = 3;
elseif y < 0.8
    x = 4;
else
    x = RandByP1();
end

end