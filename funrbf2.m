function [out1,out2,out3] =fun()
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

%��ѵ�����Ͳ��Լ��ϵı���
y_train_predict=sim(net,x_train);

%������ ѵ�����Ͳ��Լ�
err=y_train_predict- y_train;
train_error=(err.*err)/length(y_train);

out1=y_train_predict;
out2=train_error;
out3=y_train;
end