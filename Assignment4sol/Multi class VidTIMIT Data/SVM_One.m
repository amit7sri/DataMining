load X_train.mat
load y_train.mat
load X_test.mat
load y_test.mat

t = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder',2);
Mdl = fitcecoc(X_train,y_train,'Learners',t);
label=predict(Mdl,X_test);
y_test1=transpose(y_test);
count=0;
for i=1:1:1000
    if y_test1(i)==label(i)
        count=count+1;
    end
end
disp(count)
per = (count/1000)*100;
Y = sprintf('Percentage is %d .',per);
disp(Y)