function  z  = fakultaet(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if (n==1) z=1;
else z=n*fakultaet(n-1);

end

