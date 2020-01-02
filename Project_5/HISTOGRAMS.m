function HISTOGRAMS(f)
%HISTOGRAMS USE FOR PLOTTING BAR FOR NUMERIC DATA (GRAY-LEVEL OF IMAGE f) 
%  THAT GROUP THE DATA INTO INTO BINS. 

row=size(f,1);
column=size(f,2);
h=zeros(1,256);

%  CALCULATE
for x=1:row
    for y=1:column
        
        r = f(x,y);
        h(r+1) = h(r+1)+1;
        
    end
end

%  SHOW 
figure;bar((0:1:255),h);title('Histogram');axis tight;

end
