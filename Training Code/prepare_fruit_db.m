rootFolder='Fruit DB';
outputFolder=strcat('Fruit DB Preprocessed');
% dirBanana='Banana';%118
% dirGoldenApple='Golden Apple';%100
% dirRoyalApple='Royal Apple';%96
% dirGrape='Grape';%56
% dirMango='Mango';%101
% dirOrange='Orange';%210
% dirPear='Pear';%79
% dirPomegranate='Pomegranate';%100
dirs={'Banana','Golden Apple','Royal Apple','Grape','Mango','Citrus','Pear','Pomegranate'};

%  imgSets = [ ...
%      %imageSet(fullfile(rootFolder, dirs{1})), ...
%       imageSet(fullfile(rootFolder, dirs{2})), ...
%               imageSet(fullfile(rootFolder, dirs{3})), ...
% %                imageSet(fullfile(rootFolder, dirs{4})), ...
%                 imageSet(fullfile(rootFolder, dirs{5})), ...
%                 imageSet(fullfile(rootFolder, dirs{6})), ...
% %                imageSet(fullfile(rootFolder, dirs{7})), ...
%              imageSet(fullfile(rootFolder, dirs{8})) ];
         
%           imgSets = [imageSet(fullfile(rootFolder, dirs{2})), ...
%               imageSet(fullfile(rootFolder, dirs{3})), ...
%                 imageSet(fullfile(rootFolder, dirs{5})), ...
%                 imageSet(fullfile(rootFolder, dirs{6})), ...
%              imageSet(fullfile(rootFolder, dirs{8})) ];
imgSets = imageSet(fullfile(rootFolder, dirs{7}));

[r c]=size(imgSets);
        
 for i=1:c
     imgSet=imgSets(i);
     cnt=imgSet.Count;
     i
     for j=1:cnt
         Img=read(imgSet,j);
         Img=remove_glare(Img);
         PrcsdImg1=train_preprocess(Img,0.1);
         str1=strcat(outputFolder,'/','Pear','/',num2str(j),'.jpg');
         %str2=strcat(outputFolder,dirs{i},'/',num2str(j),'R.jpg');
         disp(strcat(str1,' is processed_',num2str(cnt)));
         imwrite(PrcsdImg1,str1,'jpg');
         % imwrite(PrcsdImg2,str2,'jpg');
     end
 end




