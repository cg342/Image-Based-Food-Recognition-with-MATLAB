origI=imread('Fruit Images/10.jpg');
%%

red=origI(:,:,1);
green=origI(:,:,2);
blue=origI(:,:,3);
indx=red>240;
red(indx)=mean2(red);
indx=green>230;
green(indx)=mean2(green);
indx=blue>230;
blue(indx)=mean2(blue);
origI(:,:,1)=red;
origI(:,:,2)=green;
origI(:,:,3)=blue;
imshow(origI);
%%

[R,E,J]=SegFruit(origI,0.1);
imshow(R);
%%
[Rlabeled,num]=bwlabel(R);

for i=1:num
    I=origI;
red=I(:,:,1);
green=I(:,:,2);
blue=I(:,:,3);
indx=Rlabeled~=i;
red(indx)=0;
green(indx)=0;
blue(indx)=0;
I(:,:,1)=red;
I(:,:,2)=green;
I(:,:,3)=blue;
figure;
imshow(I);
end
