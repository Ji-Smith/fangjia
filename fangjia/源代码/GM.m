clear,clc;
x0 = [9861 12498.14 13295.27 21118.08 25459.42 26612.5 35857.25 37416.33 36735.58 47312]'
n = length(x0)                                             %x0Ϊǰʮ�귿��
x1 = cumsum(x0)                                            %������x0�ۼ����
B = [-0.5*(x1(1:n-1)+x1(2:n)),ones(n-1,1)]
Y = x0(2:n)
u = B\Y
x = dsolve('Dx + a*x=b','x(0) = x0')
x = subs(x,{'a','b','x0'},{u(1),u(2),x0(1)})              %�ó�Ԥ��ģ�ͺ���
yucel = subs(x,'t',[0:n+3])                               %����Ԥ��
yucel = double(yucel)
ycue = [x0(1),diff(yucel)]                                %ycueΪģ�Ͷ�2007-2016���۵�Ԥ��
epsilon = x0'-ycue(1:n)                                   %����в�
delta = abs(epsilon./(x0(1:n))')                          %����������
t = abs(epsilon)                                          %tΪ���Բв�
connection = (min(t)+0.5*max(t))./(t+0.5*max(t))          %connectionΪ���ϵ��
mean(connection)                                          %���ɫ������
price_2017 = ycue(n+1)                                    %��δ���������Ԥ��
price_2018 = ycue(n+2)
price_2019 = ycue(n+3)

