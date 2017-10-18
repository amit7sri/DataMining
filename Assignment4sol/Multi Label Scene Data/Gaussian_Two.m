load X_train.mat
load y_train.mat
load X_test.mat
load y_test.mat


output = zeros(907,6);
for i = 1:6
    Mdl = fitcsvm(X_train,y_train(:,i),'KernelFunction','gaussian','KernelScale','auto');
    label=predict(Mdl,X_test);
    output(:,i)=label;
end

intersection = bsxfun(@and, output, y_test);
union = bsxfun(@or, output, y_test);
    
sum1 = sum(intersection,2);
sum2 = sum(union,2);
accuracy = bsxfun(@rdivide, sum1, sum2);

per = mean(accuracy)*100;

Y = sprintf('Percentage is %d with Gaussian kernel.',per);
disp(Y);