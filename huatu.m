function huatu(trans,recei,dis,all)
global daxiao pa_count pa_all
set(groot,'CurrentFigure',1);
hold off
huadian(trans,'b'); hold on
huadian(recei,'k'); hold on
huadian(dis,'r'); hold on
wangge(recei);
faguang(trans);
faguang(recei);
axis equal
axis([-1.2*daxiao 1.2*daxiao -1.2*daxiao 1.2*daxiao])
title(['已发送:' num2str(pa_all) '，成功接收：' num2str(pa_count)])
xlabel(num2str(all/pa_count))
% xlabel(['transmitter'])
pause(0.001)
hua_pro(trans,recei);
% %% 表格数据
% % data_row1=[68,68,86,43];
% % data_row2=[48,15,37,25];
% data_row1=ones(1,30);
% data_row2=2*ones(1,30);
% data=[data_row1;repmat(data_row2,12,1)];
% 
% %% 生成表格行列名称，m行n列
% str1='横轴';str2='纵轴';
% m=13;n=4;
% column_name=strcat(str1,num2str((1:n)'));
% row_name=strcat(str2,num2str((1:m)'));
% 
% %% 表格作图
% set(figure(1),'position',[20 20 450 330]);
% uitable(gcf,'Data',data,'Position',[20 20 400 300],'Columnname',column_name,'Rowname',row_name);
% 

end