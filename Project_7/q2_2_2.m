%%%%%%%%%%%%%  Main function 3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1.Isolate distinct objects and find the minimum bounding rectange  
%      2. Cpmpute the size distribution, pectrum,and complexity of each
%      object
%      3. Use pecstral analysis to determine whcih object in 'match'3 best
%      matchs each of the objects in 'shadow1'
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be downsampled
%      fzero   MxN image full of zeroes
%      M, N    rows (M) and columns (N) in f
%      ax      weight of distance in pecstral analysis
%      cf      one small objects in 'shadow1'
%      df      one small objects in 'shadow1'
%      ef      one small objects in 'shadow1'
%      gf      one small objects in 'shadow1'
%      rcf      one small objects in 'shadow1rotated'
%      rdf      one small objects in 'shadow1rotated'
%      ref      one small objects in 'shadow1rotated'
%      rgf      one small objects in 'shadow1rotated'
% Returned Results:
%     1.Images divided several parts based on bounding box
%     2.Table of size ditribution, pectrum, and complexity
%     3.Best matching pictures of 'shadow1' and 'shadow1rotated'
% Processing Flow:
%    By calling different functions to get different results
%
%  Restrictions/Notes:
%      none  
%
%  Calling functions
%    DiationOwn,erosion.m size_distribution
%
%  Author:      Wenrui Wang, Naichao Yin, Zekai Liu
%  Date:        02/20/2020
%% pick up soild area of shadow1.gif and bounding box
f3=imread('shadow1.gif');
f3=f3(:,:,1);
[flable,num]=bwlabel(f3,8);
figure;imshow(flable);
[M,N]=size(flable);
f4=zeros(M);
f5=zeros(M);
f6=zeros(M);
f7=zeros(M);
for i=1:M;
    for j=1:N;
        if flable(i,j)==1;
            f4(i,j)=f3(i,j);       
        end
    end
end
for i=1:M;
    for j=1:N;
        if flable(i,j)==3;
            f5(i,j)=f3(i,j);
        end
    end
end
for i=1:M;
    for j=1:N;
        if flable(i,j)==6;
            f6(i,j)=f3(i,j);                  
        end
    end
end
for i=1:M;
    for j=1:N;
        if flable(i,j)==9;
            f7(i,j)=f3(i,j);                   
        end
    end
end
figure; imshow(f4);figure; imshow(f5);figure; imshow(f6);figure; imshow(f7);
[a4,b4]=find(f4);[a5,b5]=find(f5);[a6,b6]=find(f6);[a7,b7]=find(f7);
cf=f4(min(a4):max(a4),min(b4):max(b4));
figure;imshow(cf);
df=f5(min(a5):max(a5),min(b5):max(b5));
figure;imshow(df);
ef=f6(min(a6):max(a6),min(b6):max(b6));
figure;imshow(ef);
gf=f7(min(a7):max(a7),min(b7):max(b7));
figure;imshow(gf);
%% compute the f(r),U(r)and H of f4
cfcf4=(f4~=0);
cf_area4=sum(cfcf4(:));
cm4=[];
for i=0:15
    cu4=size_distribution(f4,i);
    c04=(cu4~=0);
    cm4(i+1)=sum(c04(:));
end
cff4=[];
for i=0:14
    cff4(i+1)=(cm4(i+1)-cm4(i+2))/cf_area4;
end
cfH4=0.0000;
cfH4=double(cfH4);
for i=0:14
    if cff4(i+1)~=0;
        cfH4=cfH4-(cff4(i+1)*log2(cff4(i+1)));
    end
end
%% compute the f(r),U(r)and H of f5
cfcf5=(f5~=0);
cf_area5=sum(cfcf5(:));
cm5=[];
for i=0:15
    cu5=size_distribution(f5,i);
    c05=(cu5~=0);
    cm5(i+1)=sum(c05(:));
