function z = mergesort(a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if length(a)==1, z=a; 
else b=mergesort(a(1:floor(length(a)/2)));
  c=mergesort(a((floor(length(a)/2)+1):length(a)));
z=merge(b,c); end;
end

