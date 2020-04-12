%%%%%%%%%%%%%  Main function 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1.Isolate distinct objects and find the minimum bounding rectange  
%      2. Cpmpute the size distribution, pectrum,and complexity of each
%      object
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
%    
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
f3=logical(f3);
[M3, N3]=size(f3);
[a3,b3]=find(f3);

for i= min(a3) : M3
    if ismember(i,a3)==0
        b1=i
        break;
    end        
end       
b1
for j= min(b3) : N3
    if ismember(j,b3)==0
        b2=j
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
cf3=c3(min(c1):max(c1),min(c2):max(c2))
figure;imshow(cf3);
[d1,d2]=find(d3);
df3=d3(min(d1):max(d1),min(d2):max(d2))
figure;imshow(df3);
[e1,e2]=find(e3);
ef3=e3(min(e1):max(e1),min(e2):max(e2))
figure;imshow(ef3);
[g1,g2]=find(g3);
gf3=g3(min(g1):max(g1),min(g2):max(g2))
figure;imshow(gf3);
%% compute the f(r),U(r)and H of cf3
fcf3=zeros(128);
fcf3(30:98,30:77)=cf3;
fcf3=logical(fcf3);
cu3=[128,128];
c03=[128,128];
cfcf3=(fcf3~=0);
cf_area3=sum(cfcf3(:));
cm3=[];
for i=1:15
    cu3=size_distribution(fcf3,i);
    c03=(cu3~=0);
    cm3(i)=sum(c03(:));
end
cff3=[]
for i=1:14
    cff3(i)=(cm3(i)-cm3(i+1))/cf_area3;
end
cfH3=0.0000;
cfH3=double(cfH3);
for i=1:14
    if cff3(i)~=0;
        cfH3=cfH3-(cff3(i)*log(cff3(i)));
    end
end
%% Compute the f(r),U(r)and H of df3
fdf3=zeros(128);
fdf3(30:103,30:87)=df3;
fdf3=logical(fdf3);
du3=[128,128];
d03=[128,128];
dfdf3=(fdf3~=0);
df_area3=sum(dfdf3(:));
dm3=[];
for i=1:15
    du3=size_distribution(fdf3,i);
    d03=(du3~=0);
    dm3(i)=sum(d03(:));
end
dff3=[]
for i=1:14
    dff3(i)=(dm3(i)-dm3(i+1))/df_area3;
end
dfH3=0.0000;
dfH3=double(dfH3);
for i=1:14
    if dff3(i)~=0;
        dfH3=dfH3-(dff3(i)*log(dff3(i)));
    end
end
%% Compute the f(r),U(r)and H of ef3
fef3=zeros(128);
fef3(30:99,30:75)=ef3;
fef3=logical(fef3);
eu3=[128,128];
e03=[128,128];
efef3=(fef3~=0);
ef_area3=sum(efef3(:));
em3=[];
for i=1:15
    eu3=size_distribution(fef3,i);
    e03=(eu3~=0);
    em3(i)=sum(e03(:));
end
eff3=[]
for i=1:14
    eff3(i)=(em3(i)-em3(i+1))/ef_area3;
end
efH3=0.0000;
efH3=double(efH3);
for i=1:14
    if eff3(i)~=0;
        efH3=efH3-(eff3(i)*log(eff3(i)));
    end
end
%% Compute the f(r),U(r)and H of gf3
fgf3=zeros(128);
fgf3(30:112,30:78)=gf3;
fgf3=logical(fgf3);
gu3=[128,128];
g03=[128,128];
gfgf3=(fgf3~=0);
gf_area3=sum(gfgf3(:));
gm3=[];
for i=1:15
    gu3=size_distribution(fgf3,i);
    g03=(gu3~=0);
    gm3(i)=sum(g03(:));
end
gff3=[]
for i=1:14
    gff3(i)=(gm3(i)-gm3(i+1))/gf_area3;
end
gfH3=0.0000;
gfH3=double(gfH3);
for i=1:14
    if gff3(i)~=0
        gfH3=gfH3-(gff3(i)*log(gff3(i)));
    end
end