end
cff5=[];
for i=0:14
    cff5(i+1)=(cm5(i+1)-cm5(i+2))/cf_area5;
end
cfH5=0.0000;
cfH5=double(cfH5);
for i=0:14
    if cff5(i+1)~=0;
        cfH5=cfH5-(cff5(i+1)*log2(cff5(i+1)));
    end
end
%% compute the f(r),U(r)and H of f6
cfcf6=(f6~=0);
cf_area6=sum(cfcf6(:));
cm6=[];
for i=0:15
    cu6=size_distribution(f6,i);
    c06=(cu6~=0);
    cm6(i+1)=sum(c06(:));
end
cff6=[];
for i=0:14
    cff6(i+1)=(cm6(i+1)-cm6(i+2))/cf_area6;
end
cfH6=0.0000;
cfH6=double(cfH6);
for i=0:14
    if cff6(i+1)~=0;
        cfH6=cfH6-(cff6(i+1)*log2(cff6(i+1)));
    end
end
%% compute the f(r),U(r)and H of f7
cfcf7=(f7~=0);
cf_area7=sum(cfcf7(:));
cm7=[];
for i=0:15
    cu7=size_distribution(f7,i);
    c07=(cu7~=0);
    cm7(i+1)=sum(c07(:));
end
cff7=[];
for i=0:14
    cff7(i+1)=(cm7(i+1)-cm7(i+2))/cf_area7;
end
cfH7=0.0000;
cfH7=double(cfH7);
for i=0:14
    if cff7(i+1)~=0;
        cfH7=cfH7-(cff7(i+1)*log2(cff7(i+1)));
    end
end
%% pick up soild area of shadow1rotated.gif and bounding box
rf3=imread('shadow1rotated.gif');
rf3=rf3(:,:,1);
[rflable,num]=bwlabel(rf3,8);
figure;imshow(rflable);
[M,N]=size(rflable);
rf4=zeros(M);
rf5=zeros(M);
rf6=zeros(M);
rf7=zeros(M);
for i=1:M;
    for j=1:N;
        if rflable(i,j)==2
            rf4(i,j)=rf3(i,j);                  
        end
    end
end
%f4=logical(f4);
for i=1:M;
    for j=1:N;
        if rflable(i,j)==3
            rf5(i,j)=rf3(i,j);                   
        end
    end
end
for i=1:M;
    for j=1:N;
        if rflable(i,j)==6
            rf6(i,j)=rf3(i,j);                
        end
    end
end
for i=1:M;
    for j=1:N;
        if rflable(i,j)==8
            rf7(i,j)=rf3(i,j);                 
        end
    end
end
figure; imshow(rf4);figure; imshow(rf5);figure; imshow(rf6);figure; imshow(rf7);
[ra4,rb4]=find(rf4);[ra5,rb5]=find(rf5);[ra6,rb6]=find(rf6);[ra7,rb7]=find(rf7);
rcf=rf4(min(ra4):max(ra4),min(rb4):max(rb4));
figure;imshow(rcf);
rdf=rf5(min(ra5):max(ra5),min(rb5):max(rb5));
figure;imshow(rdf);
ref=rf6(min(ra6):max(ra6),min(rb6):max(rb6));
figure;imshow(ref);
rgf=rf7(min(ra7):max(ra7),min(rb7):max(rb7));
figure;imshow(rgf);
%% compute f(r),U(r) and H of image rf4
rcfcf4=(rf4~=0);
rcf_area4=sum(rcfcf4(:));
rcm4=[];
for i=0:15
    rcu4=size_distribution(rf4,i);
    rc04=(rcu4~=0);
    rcm4(i+1)=sum(rc04(:));
end
rcff4=[];
for i=0:14
    rcff4(i+1)=(rcm4(i+1)-rcm4(i+2))/rcf_area4;
end
rcfH4=0.0000;
rcfH4=double(rcfH4);
for i=0:14
    if rcff4(i+1)~=0;
        rcfH4=rcfH4-(rcff4(i+1)*log2(rcff4(i+1)));
    end
