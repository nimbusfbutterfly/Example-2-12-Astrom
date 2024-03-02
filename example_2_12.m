clc;clear all;
a_true=-0.8;
b_true=0.5;
max=1000;
Noise=0.5*randn(max,1);
y=zeros(max,1);
u=zeros(max,1);
%% part a
u(50:51,1)=ones(2,1);
% u(50,1)=1;
for t=2:max
    y(t)=0.8*y(t-1)+0.5*u(t-1)+Noise(t);
end
mean(Noise);
P=100*eye(2);
theta=zeros(2,1);
a(1)=theta(1);
b(1)=theta(2);


%  RLS Algorithm
for i=2:max
    phiint=[-y(i-1);u(i-1)];
    K=P*phiint*inv(eye(1)+phiint'*P*phiint);
    theta=theta+K*(y(i)-phiint'*theta);
    P=(eye(2)-K*phiint')*P;
    a(i)=theta(1);
    b(i)=theta(2);
end
figure;
t=1:max;
plot(t,a_true*ones(size(t)));
hold on;
plot(t,b_true*ones(size(t)));
hold on;
plot(a);
hold on;
plot(b);
legend('a true','b true','$$\hat{a}$$','$$\hat{b}$$','Interpreter','Latex');
title('Part a Fig2-7');
xlabel("time(second)");
ylabel("a true,b true,$$\hat{a}$$,$$\hat{b}$$",'Interpreter','Latex')
a(max)
b(max)
P;
% text(200,-0.81821,"a hat");
% text(200,0.5415,"b hat");
grid on;
hold off;

%% part b
y=zeros(max,1);
u=zeros(max,1);
u(1:50,1)=ones(50,1);
T=100;
for i=101:max
    u(i)=u(i-T);
end
for t=2:max
       y(t)=0.8*y(t-1)+0.5*u(t-1)+Noise(t);
end
P=100*eye(2);
theta=zeros(2,1);
a(1)=theta(1);
b(1)=theta(2);
%  RLS Algorithm
for i=2:max
    phiint=[-y(i-1);u(i-1)];
    K=P*phiint*inv(eye(1)+phiint'*P*phiint);
    theta=theta+K*(y(i)-phiint'*theta);
    P=(eye(2)-K*phiint')*P;
    a(i)=theta(1);
    b(i)=theta(2);
end
figure;
t=1:max;
plot(t,a_true*ones(size(t)));
hold on;
plot(t,b_true*ones(size(t)));
hold on;
plot(a);
hold on;
plot(b);
legend('a true','b true','$$\hat{a}$$','$$\hat{b}$$','Interpreter','Latex')
title('Part b Fig2-7');
xlabel("time(second)");
ylabel("a true,b true,$$\hat{a}$$,$$\hat{b}$$",'Interpreter','Latex')
a(max)
b(max)
P
grid on;
