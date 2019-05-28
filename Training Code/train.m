clc;clear
rootFolder='train code/Fruit DB Preprocessed';
dirs={'Banana','Golden Apple','Royal Apple','Grape','Mango','Citrus','Pear','Pomegranate'};

imgSets = [ imageSet(fullfile(rootFolder, dirs{1})), ...
     imageSet(fullfile(rootFolder, dirs{2})), ...
             imageSet(fullfile(rootFolder, dirs{3})), ...
              imageSet(fullfile(rootFolder, dirs{4})), ...
               imageSet(fullfile(rootFolder, dirs{5})), ...
               imageSet(fullfile(rootFolder, dirs{6})), ...
                 imageSet(fullfile(rootFolder, dirs{7})), ...
            imageSet(fullfile(rootFolder, dirs{8})) ];
        
       


bag = bagOfFeatures(imgSets);

opts = templateSVM('BoxConstraint', 1.1, 'KernelFunction', 'gaussian');
categoryClassifier = trainImageCategoryClassifier(imgSets, bag,'LearnerOptions', opts);

save('classifier_gaussian.mat','-mat','categoryClassifier'); 

% img = imread(fullfile(rootFolder, 'Golden Apple', 'Golden_09_2.jpg'));
% [labelIdx, scores] = predict(categoryClassifier, img);
% 
% 
% categoryClassifier.Labels(labelIdx)

