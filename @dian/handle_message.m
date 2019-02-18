function me=handle_message(me,e)
global node shoulian que
global RTS_time CTS_time data_time ACK_time window
global pa_count pa_all
if e.lei=='0'
    me.D=zeros(1,me.M);
    return;
end
if e.var==0 && (e.des==e.origin)
%%%%%%%%  上一次信号没有发送成功，需要更新模型 %%%%%%%
	me=update_pro(me);
end
me=Bi_opt(me);
me=decide(me);
% faguang(me);
switch e.lei
    case 'i' %% idel %%%%%%%%%%%%%%%
        que=[que,chixu(e,RTS_time)];
        me=test_cover(me,2);
        if me.res
            eve.t=e.t+RTS_time;
            eve.origin=1;
            eve.des=2;
            eve.lei='r';
            eve.var=1;
        else
            eve.t=e.t+RTS_time+shoulian*(window+CTS_time);
            eve.origin=1;
            eve.des=1;
            eve.lei='i';
            eve.var=0;
        end   
    case 'r' %% rts received %%%%%%%%%%%%%%%%%
        que=[que,chixu(e,CTS_time)];
        me=test_cover(me,1,3);
        if me.res
            eve.t=e.t+CTS_time;
            eve.origin=2;
            eve.des=1;
            eve.lei='c';
            eve.var=1;
        else
            if me.nc<shoulian
                me.nc=me.nc+1;
                eve.t=e.t+CTS_time+randi(window);
                eve.origin=2;
                eve.des=2;
                eve.lei='r';
                eve.var=0;
            else
                me.nc=0;
                eve.t=e.t+1;
                eve.origin=2;
                eve.des=1;
                eve.lei='i';
                eve.var=0;
            end
        end
    case 'c'%% cts received %%%%%%%%%%%%%%%%%
        que=[que,chixu(e,data_time)];
        me=test_cover(me,2);
        me=update_pro(me);
        pa_all=pa_all+1;
        if me.res
            eve.t=e.t+data_time;
            eve.origin=1;
            eve.des=2;
            eve.lei='d';
            eve.var=1;
        else
%             if me.nd>=shoulian
            if me.nd<1
                me.nd=me.nd+1;
                eve.t=e.t+data_time+randi(window);
                eve.origin=1;
                eve.des=1;
                eve.lei='c';
                eve.var=0;
            else
                me.nd=0;
                eve.t=e.t+1;
                eve.origin=1;
                eve.des=1;
                eve.lei='i';
                eve.var=0;
            end
        end
    case 'd'%% data received %%%%%%%%%%%%%%%%%
        que=[que,chixu(e,ACK_time)];
        me=test_cover(me,1,3);
        me=update_pro(me);
        if me.res
            eve.t=e.t+ACK_time;
            eve.origin=2;
            eve.des=1;
            eve.lei='a';
            eve.var=1;
        else
            eve.t=e.t+ACK_time;
            eve.origin=2;
            eve.des=1;
            eve.lei='a';
            eve.var=0;
        end
    case 'a'%% ack received %%%%%%%%%%%%%
        if e.var==1
            pa_count=pa_count+1;
        end
        me=update_pro(me);
        eve.t=e.t+1;
        eve.origin=1;
        eve.des=1;
        eve.lei='i';
        eve.var=1;        
end
que=[que eve];
end


















