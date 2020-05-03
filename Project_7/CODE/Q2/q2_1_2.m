%%%%%%%%%%%%%  Main function 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1.Isolate distinct objects and find the minimum bounding rectange  
%      2. Cpmpute the size distribution, pectrum,and complexity of each
%      object
%      3. Use pecstral analysis to determine whcih object in 'match'3 best
%      matchs each of the objects in 'match1'
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be downsampled
%      fzero   MxN image full of zeroes
%      M, N    rows (M) and columns (N) in f
%      ax      weight of distance in pecstral analysis
%      cf      one small objects in 'match1'
%      df      one small objects in 'match1'
%      ef      one small objects in 'match1'
%      gf      one small objects in 'match1'
%      cf3      one small objects in 'match3'
%      df3      one small objects in 'match3'
%      ef3      one small objects in 'match3'
%      gf3      one small objects in 'match3'
% Returned Results:
%     1.Images divided several parts based on bounding box
%     2.Table of size ditribution, pectrum, and complexity
%     3.Best matching pictures of 'match1' and 'match3'
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% pick up 4 parts of match1 and bounding box
f=imread('match1.gif');
f=f(:,:,1);
f=logical(f);
[M, N]=size(f);
[a,b]=find(f);
for i= min(a) : M
    if ismember(i,a)==0
        b1=i;
        break;
    end        
end       
for j= min(b) : N
    if ismember(j,b)==0
        b2=j;
        break;
    end        
end       
c=f(min(a):b1,min(b):b2);
d=f(b1:max(a),min(b):b2);
e=f(min(a):b1,b2:max(b));
g=f(b1:max(a),b2:max(b));
c=logical(c);
d=logical(d);
e=logical(e);
g=logical(g);
[c1,c2]=find(c);
cf=c(min(c1):max(c1),min(c2):max(c2));
figure;imshow(cf);
[d1,d2]=find(d);
df=d(min(d1):max(d1),min(d2):max(d2));
figure;imshow(df);
[e1,e2]=find(e);
ef=e(min(e1):max(e1),min(e2):max(e2));
figure;imshow(ef);
[g1,g2]=find(g);
gf=g(min(g1):max(g1),min(g2):max(g2));
figure;imshow(gf);
%% Compute f(r),U(r),and H of image cf
kernel=zeros(3,3);
for x=1:3
    for y=1:3
        kernel(x,y)=1;
    end
end
fcf=zeros(128);
fcf(30:94,30:84)=cf;
fcf=logical(fcf);
cu=[128,128];
c0=[128,128];
cfcf=(fcf~=0);
cf_area=sum(cfcf(:));
cm=[];
for i=0:15
    cu=size_distribution(fcf,i);
    c0=(cu~=0);
    cm(i+1)=sum(c0(:));
end
cff=[];
for i=0:14
    cff(i+1)=(cm(i+1)-cm(i+2))/cf_area;
end
cfH=0.0000;
cfH=double(cfH);
for i=0:14
    if cff(i+1)~=0
        cfH=cfH-(cff(i+1)*log2(cff(i+1)));
    end
end

%% Compute f(r),U(r),and H of image df
fdf=zeros(128);
fdf(30:103,30:86)=df;
fdf=logical(fdf);
du=[128,128];
d0=[128,128];
dfdf=(fdf~=0);
df_area=sum(dfdf(:));
dm=[];
for i=0:15
    du=size_distribution(fdf,i);
    d0=(du~=0);
    dm(i+1)=sum(d0(:));
end
dff=[];
for i=0:14
    dff(i+1)=(dm(i+1)-dm(i+2))/df_area;
end
dfH=0.0000;
dfH=double(dfH);
for i=0:14
    if dff(i+1)~=0
        dfH=dfH-(dff(i+1)*log2(dff(i+1)));
    end
end

%% Compute f(r),U(r),and H of image ef
fef=zeros(128);
fef(30:101,30:79)=ef;
fef=logical(fef);
eu=[128,128];
e0=[128,128];
efef=(fef~=0);
ef_area=sum(efef(:));
em=[];
for i=0:15
    eu=size_distribution(fef,i);
    e0=(eu~=0);
    em(i+1)=sum(e0(:));
end
eff=[];
for i=0:14
    eff(i+1)=(em(i+1)-em(i+2))/ef_area;
end
efH=0.0000;
efH=double(efH);
for i=0:14
    if eff(i+1)~=0
        efH=efH-(eff(i+1)*log2(eff(i+1)));
    end
end

%% Compute f(r),U(r),and H of image gf
fgf=zeros(128);
fgf(30:91,30:96)=gf;
fgf=logical(fgf);
gu=[128,128];
g0=[128,128];
gfgf=(fgf~=0);
gf_area=sum(gfgf(:));
gm=[];
for i=0:15
    gu=size_distribution(fgf,i);
    g0=(gu~=0);
    gm(i+1)=sum(g0(:));
