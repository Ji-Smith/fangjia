%�˳���������֤������������ƫԶ�����Ͷ�����ʧ
%�ȵ���plunder_analyse.mat�ļ�
load('plunder_analyse.mat') %���ز���ҵ������estatement_engagement,��Ʒ���۸�:house_price,����ҵ����:rural_population,���ز�����Ͷ�ʣ�invest
s1 = corrcoef(rural_population, house_price)          %������ҵ�˿��뷿�۵������
s2 = corrcoef(estate_employment, house_price)         %
s3 = corrcoef(rural_population, estate_employment)

%��������
%���Ϲ���ۣ�price_develop,ƫԶ��������:price_remote
%���Ϲ���ز�Ͷ���ʽ�:tz_develop,ƫԶ�������ز�Ͷ���ʽ�tz_remote
%���Ϲ���ز�Ͷ�������ʣ�v22,ƫԶ�������ز�Ͷ��������:v33
load('Ͷ������.mat')
x = [10:-1:1]
plot(x,price_develop,'- ',x,price_remote,'--') %��������ͼ
plot(x,tz_develop,'- ',x,tz_remote,'--')       %����Ͷ�ʶ�����ͼ
x = [9:-1:1]
plot(x,v22,'- ',x,v33,'--')                    %�������ز�Ͷ��������ͼ
corr(price_develop',tz_develop')                 %���Ϲ���ķ��ۺͷ��ز�Ͷ�ʵ������
corr(price_remote',tz_remote')                   %��ƫԶ���������뷿�ز�Ͷ�ʵ������

