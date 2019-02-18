function me=myack(me,ep)
if me.name=='distu'
    return;
end
global que node pa_count
pa_count=pa_count+1;
me.going='rts';
if me.neigh(me.dec)==2
% if node(me.neigh(me.dec)).name=='recei'
    %%%%%%%%%%%%%%%% 射中了 %%%%%%%%%%%%%%%
    e.t=ep.t+1;
%     e.ren=me.neigh(me.dec);
    e.shi=ep.mo; e.mo=ep.shi;
    e.lei='rts';
    e.var=me.neigh(me.dec);
    que=[que e];    
    me.nr=0;
else
    %%%%%%%%%%%%%%%% 如果没有，进入回退模式 %%%%%%%%%%%%%%%    
    if me.nr==3
        e.t=ep.t+1;
        e.shi=ep.mo; e.mo=ep.shi;
        e.lei='sls_i';
        e.var=[];
        que=[que e];
        me.nr=0;
    else
        me.nr=me.nr+1;
        e=ep;
        e.t=ep.t+3;
        que=[que e];
    end
end    
end













