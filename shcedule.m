% close all
clear all
clear classes
clc
global b_perfect b_naive f_hua f_pian
b_perfect=0; b_naive=0;  f_hua=1; f_pian=0;
pp=[10,100,200,300,400,500,600,700,800,900,1000];
global SN period sudu1 sudu2
SN=32;
sudu1=0.4*pi; sudu2=0.4*pi;
%%%%%%%%%%%%%%%% for vision %%%%%%%%%%%%%%%%%
% disp(['M=',num2str(SN),' r=', num2str(sudu1/pi),' calculating....']);
% res1=zeros(length(pp),4);
% %%
% for sj=1:length(pp)
%     
%     period=pp(sj)*100;
%     disp(['���ڣ�',num2str(period)])
%     
%     b_naive=0; f_pian=0;
%     AAAAAAframe;
%     res1(sj,1)=NT/pa_count;
%     disp(['����׼ȷ-> �ҵ� ','ƽ��ʱ�䣺',num2str(NT/pa_count)]);
%     disp(['     �ѷ��ͣ�',num2str(pa_all),' �ѽ��ܣ�',num2str(pa_count)]);
%     
% %     b_naive=1; f_pian=0;
% %     AAAAAAframe;
% %     res1(sj,2)=NT/pa_count;
% %     disp(['����׼ȷ-> ������� ','ƽ��ʱ�䣺',num2str(NT/pa_count)]);
% %     disp(['     �ѷ��ͣ�',num2str(pa_all),' �ѽ��ܣ�',num2str(pa_count)]);
%     
%     b_naive=0; f_pian=1;
%     AAAAAAframe;
%     res1(sj,3)=NT/pa_count;
%     disp(['��΢ƫ��-> �ҵ� ','ƽ��ʱ�䣺',num2str(NT/pa_count)]);
%     disp(['     �ѷ��ͣ�',num2str(pa_all),' �ѽ��ܣ�',num2str(pa_count)]);
%     
% %     b_naive=1; f_pian=1;
% %     AAAAAAframe;
% %     res1(sj,4)=NT/pa_count;
% %     disp(['��΢ƫ��-> ������� ','ƽ��ʱ�䣺',num2str(NT/pa_count)]);
% %     disp(['     �ѷ��ͣ�',num2str(pa_all),' �ѽ��ܣ�',num2str(pa_count)]);
% end

%%%%%%%%%%%%%%%% for 802.11 %%%%%%%%%%%%%%%%%
ss=0.1:0.1:0.5;
% sjzhou=[32,60,100];
sjzhou=[32,64,128];
res1=zeros(5,6);
period=20000;
for si=1:length(sjzhou)
    SN=sjzhou(si);
    disp(['sector������',num2str(SN)])
    for sj=1:5
%         disp(['���ٶȣ�',num2str(ss(sj))])
%         sudu1=ss(sj)*pi; sudu2=ss(sj)*pi;
%         AAAAAAframe;
%         disp(['�ҵ�ƽ��ʱ�䣺',num2str(NT/pa_count),'���ͣ�',num2str(pa_all),' �ɹ���',num2str(pa_count)]);
%         res1(sj,si*2-1)=NT/pa_count;
        AAFrame802;
        disp(['802��ƽ��ʱ�䣺',num2str(NT/pa_count),'���ͣ�',num2str(pa_all),' �ɹ���',num2str(pa_count)]);
        res1(sj,si*2)=NT/pa_count;
    end
end













