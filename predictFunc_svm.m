%**********   基于5折交叉验证及SVM分类器的预测函数，用于预测精度   **********%
%**********Date：2017.04.12  Group:DataMing No.5**********%
function Acc = predictFunc_svm( Pdata, Ndata, data_atrr)
Pnum=size(Pdata,1);
Nnum=size(Ndata,1);
indicesP =crossvalind('Kfold',Pnum,5); %5折交叉验证的正指数
indicesN =crossvalind('Kfold',Nnum,5); %5折交叉验证的负指数
Acc=[];
%% 进行K折交叉验证(K=5)
for i=1:5
    Ptest = (indicesP == i);
    Ptrain = ~Ptest;
    Ntest = (indicesN == i);
    Ntrain = ~Ntest;
    Ztrain=[Ptrain;Ntrain];
    Ztest=[Ptest;Ntest];
    %% 选出数据集训练属性和测试属性
    train_attr =data_atrr(Ztrain==1,:); %训练属性
    test_attr =data_atrr(Ztrain==0,:);   %测试属性
    %% 训练集和测试集中的正样本
    Ptrain_data=Pdata(Ptrain==1);
    Ptest_data=Pdata(Ptrain==0);
    %% 训练集和测试集中的负样本
    Ntrain_data =Ndata(Ntrain==1);
    Ntest_data =Ndata(Ntrain==0);
    %% 训练集的标签
    train_label = vertcat( Ptrain_data, Ntrain_data);    
    %% 测试集的标签
    test_label = vertcat( Ptest_data, Ntest_data);
    %% 通过SVM构建的预测器，训练集训练模型
    model = svmtrain(train_label,sparse(train_attr),'-h 0');  
    %% 通过SVM构建的预测器，测试集预测精度
    [~,acc,~]=svmpredict(test_label,sparse(test_attr),model);
%predicted_label, accuracy/mse, decision_values]=svmpredict(test_label,test_matrix, model, ['libsvm_options']);
%accuracy/mse是一个3*1的列向量，其中第1个数字用于分类问题，表示分类准确率；
%后两个数字用于回归问题，第2个数字表示mse；第三个数字表示平方相关系数。
    Acc=[Acc,acc(1,1)];%取出分类预测精度结果，5折计算累积得到一个1*5的矩阵
  end
end

