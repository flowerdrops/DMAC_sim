function trans=mydata(trans,recei)
global F dt
if trans.td==0
    trans=Bi_opt(trans);    trans=decide(trans);
    hold on;faguang(trans); pause(0.01)
    trans.res_pre=trans.res; %%% 储存结果
    trans=test_cover(trans,recei); %%% 看这次是否可以
    %%%%%%%%%%%%%  更新概率  %%%%%%%%%%%%%%
    trans.PB=update_pro(trans.PB,trans.res,trans.res_pre,trans.B,trans.B_pre);
    trans.td=trans.td+dt;
else
    if trans.td<trans.TD
        trans.td=trans.td+dt;
    else
        trans.td=0;
        if trans.res
            F='a';
        else            
            if trans.nr<trans.NR
                F='c';
                trans.nr=trans.nr+1;
            else
                F='r';
            end
        end
    end
end
hold on;faguang(trans); pause(0.01)
end
















