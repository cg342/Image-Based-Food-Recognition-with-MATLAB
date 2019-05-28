function [indx,category]=classify(img,model)
[labelIdx, scores] = predict(model, img);
category=model.Labels(labelIdx);
indx=labelIdx;
end