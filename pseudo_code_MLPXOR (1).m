close all; clear all; clc; format compact
% number of samples of each class
K = 100;
% define 4 clusters of input data 
q = 0.6; 
% offset of classes
A = [rand(1,K)-q; rand(1,K)+q]; 
B = [rand(1,K)+q; rand(1,K)+q]; 
C = [rand(1,K)+q; rand(1,K)-q]; 
D = [rand(1,K)-q; rand(1,K)-q]; 

% plot the clusters of data
plot(A(1,:),A(2,:),'k+') 
hold on
grid on 
plot(B(1,:),B(2,:),'bd') 
plot(C(1,:),C(2,:),'g*') 
plot(D(1,:),D(2,:),'ms')

%  Define Target for each class
    a = [???]';
    c = [???]';
    b = [???]';
    d = [???]';


% define inputs
P = [A B C D]% Define Input Dataset

% define targets
T = [repmat(a,1,length(A)),repmat(b,1,length(B)),repmat(c,1,length(C)),repmat(d,1,length(D))]  % Assign respective target values to dataset

% create a neural network

% Test for different hidden layer units and hidden layers 

net = feedforwardnet([???]);

% train a neural network
[net,tr,Y,E] = train(net,P,T);

view(net)

% generate a grid
span = -1:.001:2;
[P1,P2] = meshgrid(span,span); 
pp = [P1(:) P2(:)]';

% simulate neural network on a grid
aa = net(pp);
% plot classification regions
mesh(P1,P2,reshape(aa,length(span),length(span))-5); 



