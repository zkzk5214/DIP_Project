function x=RandByP4()
%%%%%%%%%%%%%  Function RandByP4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%      Zero out p4=0
%    
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        04/24/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y=rand(1);

if y < 0.2
    x = 1;
elseif y < 0.55
    x = 2;
elseif y < 0.9
    x = 3;
else
    x = RandByP4();
end

end