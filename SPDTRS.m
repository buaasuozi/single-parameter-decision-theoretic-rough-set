%% ����˵����
% ���������ߴֲڼ�  Single-Parameter Decision-Theoretic Rough Set Model (SPDTRS)
% The information of this paper is:
% M. Suo, L. Tao, B. Zhu, X. Miao, Z. Liang, Y. Ding, X. Zhang, T. Zhang, Single-parameter decision-theoretic rough set, Information Sciences (2020), 
% doi: https://doi.org/10.1016/j.ins.2020.05.124
% �����ش���ԭ���ߵ�֪ʶ��Ȩ����Ӧ�ô˴����ʱ������Ҫ�����ã�������Ϣ���ϣ�����������ھ�ţ���������Ϣ�����������ھ�ŵ���ʽ��
% �Ͻ��˴��������κ���ҵ��;�������Ȩ�ؾ���
% Main idea:
% A methodology to determine the parameters for Decision-Theoretic Rough Set (DTRS) and Three-Way Decisions (3WD) is proposed to improve their practicability.
% First, a data-driven loss function matrix is introduced based on the significance and the probability of the sample.
% Subsequently, a generalized rough set model named single-parameter decision-theoretic rough set (SPDTRS) is put forward 
% based on the proposed loss function matrix. The main feature of the proposed model is that there is only one parameter 
% that should be preset rather than the two or six parameters in the traditional DTRS models.
% Editor: suozi
% QQ/Wechat��379786867
% Email: buaasuozi@126.com
% BUAA-PHM  2019.05.29 - 2020.06.05

%% ģ�ͺ��Ĵ���
function red = SPDTRS(data,label,zeta,category,Xcell)
% input:   data    the data set mxn
%          label   the decision attribute  mx1
%          zeta    the compesation coefficient   0< <=1
%          category    the array denotes that which is the category attribute 1Ϊ��ɢ������������ݣ�0Ϊ������ֵ������
%          Xcell      the decision class set
% output:  red    the reduction

n = size(data,2);

% discrete
dataDisc = EF(data,label);
index = find(category == 1);
dataDisc(:,index) = data(:,index); % ��������ɢ���ķ��������ݣ�����������ɢ��
data = dataDisc;

red = [];
C = 1:1:n;
Cl = C; % condition attribute left
risk_red = 100000; % ��ʼ����һ���ϴ������
while numel(Cl) ~= 0
    num = numel(Cl);
    risk_red_c = zeros(1,num); % ����c��ķ���
    sig_risk = zeros(1,num);
    for i = 1:num
        red_c = [red,Cl(i)];
        risk_red_c(i) = risk_fun_SPDTRS(data(:,red_c),label,zeta,Xcell);
        sig_risk(i) = (risk_red - risk_red_c(i)); % /risk
    end
    [~,maxid] = max(sig_risk);
    if risk_red_c(maxid) < risk_red
        red = [red, Cl(maxid)];
        Cl(maxid) = [];
        risk_red = risk_red_c(maxid);
    else
        break
    end
end

if numel(red) ~= 0
    red_a_id = []; % record the id of some reduct attribute in the reduction attribute set.
    for i = 1:numel(red)
        red_a_id_i = [red_a_id, i];
        red_a = red;
        red_a(red_a_id_i) = [];
        if numel(red_a) ~= 0
            risk_red_a = risk_fun_SPDTRS(data(:,red_a),label,zeta,Xcell);
            if risk_red_a <= risk_red
                red_a_id = [red_a_id, i];
                risk_red = risk_red_a;
            end
        end
    end
    red(red_a_id) = [];
else
    disp('In the current situation, we can not find the appropriate reduction set. Hence, we put the raw data set out that can be considered as the reduction.')
    red = 1:1:n;
end




