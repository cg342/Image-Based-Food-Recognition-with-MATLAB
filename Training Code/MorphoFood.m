function [R,E] = MorphoFood(J,t)
A=bwareaopen(J>t,fix(length(J(:))/100));
C=imclose(A,strel('disk',7));
R=bwfill(C,'holes',8);
E=bwperim(R,4);
end