## Prediction and Analysis of Pathogenic Sites of Genetic Diseases Based on SVM
This is a project that describes the Prediction and Analysis of Pathogenic Sites of Genetic Diseases Based on SVM

The information of the author:
- Name: Caixinqi (MichealCarol)
- Field: Computer Application Technology

## 基于SVM的遗传疾病的致病位点预测分析
### 问题描述

近年来，随着计算机应用技术的发展以及大数据时代的到来，人们对人体基因与遗传性疾病的研究越来越深入了。研究人员大都采用全基因组的方法来确定致病位点或致病基因，具体做法是：招募大量志愿者（样本），包括具有某种遗传病的人和健康的人，通常用1表示病人，0表示健康者。对每个样本，采用碱基(A,T,C,G)的编码方式来获取每个位点（在组成DNA的数量浩瀚的碱基对中，有一些特定位置的单个核苷酸经常发生变异引起DNA的多态性，我们称之为位点，染色体、基因和位点的结构关系见图1.）的信息(因为染色体具有双螺旋结构，所以用两个碱基的组合表示一个位点的信息）；如表1中，在位点rs100015位置，不同样本的编码都是T和C的组合，有三种不同编码方式TT,TC和CC。研究人员可以通过对样本的健康状况和位点编码的对比分析来确定致病位点，从而发现遗传病或性状的遗传致病机理。

![](https://github.com/MichealCarol/bitdm.github.io/blob/master/2017/projects/P05/images/%E5%9B%BE1%20%E6%9F%93%E8%89%B2%E4%BD%93%E3%80%81%E5%9F%BA%E5%9B%A0%E5%92%8C%E4%BD%8D%E7%82%B9%E7%9A%84%E7%BB%93%E6%9E%84%E5%85%B3%E7%B3%BB.png)

图1 染色体、基因和位点的结构关系

`我们要研究的主要问题是：`分析1000个样本在某条有可能致病的染色体片段上的9445个位点的编码信息和样本患有遗传疾病A的信息。对致病位点进行检测，预测某种疾病的致病位点，其实就是判断不同位点对该疾病的影响程度，即判别每个位点的属性关于致病与非致病类别的分类精度。
