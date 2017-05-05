%********** 基于SVM的具有遗传性疾病和性状的遗传位点分析 **********%
%**********   Date：2017.04.10  Group:DataMing No.5  **********%
%**********              Run Time:13 min             **********%
close all;
clear;
clc;
%% 加载十进制编码9445个位点的所有属性
all_feature=textread('nowenary_encoding_feature.dat');
%train_attr=all_feature;
Pdata=zeros(500,1);
Ndata=ones(500,1);
%% 数据属性归一化处理
[dataset_scale,ps] = mapminmax(all_feature',0,1);
data_attr = dataset_scale';%归一化处理后的数据属性矩阵
W=size(data_attr,2);%属性（位点）总数
%train_label = vertcat( zeros(Pnum,1),ones(Nnum,1) );%纵向连接，即phenotype.txt
%% 循环每个位点，利用每列属性进行该疾病的预测，得到预测精度accuracy
accuracy=[];
for w=1:W
    Acc = predictFunc_svm( Pdata, Ndata,data_attr(:,w));
    accuracy=[accuracy,mean(Acc)];%5折交叉得到每列属性的预测精度
end
dlmwrite('predict_accuracy.txt',accuracy,'delimiter',' ');
%% 对预测结果降序排列，即预测精度 accuracy 从高到低排列
%accuracy_desc:降序排列的预测结果；org_indices:排序后预测精度对应的位点属性编号
[accuracy_desc,org_indices]=sort(accuracy,'descend');
accuracy_result=[accuracy_desc;org_indices];
dlmwrite('predict_accuracy_desc.txt',accuracy_result,'delimiter',' ');
%predict_accuracy_desc.txt中第一行为降序排列的预测结果，第二行为排序后预测精度对应的位点属性编号
%% 选出Top n 预测精度及对应预测精度所在的位点
n=10;
topn_accuracy=accuracy_desc(:,1:n);
topn_accuracy=topn_accuracy';
disp(topn_accuracy) ;
%输出前10个预测精度
feature_name=textread('feature_name.txt','%s','delimiter','\n');
for m=1:n
    topn_feature(m)=feature_name(org_indices(:,m),1);
end
disp(topn_feature) ;
%输出前10个预测位点


