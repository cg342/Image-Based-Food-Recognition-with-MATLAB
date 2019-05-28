Please find the database images in the folder '/Training Code/Fruit DB Preprocessed'
Please run user_interface.m to start our application

Files description:
user_interface.m -> the code to generate the user interface
ManualSegmentation.m -> our code to preprocess our dataset before we train our classifier over this dataset
preprocess.m -> function that is used for preprocessing (resizing, padding) of the image
segment2single.m -> function that is used for segmenting the image
train.m -> the code that we use to train our classifier and save it to file
classifier_gaussian -> our trained classifier that we load once our program starts
classify.m -> function that we use to classify a new image
lookfruit.m -> function that gets the label of the class and returns its calorie
caloriematrix.dat -> saved matrix that serves as our calorie database

