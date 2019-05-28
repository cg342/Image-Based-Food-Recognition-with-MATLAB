function [outputI1,outputI2,num]=preprocess(inputI)
standardsize=300; %standard size for the output image. output image would be a [standardsize] by [standardsize] image.

%resizing the input image to make size of at least one of height or width standard
[r c h]=size(inputI);
if r>=c
    resizedI=imresize(inputI,[standardsize NaN]);
else
    resizedI=imresize(inputI,[NaN standardsize]);
end
%[segmentedI1,segmentedI2]=segment(resizedI); % segmenting the input image
%old version

[segmentedI,R]=segment2single(resizedI,-0.05);
[labels,num]=bwlabel(R);

img1=maskonrgb(segmentedI,labels==1);
img2=maskonrgb(segmentedI,labels==2);


% imwrite(segmentedI1,'segapple.jpg','jpg');
[rr cr hr]=size(img1);
rpre=floor((standardsize-rr)/2);
rpost=ceil((standardsize-rr)/2);
cpre=floor((standardsize-cr)/2);
cpost=ceil((standardsize-cr)/2);
paddedI=padarray(img1,[rpre cpre],0,'pre');
paddedI=padarray(paddedI,[rpost cpost],0,'post');
outputI1=paddedI;
paddedI=padarray(img2,[rpre cpre],0,'pre');
paddedI=padarray(paddedI,[rpost cpost],0,'post');
outputI2=paddedI;
end