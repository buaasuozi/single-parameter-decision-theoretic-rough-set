% ��Ƶ��ɢ������ Equal frequency disretization method
% �ܶ����׸��Ĳο����׶����ԣ�û�ҵ���ԭʼ�ĵ�Ƶ��ɢ���������㷨
% ���ǲο��ܶ����º�rosetta��Ƶ��ɢ�Ľ��������֪����Ƶ��ɢ�Ļ���˼��
% �ھ���ϵͳ�У����ݾ������ԵĻ��ָ�����������ֵ�Σ�Ȼ�����ÿ��������������ֵ�÷�Χ
% ����ֵ����Ϊ��Ӧ���������ǣ���Ҫ��֤ÿ������������������ȡ�
% suozi  20160523 HIT

function datadiscret = EF(data,label)
% input:    data ���߱��е�����
%           label ��������
% output:   datadiscret ��ɢ�������������

[m,n] = size(data);
class = length(unique(label));
intervaldata = floor(m/class); % ÿ��Ƶ�ʶ����������ݣ����һ�μ�Ϊʣ����������

datadiscret = zeros(size(data));
for i = 1:n
    [~,order] = sort(data(:,i));
    for j = 1:class-1
        datadiscret(order((j-1)*intervaldata+1 : j*intervaldata+1),i) = j;
    end
    datadiscret(order((j)*intervaldata+1 : end),i) = j+1;
end

end