end
%% compute f(r),U(r) and H of image rf5
rcfcf5=(f5~=0);
rcf_area5=sum(rcfcf5(:));
rcm5=[];
for i=0:15
    rcu5=size_distribution(rf5,i);
    rc05=(rcu5~=0);
    rcm5(i+1)=sum(rc05(:));
end
rcff5=[];
for i=0:14
    rcff5(i+1)=(rcm5(i+1)-rcm5(i+2))/rcm5(1);
end
rcfH5=0.0000;
rcfH5=double(rcfH5);
for i=0:14
    if rcff5(i+1)~=0;
        rcfH5=rcfH5-(rcff5(i+1)*log2(rcff5(i+1)));
    end
end
%% compute f(r),U(r) and H of image rf6
rcfcf6=(f6~=0);
rcf_area6=sum(rcfcf6(:));
rcm6=[];
for i=0:15
    rcu6=size_distribution(rf6,i);
    rc06=(rcu6~=0);
    rcm6(i+1)=sum(rc06(:));
end
rcff6=[];
for i=0:14
    rcff6(i+1)=(rcm6(i+1)-rcm6(i+2))/rcm6(1);
end
rcfH6=0.0000;
rcfH6=double(rcfH6);
for i=0:14
    if rcff6(i+1)~=0;
        rcfH6=rcfH6-(rcff6(i+1)*log2(rcff6(i+1)));
    end
end
%% compute f(r),U(r) and H of image rf7
rcfcf7=(f7~=0);
rcf_area7=sum(rcfcf7(:));
rcm7=[];
for i=0:15
    rcu7=size_distribution(rf7,i);
    rc07=(rcu7~=0);
    rcm7(i+1)=sum(rc07(:));
end
rcff7=[];
for i=0:14
    rcff7(i+1)=(rcm7(i+1)-rcm7(i+2))/rcm7(1);
end
rcfH7=0.0000;
rcfH7=double(rcfH7);
for i=0:14
    if rcff7(i+1)~=0;
        rcfH7=rcfH7-(rcff7(i+1)*log2(rcff7(i+1)));
    end
end
%% compute the distance of pattern recognization
dp11=0.0000;
dp11=double(dp11);
dp12=0.0000;
dp12=double(dp12);
dp13=0.0000;
dp13=double(dp13);
dp14=0.0000;
dp14=double(dp14);
dp21=0.0000;
dp21=double(dp21);
dp22=0.0000;
dp22=double(dp22);
dp23=0.0000;
dp23=double(dp23);
dp24=0.0000;
dp24=double(dp24);
dp31=0.0000;
dp31=double(dp31);
dp32=0.0000;
dp32=double(dp32);
dp33=0.0000;
dp33=double(dp33);
dp34=0.0000;
dp34=double(dp34);
dp41=0.0000;
dp41=double(dp41);
dp42=0.0000;
dp42=double(dp42);
dp43=0.0000;
dp43=double(dp43);
dp44=0.0000;
dp44=double(dp44);
for i=1:15
    ax = 30;
    dp11=dp11+exp(1*power(cff4(i)-rcff4(i),2))*power(cff4(i)-rcff4(i),2);
    dp12=dp12+exp(1*power(cff5(i)-rcff4(i),2))*power(cff5(i)-rcff4(i),2);
    dp13=dp13+exp(1*power(cff6(i)-rcff4(i),2))*power(cff6(i)-rcff4(i),2);
    dp14=dp14+exp(1*power(cff7(i)-rcff4(i),2))*power(cff7(i)-rcff4(i),2);
    
    dp21=dp21+exp(ax*power(cff4(i)-rcff5(i),2))*power(cff4(i)-rcff5(i),2);
    dp22=dp22+exp(ax*power(cff5(i)-rcff5(i),2))*power(cff5(i)-rcff5(i),2);
    dp23=dp23+exp(ax*power(cff6(i)-rcff5(i),2))*power(cff6(i)-rcff5(i),2);
    dp24=dp24+exp(ax*power(cff7(i)-rcff5(i),2))*power(cff7(i)-rcff5(i),2);
    
    dp31=dp31+exp(1*power(cff4(i)-rcff6(i),2))*power(cff4(i)-rcff6(i),2);
    dp32=dp32+exp(1*power(cff5(i)-rcff6(i),2))*power(cff5(i)-rcff6(i),2);
    dp33=dp33+exp(1*power(cff6(i)-rcff6(i),2))*power(cff6(i)-rcff6(i),2);
    dp34=dp34+exp(1*power(cff7(i)-rcff6(i),2))*power(cff7(i)-rcff6(i),2);
    
    dp41=dp41+exp(1*power(cff4(i)-rcff7(i),2))*power(cff4(i)-rcff7(i),2);
    dp42=dp42+exp(1*power(cff5(i)-rcff7(i),2))*power(cff5(i)-rcff7(i),2);      
    dp43=dp43+exp(1*power(cff6(i)-rcff7(i),2))*power(cff6(i)-rcff7(i),2);
    dp44=dp44+exp(1*power(cff7(i)-rcff7(i),2))*power(cff7(i)-rcff7(i),2);    
