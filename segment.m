function [outputI1,outputI2]=segment(inputI)
%% This function uses Texture Segmentation using Gabor Filters to segment the fruit from its background
%Converts the RGB to Gray image
Agray = rgb2gray(inputI);
imageSize = size(inputI);
numRows = imageSize(1);
numCols = imageSize(2);

%Creating several Gabor Filters
wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(numRows,numCols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;

deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);

g = gabor(wavelength,orientation);

%Applying Gobor Filters on the Image
gabormag = imgaborfilt(Agray,g);


for i = 1:length(g)
    sigma = 0.5*g(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma);
end
%Extracting features from filtered images
X = 1:numCols;
Y = 1:numRows;
[X,Y] = meshgrid(X,Y);
featureSet = cat(3,gabormag,X);
featureSet = cat(3,featureSet,Y);

%Clustering the image using feauters extracted from the filtered images and
%put areas with the same features to the same cluster
X = reshape(featureSet,numRows*numCols,[]);

X = bsxfun(@minus, X, mean(X));
X = bsxfun(@rdivide,X,std(X));

L = kmeans(X,2,'Replicates',5);
%Reshape the clustered image and return it. outputI2 is the inverse of the outputI1
L = reshape(L,[numRows numCols]);

outputI1 = zeros(size(inputI),'like',inputI);
outputI2 = zeros(size(inputI),'like',inputI);
BW = L == 2;
BW = repmat(BW,[1 1 3]);
if BW(1,1)==1
    outputI2(BW) = inputI(BW);
outputI1(~BW) = inputI(~BW);
else
    outputI1(BW) = inputI(BW);
    outputI2(~BW) = inputI(~BW);
end

end