%%%%%%%%%%%%% mainproj3.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Sample items pertaining to Project #3
%      on DFT-based image filtering
%
% Input Variables:
%      f       Input 2D image (checker & lake)
%      M, N    Rows (M) and columns in f
%      
% Returned Results:
%      Question1:
%          g         Move DC offset of input image
%          H         LPF 
%          H_center  Centered version of LPF
%          G         A filtered version of input image
%      Question2:
%          F         FFT of input image
%          c/C       corrupted of input image (without/FFT)                          
%          g/G       A filtered version of input image (without/FFT)           
%
% The following functions are called:
%      notch.m   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 


%%%%%%%%%%%%%%%Question 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=imread('checker.gif');
[M, N] = size(f);
imtool(f,[ ]);
F = fft2(double(f));

%-----Q1-a------------------------------------------------------------
% Part 1:  move the DC offset 
% 1.  M x N FFT of f --> F
% 2.  Set F(1,1) --> 0
% 3.  Do IFFT

F(1,1) = 0.0;
g   = real(ifft2(F));
imtool(g); 

%-----Q1-b------------------------------------------------------------
% Part 2:  Do M x N unpadded operations
% 1.  Get Gaussian M x N LPF (H)
% 2.  Centers H -->H_center
% 3.  Filter F with H --> G
% 4.  G Do IFFT -->g
% 5.  Filter F with H_center --> |G|  

sig = 15.0;
H   = lpfilter('gaussian', M, N, sig);
% Plot Scaled version of |H(u,v)|
imtool(log(1 + H),[]);

% Centers the filter
h = ifft2(H);
for x = 1 : M
    for y = 1 : N
        h_center(x,y) = double( h(x,y) * (-1)^(x+y) );
    end
end
H_center = fft2(h_center);
% Make 3D plot of H(u,v)
mesh(abs( H_center(1:256, 1:256)));

% Loop for filtered image
for u = 1 : M
    for v = 1 : N
        G(u,v) = H(u,v)*F(u,v);
    end
end
g   = real(ifft2(G));
imtool(g, []);

% Loop for centered filter
for u = 1 : M
    for v = 1 : N
        G(u,v) = H_center(u,v)*F(u,v);
    end
end
%g = real(ifft2(G));
imtool( log( 1 + abs(G) ), []);

%-----Q1-c------------------------------------------------------------
% Part 3:  Do P x Q padded operations
% 1.  Get Gaussian P x Q LPF (H)
% 2.  Filter F with H --> G
% 3.  G Do IFFT -->g
% 4.  Fft (Centers g)-->|G| 

P = 2 * M;
Q = 2 * N;

sig = 15;
H   = lpfilter('gaussian', P, Q, 2*sig);

% Loop for filtered image
F   = fft2(double(f), P, Q);
for u = 1 : P
    for v = 1 : Q
        G(u,v) = double(H(u,v))*double(F(u,v));
    end
end
g   = real(ifft2(G));
imtool(g, [ ]);

% Loop for centered filtered image
for x = 1 : P
    for y = 1 : Q
        g(x,y) = double( g(x,y) * (-1)^(x+y) );
    end
end
G = fft2(g);
imtool(log( 1 + abs(G) ), [ ]);


%%%%%%%%%%%%%%%% Question 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=imread('lake.gif');
[M, N] = size(f);

%-----Q2-a------------------------------------------------------------
% Part 1:  Get notch filter H 

H = notch(M,N);

%-----Q2-b------------------------------------------------------------
% Part 2: 
% 1.  Get f,|F|
% 2.  Create c, fft c --> C
% 3.  Get c,|C|
% 4.  Centers h-->|H|
% 5.  Filter C with H --> G, ifft G --> g 
% 6.  Get g,|G|
% 7.  Get f-g,|F|-|G|

imtool(f, []);
imtool(log( 1 + abs(fft2(f)) ), []);

% Create the corrupted image c(x,y)
for x = 1 : M
    for y = 1 : N
        c(x,y) = f(x,y) + (32 * cos( (2*pi*32*y)/N ) );
    end
end 
imtool(c,[0, 255]);
C = fft2(c);
imtool(log( 1 + abs(C) ), []);

% Center h
h = double(ifft2(H));
for x = 1 : M
    for y = 1 : N
        h(x,y) = h(x,y) * (-1)^(x+y);
    end
end
H_center = fft2(h);
imtool( log( 1 + abs(H_center) ), []);

% Loop for filtered image
for u = 1 : M
    for v = 1 : N
        G(u,v) = H(u,v)*C(u,v);
    end
end
imtool( log( 1 + abs(G) ), []);
g = real(ifft2(G));
imtool(g,[ ]);

% f(x,y) - g(x,y) and |F(u,v)|-|G(u,v)|.
difference = double(f) - g;
imtool(difference, []);
D = fft2(difference);
imtool( abs(D), []);


%%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
