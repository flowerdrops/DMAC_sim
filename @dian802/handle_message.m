function me=handle_message(me,e)
global que
global RTS_time CTS_time data_time ACK_time SLS_time window
global changshi
global pa_count pa_all
eve=[];
switch e.lei
    case '0' %% shut off light bulb
        me.D=zeros(1,me.M);
        return;
    case 'i' %% idel
        que=[que,chixu(e,RTS_time)];
        me=decide(me);
        me=test_cover(me,2);
        if me.res
            eve.t=e.t+RTS_time;
            eve.origin=1;
            eve.des=2;
            eve.lei='r';
            eve.var=0;
        else
            eve.t=e.t+RTS_time+changshi*(window+CTS_time);
            eve.origin=2;
            eve.des=1;
            eve.lei='si';
            eve.var=me.ind;
        end
    case 'si'%% I am sls initializer
        que=[que,chixu(e,SLS_time)];
        me.mubiao=e.var;
        me.ind=me.ind+1;      
        me=decide(me);
        if me.ind<=me.M+1            
            me=test_cover(me,e.origin);
            eve.t=e.t+SLS_time;
            eve.origin=e.origin;
            eve.des=e.des;
            eve.lei='si';
            eve.var=me.ind-1;
            if me.res
                et.t=e.t+SLS_time;
                et.origin=e.des;
                et.des=e.origin;
                et.lei='sr';
                et.var=me.mubiao;
                que=[que et];
            end
        else
            me.ind=1;
        end               
    case 'sr' %% I am sls responder
        que=[que,chixu(e,SLS_time)];        
        if length(e.var)==1
            me.duifang=e.var;
            eve.t=e.t+SLS_time*(me.M-e.var+1);    
            me.mubiao=0;
            me=decide(me);
            me.ind=1;
        else
            if length(e.var)==2
            me.mubiao=e.var(1);    
            me=decide(me);
            eve.t=e.t+SLS_time;
            end
        end        
        me.ind=me.ind+1;                
        if me.ind<=(me.M+1)            
            me=test_cover(me,e.origin);
            eve.origin=e.origin;
            eve.des=e.des;
            eve.lei='sr';
            eve.var=[me.ind-1, me.duifang];
            if me.res
                et.t=e.t+SLS_time;
                et.origin=e.des;
                et.des=e.origin;
                et.lei='sa';
                et.var=[me.mubiao, me.duifang];
                que=[que, et];
            end
        else
            me.ind=1;
            eve=[];
        end        
    case 'sa'
        me.duifang=e.var(1);
        me.mubiao=e.var(2);
        me.D=zeros(1,me.M);
        eve.t=e.t+SLS_time*(me.M-e.var(1)+1); 
        eve.origin=e.des;
        eve.des=e.origin;
        eve.lei='sa2';
        eve.var=me.duifang;
%         if e.des==2
%             eve.t=eve.t+SLS_time;
%         end
    case 'sa2'
        me.mubiao=e.var;
        eve.t=e.t+SLS_time;
        eve.origin=1;
        eve.des=1;
        eve.lei='i';
        eve.var=1;
    case 'r'
        que=[que,chixu(e,CTS_time)];
        me=decide(me);
        me=test_cover(me,1);
        if me.res
            eve.t=e.t+CTS_time;
            eve.origin=2;
            eve.des=1;
            eve.lei='c';
            eve.var=1;
        else
            if me.nc<changshi
                me.nc=me.nc+1;
                eve.t=e.t+CTS_time+randi(window);
                eve.origin=2;
                eve.des=2;
                eve.lei='r';
                eve.var=0;
            else
                me.nc=0;
                eve.t=e.t+1;
                eve.origin=1;
                eve.des=2;
                eve.lei='si';
                eve.var=me.ind;
            end
        end
    case 'c'
        que=[que,chixu(e,data_time)];
        me=decide(me);
        me=test_cover(me,2);
        pa_all=pa_all+1;
        if me.res
            eve.t=e.t+data_time;
            eve.origin=1;
            eve.des=2;
            eve.lei='d';
            eve.var=1;
        else
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
                eve.origin=2;
                eve.des=1;
                eve.lei='si';
                eve.var=me.ind;
            end
        end
    case 'd'
        que=[que,chixu(e,ACK_time)];
        me=decide(me);
        me=test_cover(me,1);
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
    case 'a'
        me=decide(me);
        if e.var==1
            pa_count=pa_count+1;
        end
        eve.t=e.t+1;
        eve.origin=1;
        eve.des=1;
        eve.lei='i';
        eve.var=1; 
end
que=[que, eve];
% me=decide(me);
end














