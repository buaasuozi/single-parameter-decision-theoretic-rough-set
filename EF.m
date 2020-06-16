% 等频离散化方法 Equal frequency disretization method
% 很多文献给的参考文献都不对，没找到最原始的等频离散化方法的算法
% 但是参考很多文章和rosetta等频离散的结果，可以知道等频离散的基本思想
% 在决策系统中，根据决策属性的划分个数，划分数值段，然后根据每个条件属性自身值得范围
% 将数值划分为对应段数，但是，需要保证每个区间内样本个数相等。
% suozi  20160523 HIT

function datadiscret = EF(data,label)
% input:    data 决策表中的数据
%           label 决策属性
% output:   datadiscret 离散化后的条件属性

[m,n] = size(data);
class = length(unique(label));
intervaldata = floor(m/class); % 每个频率段内样本数据，最后一段即为剩余所有属性

datadiscret = zeros(size(data));
for i = 1:n
    [~,order] = sort(data(:,i));
    for j = 1:class-1
        datadiscret(order((j-1)*intervaldata+1 : j*intervaldata+1),i) = j;
    end
    datadiscret(order((j)*intervaldata+1 : end),i) = j+1;
end

end