clear all; close all; clc;

%define signal
dt=0.01 %time step [s]
t1=0:dt:3; %first time vector [s]
t2=3+dt:dt:6; %second time vector [s]
t=[t1 t2]; %complete time vector [s]
y1=[sin(4.1*pi*t1) 0.8*sin(8.3*pi*t2)];
y=awgn(y1,5,'measured');
%plot signal
% plot(t,y,'.-')
plot(t,y,'.-',t,y1,'rx-')
xlabel('Time[sec]');
ylabel('Target Signal');
grid on
ylim([-1.2 1.2])

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

p=con2seq(y);
inputDelays=0;
learning_rate=0.1;
%define ADALINE
net = linearlayer(inputDelays,learning_rate);
[net,Y,E]=adapt(net,p,p);

%transform result vectors
Y=seq2con(Y);
Y=Y{1};
E=seq2con(E);
E=E{1};

% ----------- PLOTS ----------
figure;
subplot(211)
plot(t,y,'b',t,Y,'r--');
legend('Original','Prediction')
grid on
xlabel('Time[sec]');
ylabel('Target Signal');
subplot (212)
plot(t,E,'k');
grid on
legend('Prediction Error')
xlabel('Time[sec]');
ylabel('Error');