load X_train.mat
load y_train.mat
load X_test.mat
load y_test.mat

%------------KNN-Classfier------------------------------------------
Mdl = fitcknn(X_train,y_train,'NumNeighbors',7);
label_2 = predict(Mdl,X_test);

%disp(label);

count =0;
%disp(length(label_2(:,1)));
for i=1:1:length(label_2(:,1))
    if y_test(i)==label_2(i)
       count = count+1;
    end
end

%disp(count)

per = count/length(label_2(:,1))*100;
Y = sprintf('Percentage Accuracy for K-nearest neighbour is : %d .',per);
disp(Y)

%--------------SVM----------------------
t = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder',2);
Mdl = fitcecoc(X_train,y_train,'Learners',t);
label=predict(Mdl,X_test);
%y_test1=transpose(y_test);
count=0;
for i=1:1:3251
    if y_test(i)==label(i)
        count=count+1;
    end
end
%disp(count)
per = (count/3251)*100;
Y = sprintf('Percentage accuracy for SVM is %d .',per);
disp(Y)
%-----------Feed forward neural network--------------
x = X_train';
t = y_train';
x1 = X_test';
t1 = y_test';

train_y = full(ind2vec(t));
net = feedforwardnet(25);
init(net);
net = train(net,x,train_y);
yt = net(x1);
yt_2 = vec2ind(yt);
per = sum(yt_2==t1)/numel(t1);
yt_1=yt_2';
Y = sprintf('Percentage accuracy for ANN is %d .',per*100);
disp(Y);

%---------------Ensemble taking majority Vote---------
A= [label,label_2,yt_1];
%disp(A);
M=mode(A,2);
count=0;
for i=1:1:3251
    if y_test(i)==M(i);
        count=count+1;
    end
end
%disp(count);
per = (count/3251)*100;
Y = sprintf('Percentage accuracy for ensemble for majority vote is %d .',per);
disp(Y)
    




