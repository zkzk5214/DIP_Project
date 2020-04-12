function pdfandcdf(f)
%PDFANDCDF Use for calculate the PDF and the CDF of image f, and
%  representing all 256 gray levels. 

%f = imread('truck.gif');
%f = f(:,:,1);
row=size(f,1);
column=size(f,2);

%  PDF
pr_=zeros(1,256);
pr=zeros(1,256);
for x=1:row
    for y=1:column
        r = f(x,y);
        pr_(r+1) = pr_(r+1)+1;
        pr(r+1) = pr_(r+1)/(row*column);
    end
end

%  CDF
cr=zeros(1,256);
a=zeros(1,256);
for r = 1:256
    for j = 1:r
        a(r)=a(r)+pr(j);
    end
    cr(r)=cr(r)+a(j);
end

%  Show the histogram of PDF and CDF
figure;bar((0:1:255),pr);title('histogram');axis tight;
%figure;bar(pr);axis tight;
figure;bar((0:1:255),cr);title('cdf');axis tight;

end
