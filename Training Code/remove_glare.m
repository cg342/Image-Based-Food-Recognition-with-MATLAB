function g=remove_glare(img)
g=img;
imgray=rgb2gray(img);
indx=imgray>220;
red=g(:,:,1);
green=g(:,:,2);
blue=g(:,:,3);
red(indx)=0;
green(indx)=0;
blue(indx)=0;
g(:,:,1)=red;
g(:,:,2)=green;
g(:,:,3)=blue;
end