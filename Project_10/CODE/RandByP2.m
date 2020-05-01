function x=RandByP2()
%%%%%%%%%%%%%  Function RandByP2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%      Zero out p2=0
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/24/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=rand(1);

if y < 0.2
    x = 1;
elseif y < 0.55
    x = 3;
elseif y < 0.65
    x = 4;
else
    x = RandByP2();
end

end