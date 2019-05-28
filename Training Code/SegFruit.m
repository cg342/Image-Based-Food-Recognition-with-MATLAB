function [R,E,J]=SegFruit(I,p)
J=rgb2hcm(double(I)/256);
t=graythresh(J);
%if (exist('p'))
%    p=-0.05;
%end
[R,E]=MorphoFood(J,t+p);
end