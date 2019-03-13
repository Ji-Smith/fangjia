clear,clc;
x0 = [9861 12498.14 13295.27 21118.08 25459.42 26612.5 35857.25 37416.33 36735.58 47312]'
n = length(x0)                                             %x0为前十年房价
x1 = cumsum(x0)                                            %对数列x0累加求和
B = [-0.5*(x1(1:n-1)+x1(2:n)),ones(n-1,1)]
Y = x0(2:n)
u = B\Y
x = dsolve('Dx + a*x=b','x(0) = x0')
x = subs(x,{'a','b','x0'},{u(1),u(2),x0(1)})              %得出预测模型函数
yucel = subs(x,'t',[0:n+3])                               %进行预测
yucel = double(yucel)
ycue = [x0(1),diff(yucel)]                                %ycue为模型对2007-2016房价的预测
epsilon = x0'-ycue(1:n)                                   %计算残差
delta = abs(epsilon./(x0(1:n))')                          %计算相对误差
t = abs(epsilon)                                          %t为绝对残差
connection = (min(t)+0.5*max(t))./(t+0.5*max(t))          %connection为相关系数
mean(connection)                                          %求灰色关联度
price_2017 = ycue(n+1)                                    %对未来三年进行预测
price_2018 = ycue(n+2)
price_2019 = ycue(n+3)

