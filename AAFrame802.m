clear all
close all
clear classes
clc

%% 基础变量设定 
%%%%%%%% 时间 %%%%%%%%
global dt
dt=1e-5;    NT=2e5;
global RTS_time CTS_time ACK_time data_time SLS_time window
RTS_time=20; CTS_time=20; ACK_time=20; data_time=100; window=10;
SLS_time=26;
global changshi
changshi=2;
%%%%%%% 结果评价参数 %%%%%%
global pa_count pa_all
pa_count=0; pa_all=0;
%% 需要扫描/控制的全局变量
global sudu1 sudu2
sudu1=0.5*pi;   sudu2=0.5*pi;
global b_perfect f_hua
b_perfect=0; f_hua=0;
global SN
SN=32;
%% 画图设置
global daxiao fanwei
daxiao=20;  fanwei=20;
if f_hua
%     figure
%     figure
end
%% 定义点
global node 
p=[8,11];  v=[0,0];    angv=sudu1;    
node=dian802(SN,p,v,angv,1,'trans'); %% transmitter
p=[0,0];    v=[0,0];    angv=sudu2;    
node(2)=dian802(SN,p,v,angv,2,'recei');%%  receiver
p=[-10,-3]; v=[0,0];    angv=0.4*pi;    
node(3)=dian802(SN,p,v,angv,3,'distu');%%  disturber
%% 产生事件及其队列
global que
que=[];
eve.t=1;eve.origin=0;eve.des=1;eve.lei='i';eve.var=1;
que=[que eve];

%% 正式循环程序
faq=[];
for i=0:NT
    %%%%%%%%%%%%%%%%% 画图 %%%%%%%%%%%%%%%%%
    if mod(i,10)==0
%         i
        if ((i/pa_count)~=Inf)
            faq=[faq;i/pa_count];
        end
        disp([num2str(i),': ',num2str(i/pa_count)]);
        if f_hua
            huatu802(node(1),node(2),node(3),i);
        end
    end
    %%%%%%%%%%%%%%%%% 刷新 %%%%%%%%%%%%%%%%% 
    node=real_pos(node);
    %%%%%%%%%%%%%%%%% 事件处理 %%%%%%%%%%%%%%%%%   
    if isempty(que)
        eve.t=i+1;eve.origin=0;eve.des=1;eve.lei='i';eve.var=1;
        que=[que eve];
    end
    j=1;
    while(j<=length(que))
        if (que(j).t==i)
            switch que(j).lei
                case '0'
                    node(que(j).des)=handle_message(node(que(j).des),que(j));
                    que(j)=[];
                otherwise
                    j=j+1;
            end
            
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
    %%%%%%%%%%%%%%%%% 状态更新 %%%%%%%%%%%%%%%%%
    for j=1:3
        node(j)=update(node(j));
    end
  pause(0.01)
  
end
% NT/pa_count;












