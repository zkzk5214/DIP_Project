function pdfandcdf_8BIN(f)
%PDFANDCDF_8BIN Use for calculate the PDF and the CDF of image f, and
%  divided the data into 8 bins, each containing 32 gray level values. 

%f = imread('truck.gif');
%f = f(:,:,1);
row=size(f,1);
column=size(f,2);

%  PDF
pr_=zeros(1,8);
pr=zeros(1,8);
for x=1:row
    for y=1:column
        r = f(x,y);
            h=ceil(double(r+1)/32);
        pr_(h) = pr_(h)+1;
        pr(h) = pr_(h)/(row*column);
    end
end
    
%  CDF
cr=zeros(1,8);
a=zeros(1,8);
for h = 1:8
    for j = 1:h
        a(h)=a(h)+pr(j);
    end
    cr(h)=cr(h)+a(j);
end

%  Show the histogram of PDF and CDF
figure;bar((0:32:255),pr,'histc');title('q1histogram');axis tight;saveas(gcf,'q1histogrambin.tif');
%figure;bar(pr);axis tight;
figure;bar((0:32:255),cr,'histc');title('q1cdf');axis tight;saveas(gcf,'q1cdfbin.tif');

end