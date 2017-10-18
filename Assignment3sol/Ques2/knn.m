load X_train.mat
load y_train.mat
load X_test.mat
load y_test.mat


Mdl = fitcknn(X_train,y_train,'NumNeighbors',7);
label = predict(Mdl,X_test);

%disp(label);

ylen=length(y_test(:,1));
%lablen=length(label(:,1));

count =0;
disp(length(label(:,1)));
for i=1:1:length(label(:,1))
    
    if y_test(i)==label(i)
       count = count+1;
    end
end

per = count/length(label(:,1))*100;
Y = sprintf('Percentage is %d .',per);
disp(Y)

