% label 重新排序
% suozi 2019.05.30

% preprocess:  % 为避免诸如biodeg的问题 标签为 2 1 ...  -1  1 这样不会严格升序
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
label = comdata(:,end);% 整理标签，以保证标签均为正值 且严格升序
labelout = label;
for i = 1:numclass
    index = find(label == class(i));
    labelout(index) = i;
end
