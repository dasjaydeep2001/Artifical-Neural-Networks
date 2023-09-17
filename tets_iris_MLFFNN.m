close all; clear all; clc; format compact
 id = iris_dataset;
%  Define Target for each class
 a= 100; b=200; c=300;d=400;
    a = [1 0 0 ]';
    c = [0 1 0]';
    b = [0 0 1]';

 a = [1 -1 -1 -1]';
 c = [-1 1 -1 -1]';
b = [-1 -1 1 -1]';
 d = [-1 -1 -1 1]';

% define inputs
P = id;% tDefine Input Datase

% define targetstDefine Input Datase

T = [repmat(a,1,50),repmat(b,1,50),repmat(c,1,50)]  % Assign respective target values to dataset

% create a neural network

% Test for different hidden layer units and hidden layers 

net = feedforwardnet([4,3]);

% % train net
net.divideParam.trainRatio = 1; % training set [%] 
net.divideParam.valRatio = 0; % validation set [%] 
net.divideParam.testRatio = 0; % test set [%]

% train a neural network
[net,tr,Y,E] = train(net,P,T);

view(net)

% generate a grid
span = -1:.001:2;
[P1,P2] = meshgrid(span,span); 
pp = [P1(:) P2(:)]';
% simulate neural network on a grid
%aa = net(pp);
% translate output into [-1,1] 
%aa = -1 + 2*(aa>0);
plot classification regions
mesh(P1,P2,reshape(aa,length(span),length(span))-5); 
 plot classification regions
 figure(1)
m = mesh(P1,P2,reshape(aa(1,:),length(span),length(span))-5);

set(m,'facecolor',[1 0.2 .7],'linestyle','none');
hold on
m = mesh(P1,P2,reshape(aa(2,:),length(span),length(span))-5);
set(m,'facecolor',[1 1.0 0.5],'linestyle','none');
m = mesh(P1,P2,reshape(aa(3,:),length(span),length(span))-5);
set(m,'facecolor',[.4 1.0 0.9],'linestyle','none');
m = mesh(P1,P2,reshape(aa(4,:),length(span),length(span))-5);
set(m,'facecolor',[.3 .4 0.5],'linestyle','none');

