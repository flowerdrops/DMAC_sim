clear all
% close all
clear classes
clc
%% ���������趨
%%%%%%%% ʱ�� %%%%%%%%
global dt
dt=1e-5;    NT=2e5;
global RTS_time CTS_time ACK_time data_time period window
RTS_time=20; CTS_time=20; ACK_time=20; data_time=100;  window=10;
%%%%%%% �Ż����� %%%%%%
global k k1 k2
k=1; k1=4; k2=4;
%%%%%%% ������۲��� %%%%%%
global pa_count pa_all
pa_count=0; pa_all=0;
%% ��Ҫɨ��/���Ƶ�ȫ�ֱ���
global sudu1 sudu2
sudu1=0.4*pi;   sudu2=0.4*pi;
global b_perfect b_naive f_hua f_pian
b_perfect=0; b_naive=1;  f_hua=0; f_pian=0;
global shoulian SN
SN=64;
shoulian=3;
period=10e4;
%% ��ͼ����
global daxiao fanwei
daxiao=20;  fanwei=20;
if f_hua
%     figure
%     figure
end

%% �����
global node
p=[10.5,11];  v=[0,0];    angv=sudu1;    
node=dian(SN,p,v,angv,1,'trans'); %% transmitter
p=[0,0];    v=[0,0];    angv=sudu2;    
node(2)=dian(SN,p,v,angv,2,'recei');%%  receiver
p=[-10,-3]; v=[0,0];    angv=0.4*pi;    
node(3)=dian(SN,p,v,angv,3,'distu');%%  disturber

%% �����¼��������
global que
que=[];
eve.t=1;eve.origin=0;eve.des=1;eve.lei='i';eve.var=1;
que=[que eve];

%% ��ʽѭ������
faq=[];
for i=0:NT
    
%%%%%%%%%%%%%%%%% ��ͼ %%%%%%%%%%%%%%%%%
    if mod(i,20)==0
%         i
        if ((i/pa_count)~=Inf)
            faq=[faq;i/pa_count];
        end
        disp([num2str(i),': ',num2str(i/pa_count)]);
        if f_hua
            huatu(node(1),node(2),node(3),i);
        end
    end
    
%%%%%%%%%%%%%%%%% ˢ��/�� %%%%%%%%%%%%%%%%%    
    
    if mod(i,period)==0
        node=real_pos(node);
        for j=1:length(node)
            node(j)=camera(node(j));
        end
    end
%%%%%%%%%%%%%%%%% �¼����� %%%%%%%%%%%%%%%%%   
    if isempty(que)
        eve.t=1;eve.origin=0;eve.des=1;eve.lei='i';eve.var=1;
        que=[que eve];
    end
    j=1;
    while(j<=length(que))
        if (que(j).t==i) &&(que(j).lei=='0')
            node(que(j).des)=handle_message(node(que(j).des),que(j));
            que(j)=[];
        else
            j=j+1;
        end
    end
    j=1;
    while(j<=length(que))
        if que(j).t==i
            node=real_pos(node);
            node(que(j).des)=handle_message(node(que(j).des),que(j));
            que(j)=[];
        else
            j=j+1;
        end
    end    
%%%%%%%%%%%%%%%%% ״̬���� %%%%%%%%%%%%%%%%%
    for j=1:3
        node(j)=update(node(j));
    end
  pause(0.01)
end
% NT/pa_count;
figure
plot(faq)
title(['M=',num2str(SN),' v=',num2str(sudu1/pi)]);
xlabel(['period=',num2str(period)]);











