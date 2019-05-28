function I=segment2single(img,p)
[R,E,J]=SegFruit(img,p);
I=img;
red=I(:,:,1);
green=I(:,:,2);
blue=I(:,:,3);
red(~R)=0;
green(~R)=0;
blue(~R)=0;
I(:,:,1)=red;
I(:,:,2)=green;
I(:,:,3)=blue;
end