end
gff=[];
for i=0:14
    gff(i+1)=(gm(i+1)-gm(i+2))/gf_area;
end
gfH=0.0000;
gfH=double(gfH);
for i=0:14
    if gff(i+1)~=0
        gfH=gfH-(gff(i+1)*log2(gff(i+1)));
    end
end

%% pick up 4 parts of match1 and bounding box
f3=imread('match3.gif');
f3=f3(:,:,1);
f3=logical(f3);
[M3, N3]=size(f3);
[a3,b3]=find(f3);
for i= min(a3) : M3
    if ismember(i,a3)==0
        b1=i;
        break;
    end        
end       
for j= min(b3) : N3
    if ismember(j,b3)==0
        b2=j;
        break;
    end        
end       
c3=f3(min(a3):b1,min(b3):b2);
d3=f3(b1:max(a3),min(b3):b2);
e3=f3(min(a3):b1,b2:max(b3));
g3=f3(b1:max(a3),b2:max(b3));
c3=logical(c3);
d3=logical(d3);
e3=logical(e3);
g3=logical(g3);
[c1,c2]=find(c3);
cf3=c3(min(c1):max(c1),min(c2):max(c2));
figure;imshow(cf3);
[d1,d2]=find(d3);
df3=d3(min(d1):max(d1),min(d2):max(d2));
figure;imshow(df3);
[e1,e2]=find(e3);
ef3=e3(min(e1):max(e1),min(e2):max(e2));
figure;imshow(ef3);
[g1,g2]=find(g3);
gf3=g3(min(g1):max(g1),min(g2):max(g2));
figure;imshow(gf3);

%% compute f(r),U(r) and H of image cf3
fcf3=zeros(128);
fcf3(30:98,30:77)=cf3;
fcf3=logical(fcf3);
cu3=[128,128];
c03=[128,128];
cfcf3=(fcf3~=0);
cf_area3=sum(cfcf3(:));
cm3=[];
for i=0:15
    cu3=size_distribution(fcf3,i);
    c03=(cu3~=0);
    cm3(i+1)=sum(c03(:));
end
cff3=[];
for i=0:14
    cff3(i+1)=(cm3(i+1)-cm3(i+2))/cf_area3;
end
cfH3=0.0000;
cfH3=double(cfH3);
for i=1:14
    if cff3(i+1)~=0
        cfH3=cfH3-(cff3(i+1)*log(cff3(i+1)));
    end
end

%% compute f(r),U(r) and H of image df3
fdf3=zeros(128);
fdf3(30:103,30:87)=df3;
fdf3=logical(fdf3);
du3=[128,128];
d03=[128,128];
dfdf3=(fdf3~=0);
df_area3=sum(dfdf3(:));
dm3=[];
for i=0:15
    du3=size_distribution(fdf3,i);
    d03=(du3~=0);
    dm3(i+1)=sum(d03(:));
end
dff3=[];
for i=0:14
    dff3(i+1)=(dm3(i+1)-dm3(i+2))/df_area3;
end
dfH3=0.0000;
dfH3=double(dfH3);
for i=0:14
    if dff3(i+1)~=0
        dfH3=dfH3-(dff3(i+1)*log(dff3(i+1)));
    end
end

%% compute f(r),U(r) and H of image ef3
fef3=zeros(128);
fef3(30:99,30:75)=ef3;
fef3=logical(fef3);
eu3=[128,128];
e03=[128,128];
efef3=(fef3~=0);
ef_area3=sum(efef3(:));
em3=[];
for i=0:15
    eu3=size_distribution(fef3,i);
    e03=(eu3~=0);
    em3(i+1)=sum(e03(:));
end
eff3=[];
for i=0:14
    eff3(i+1)=(em3(i+1)-em3(i+2))/ef_area3;
end
efH3=0.0000;
efH3=double(efH3);
for i=0:14
    if eff3(i+1)~=0
        efH3=efH3-(eff3(i+1)*log(eff3(i+1)));
    end
end

%% compute f(r),U(r) and H of image gf3
fgf3=zeros(128);
fgf3(30:112,30:78)=gf3;
fgf3=logical(fgf3);
gu3=[128,128];
g03=[128,128];
gfgf3=(fgf3~=0);
gf_area3=sum(gfgf3(:));
gm3=[];
for i=0:15
    gu3=size_distribution(fgf3,i);
    g03=(gu3~=0);
    gm3(i+1)=sum(g03(:));
end
gff3=[];
for i=0:14
    gff3(i+1)=(gm3(i+1)-gm3(i+2))/gf_area3;
