% label ��������
% suozi 2019.05.30

% preprocess:  % Ϊ��������biodeg������ ��ǩΪ 2 1 ...  -1  1 ���������ϸ�����
function [dataout,labelout] = resortLabel_fun(data,label)
% input:     data   raw data
%            label  raw label
% output:    dataout  the output data
%            labelout  the output label

n = size(data,2);
class = unique(label);
numclass = numel(class);
comdata = [data,label];
comdata = sortrows(comdata,n+1);
dataout = comdata(:,1:n);
label = comdata(:,end);% �����ǩ���Ա�֤��ǩ��Ϊ��ֵ ���ϸ�����
labelout = label;
for i = 1:numclass
    index = find(label == class(i));
    labelout(index) = i;
end
