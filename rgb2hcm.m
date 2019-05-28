function J=rgb2hcm(RGB)
if(size(RGB,3)==1)
    I=RGB;
else
    RGB64=imresize(RGB,[64 64]);
    k=fminsearch('StdMonochrome',[1 1],[ ],RGB64);
  
    I=k(1)*RGB(:,:,1)+k(2)*RGB(:,:,3);
end
J=I-min(I(:));
J=J/max(J(:));
n=fix(size(J,1)/4);
if (mean2(J(1:n,1:n))>0.3)
    J=1-J;
end
end