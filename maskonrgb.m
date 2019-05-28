function img=maskonrgb(I,mask)
img=I;
indx=mask~=1;
red=img(:,:,1);
green=img(:,:,2);
blue=img(:,:,3);
red(indx)=0;
green(indx)=0;
blue(indx)=0;
img(:,:,1)=red;
img(:,:,2)=green;
img(:,:,3)=blue;
end