end
dp=[dp11,dp12,dp13,dp14;dp21,dp22,dp23,dp24;dp31,dp32,dp33,dp34;dp41,dp42,dp43,dp44];
fmatch={rcf,rdf,ref,rgf;cf,df,ef,gf};
[fmatch1row,fmatch1col]=find(dp==min(dp(1,:)));
figure;subplot(1,2,1);imshow(fmatch{1,1});subplot(1,2,2);imshow(fmatch{2,fmatch1col});
[fmatch2row,fmatch2col]=find(dp==min(dp(2,:)));
figure;subplot(1,2,1);imshow(fmatch{1,2});subplot(1,2,2);imshow(fmatch{2,fmatch2col});
[fmatch3row,fmatch3col]=find(dp==min(dp(3,:)));
figure;subplot(1,2,1);imshow(fmatch{1,3});subplot(1,2,2);imshow(fmatch{2,fmatch3col});
[fmatch4row,fmatch4col]=find(dp==min(dp(4,:)));
figure;subplot(1,2,1);imshow(fmatch{1,4});subplot(1,2,2);imshow(fmatch{2,fmatch4col});
%% Generate spectrum distance table of shadow1 and shadow1rotated
nametable = {};
for i=1:4
    str = ['object',num2str(i)];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
d1 = [dp11,dp12,dp13,dp14];
d2 = [dp21,dp22,dp23,dp24];
d3 = [dp31,dp32,dp33,dp34];
d4 = [dp41,dp42,dp43,dp44];
distable = table(d1',d2',d3',d4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate size distribution table of shadow1 
nametable = {};
for i=0:15
    str = ['U[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=cm4;
object2=cm5;
object3=cm6;
object4=cm7;
sdTable_shadow1 = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate pectrum table of shadow1 
nametable = {};
for i=0:14
    str = ['f[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=roundn(cff4,-4);
object2=roundn(cff5,-4);
object3=roundn(cff6,-4);
object4=roundn(cff7,-4);
psTable_shadow1  = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate size distribution table of shadow1rotated 
nametable = {};
for i=0:15
    str = ['U[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=rcm4;
object2=rcm5;
object3=rcm6;
object4=rcm7;
sdTable_shadow1rotated = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate pectrum table of shadow1rotated 
nametable = {};
for i=0:14
    str = ['f[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=roundn(rcff4,-4);
object2=roundn(rcff5,-4);
object3=roundn(rcff6,-4);
object4=roundn(rcff7,-4);
psTable_shadow1rotated = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
 
    