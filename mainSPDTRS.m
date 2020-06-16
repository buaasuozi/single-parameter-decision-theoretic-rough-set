%% Code Description：
% 单参数决策粗糙集  Single-Parameter Decision-Theoretic Rough Set Model (SPDTRS)
% The information of this paper is:
% M. Suo, L. Tao, B. Zhu, X. Miao, Z. Liang, Y. Ding, X. Zhang, T. Zhang, Single-parameter decision-theoretic rough set, Information Sciences (2020), 
% doi: https://doi.org/10.1016/j.ins.2020.05.124
% 请尊重代码原创者的知识产权，在应用此代码的时候做必要的引用（引用信息如上，如果分配了期卷号，则引用信息调整至包含期卷号的形式）
% 严禁此代码用于任何商业用途！否则版权必究！
% Main idea:
% A methodology to determine the parameters for Decision-Theoretic Rough Set (DTRS) and Three-Way Decisions (3WD) is proposed to improve their practicability.
% First, a data-driven loss function matrix is introduced based on the significance and the probability of the sample.
% Subsequently, a generalized rough set model named single-parameter decision-theoretic rough set (SPDTRS) is put forward 
% based on the proposed loss function matrix. The main feature of the proposed model is that there is only one parameter 
% that should be preset rather than the two or six parameters in the traditional DTRS models.
% Editor: suozi
% QQ/Wechat：379786867
% Email: buaasuozi@126.com
% BUAA-PHM  2019.05.29 - 2020.06.05

%% main access
clearvars
dataname = 'ecoli'; %  'ecoli' / 'wine'
zeta = 0.2; % the preset parameter
str = strcat('load ',32,dataname);
eval(str)
% label resort   preprocessing ...
[data,label] = resortLabel_fun(data,label);
class = unique(label); % update
numclass = numel(class);
Xcell = cell(numclass,1); % decision class
for i = 1:numclass
    Xcell{i} = find(label == class(i)); 
end

% Reduct ... 
disp('Begin reducting ...')
tic
red = SPDTRS(data,label,zeta,category,Xcell);
toc
str = strcat('The attribute IDs in reduction set are:',32,num2str(red));
disp(str)



