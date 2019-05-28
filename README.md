## Image-Based Food Recognition By MATLAB



* database images in the folder `/Training Code/Fruit DB Preprocessed`
* Please run `user_interface.m` to start our application

__Files description:__
`user_interface.m`  generates the user interface
`ManualSegmentation.m`preprocesses our dataset before we train our classifier over this dataset
`preprocess.m`  function for preprocessing (resizing, padding) of the image
`segment2single.m` function for segmenting the image
`train.m`   trains the classifier and saves it to file
`classifier_gaussian.mat`  the trained classifier 
`classify.m`  function to classify a new image
`lookfruit.m` function that gets the label of the class and returns its calorie
`caloriematrix.dat` saved matrix that serves as our calorie database