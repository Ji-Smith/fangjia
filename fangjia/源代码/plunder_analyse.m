%此程序用于验证房价上升导致偏远地区劳动力流失
%先导入plunder_analyse.mat文件
load('plunder_analyse.mat') %房地产就业人数：estatement_engagement,商品房价格:house_price,乡村就业人数:rural_population,房地产开发投资：invest
s1 = corrcoef(rural_population, house_price)          %求乡村就业人口与房价的相关性
s2 = corrcoef(estate_employment, house_price)         %
s3 = corrcoef(rural_population, estate_employment)

%导入数据
%北上广深房价：price_develop,偏远地区房价:price_remote
%北上广深房地产投资资金:tz_develop,偏远地区房地产投资资金tz_remote
%北上广深房地产投资增长率：v22,偏远地区房地产投资增长率:v33
load('投资增长.mat')
x = [10:-1:1]
plot(x,price_develop,'- ',x,price_remote,'--') %制作房价图
plot(x,tz_develop,'- ',x,tz_remote,'--')       %制作投资额增长图
x = [9:-1:1]
plot(x,v22,'- ',x,v33,'--')                    %制作房地产投资增长率图
corr(price_develop',tz_develop')                 %求北上广深的房价和房地产投资的相关性
corr(price_remote',tz_remote')                   %求偏远地区房价与房地产投资的相关性

