function [out1,out2,out3] =fun(x)

%��һ���ͷ���һ��׼��
test=csvread('data.csv',1,1);
test1=test(:,1:5)';
test2=test(:,6:8)';
[B1,PS1]=mapminmax(test1,0,1);
[B2,PS2]=mapminmax(test2,0,1);
A=mapminmax('reverse',B1,PS1);%����һ��׼��
A2=mapminmax('reverse',B2,PS2);%����һ��׼��
x=mapminmax('apply',x,PS1);%�������һ��


%����ѵ���������뼯
data=csvread('data.csv',1,1);
%��һ��
data1=data';
data=mapminmax(data1,0,1);
data=data';
%����ѵ�������Լ�
x_train=data(:,1:5).';
y_train=data(:,6:end).';
%������ѵ������
net=newrb(x_train,y_train,0.005,1,25,5);

%�ڲ��Լ��ϵı���
predict=sim(net,x);
predict=mapminmax('reverse',predict,PS2);%���������һ��

out1=predict(1);
out2=predict(2);
out3=predict(3);
end