function outputI1=train_preprocess(inputI,p)
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
segmentedI=segment2single(resizedI,p);

[rr cr hr]=size(segmentedI);
rpre=floor((standardsize-rr)/2);
rpost=ceil((standardsize-rr)/2);
cpre=floor((standardsize-cr)/2);
cpost=ceil((standardsize-cr)/2);
paddedI=padarray(segmentedI,[rpre cpre],0,'pre');
paddedI=padarray(paddedI,[rpost cpost],0,'post');
outputI1=paddedI;

end