load X_train.txt
load y_train.txt
load X_test.txt
load y_test.txt

y1_test=transpose(y_test);
y1_train=transpose(y_train);

Mdl = fitcknn(X_train,y1_train,'NumNeighbors',7);
label = predict(Mdl,X_test);

%disp(label);

count =0;
disp(length(label(:,1)));
for i=1:1:length(label(:,1))
    if y1_test(i)==label(i)
       count = count+1;
    end
end

disp(count)

per = count/length(label(:,1))*100;
Y = sprintf('Percentage is %d .',per);
disp(Y)