end
gfH3=0.0000;
gfH3=double(gfH3);
for i=0:14
    if gff3(i+1)~=0
        gfH3=gfH3-(gff3(i+1)*log(gff3(i+1)));
    end
end

%% Compute the distance of pattern recognization
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
    ax = -20;
    dp11=dp11+exp(ax*power(cff(i)-cff3(i),2))*power(cff(i)-cff3(i),2);
    dp12=dp12+exp(ax*power(cff(i)-dff3(i),2))*power(cff(i)-dff3(i),2);
    dp13=dp13+exp(ax*power(cff(i)-eff3(i),2))*power(cff(i)-eff3(i),2);
    dp14=dp14+exp(ax*power(cff(i)-gff3(i),2))*power(cff(i)-gff3(i),2);
    
    dp21=dp21+exp(ax*power(dff(i)-cff3(i),2))*power(dff(i)-cff3(i),2);
    dp22=dp22+exp(ax*power(dff(i)-dff3(i),2))*power(dff(i)-dff3(i),2);
    dp23=dp23+exp(ax*power(dff(i)-eff3(i),2))*power(dff(i)-eff3(i),2);
    dp24=dp24+exp(ax*power(dff(i)-gff3(i),2))*power(dff(i)-gff3(i),2);
    
    dp31=dp31+exp(ax*power(eff(i)-cff3(i),2))*power(eff(i)-cff3(i),2);
    dp32=dp32+exp(ax*power(eff(i)-dff3(i),2))*power(eff(i)-dff3(i),2);
    dp33=dp33+exp(ax*power(eff(i)-eff3(i),2))*power(eff(i)-eff3(i),2);
    dp34=dp34+exp(ax*power(eff(i)-gff3(i),2))*power(eff(i)-gff3(i),2);
    
    dp41=dp41+exp(ax*power(gff(i)-cff3(i),2))*power(gff(i)-cff3(i),2);
    dp42=dp42+exp(ax*power(gff(i)-dff3(i),2))*power(gff(i)-dff3(i),2);
    dp43=dp43+exp(ax*power(gff(i)-eff3(i),2))*power(gff(i)-eff3(i),2);
    dp44=dp44+exp(ax*power(gff(i)-gff3(i),2))*power(gff(i)-gff3(i),2);
end
dp=[dp11,dp12,dp13,dp14;dp21,dp22,dp23,dp24;dp31,dp32,dp33,dp34;dp41,dp42,dp43,dp44];
fmatch={cf,df,ef,gf;cf3,df3,ef3,gf3};
[fmatch1row,fmatch1col]=find(dp==min(dp(1,:)));
figure;subplot(1,2,1);imshow(fmatch{1,1});subplot(1,2,2);imshow(fmatch{2,fmatch1col});
[fmatch2row,fmatch2col]=find(dp==min(dp(2,:)));
figure;subplot(1,2,1);imshow(fmatch{1,2});subplot(1,2,2);imshow(fmatch{2,fmatch2col});
[fmatch3row,fmatch3col]=find(dp==min(dp(3,:)));
figure;subplot(1,2,1);imshow(fmatch{1,3});subplot(1,2,2);imshow(fmatch{2,fmatch3col});
[fmatch4row,fmatch4col]=find(dp==min(dp(4,:)));
figure;subplot(1,2,1);imshow(fmatch{1,4});subplot(1,2,2);imshow(fmatch{2,fmatch4col});

%% Generate size distribution table of match1 
nametable = {};
for i=0:15
    str = ['U[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=cm;
object2=dm;
object3=em;
object4=gm;
sdTable_match1 = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate pectrum table of match1 
nametable = {};
for i=0:14
    str = ['f[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=roundn(cff,-4);
object2=roundn(dff,-4);
object3=roundn(eff,-4);
object4=roundn(gff,-4);
psTable_match1 = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate size distribution table of match3 
nametable = {};
for i=0:15
    str = ['U[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=cm3;
object2=dm3;
object3=em3;
object4=gm3;
sdTable_match3 = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate pectrum table of match3 
nametable = {};
for i=0:14
    str = ['f[',num2str(i),']'];
    newstr = join(str);
    nametable = horzcat(nametable,{newstr});
end
object1=roundn(cff3,-4);
object2=roundn(dff3,-4);
object3=roundn(eff3,-4);
object4=roundn(gff3,-4);
psTable_match3 = table(object1',object2',object3',object4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');
%% Generate pectrum table of match3 
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
d1 = roundn(d1,-4);
d2 = roundn(d2,-4);
d3 = roundn(d3,-4);
d4 = roundn(d4,-4);
distable = table(d1',d2',d3',d4','VariableNames',{'object1','object2','object3','object4',},'RowNames',nametable');