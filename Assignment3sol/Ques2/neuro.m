load X_train.mat
load y_train.mat
load X_test.mat
load y_test.mat

x = X_train';
t = y_train';
x1 = X_test';
t1 = y_test';

hiddenLayerSize = 25;

net = feedforwardnet(hiddenLayerSize);

train_y = full(ind2vec(y_train,hiddenLayerSize));

net = train(net,x,train_y);
yt = net(x1);
yt = vec2ind(yt);
per = sum(yt==y_test)/numel(y_test);

Y = sprintf('Percentage is %d .',per*100);
disp(Y);