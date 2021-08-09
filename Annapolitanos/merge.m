function z = merge(a,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=[a, max(b)+1]; b=[b, max(a)+1];
i=1; j=1;
if a(1)<b(1), z=a(1); i=i+1; else z=b(1); j=j+1; end;
while (i+j<length(a)+length(b))
if a(i)<b(j), z=[z a(i)]; i=i+1; else z=[z b(j)]; j=j+1;end;

end

