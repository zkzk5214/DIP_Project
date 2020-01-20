function H = notch(M, N)
%NOTCH is an array of one?s, with positions (1,33) and (1,481) set to zero.
%  Use for filter the nosie of coefficient  32 * cos( (2*pi*32*y)/N 

h = ones([M,N], 'double');
h(1, 33) = 0;
h(1, 481) = 0;
H = h;

end