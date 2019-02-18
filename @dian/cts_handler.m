function recei=mycts(recei,trans,dis)
global F dt
if recei.tr==0  %%% 决定要发送
	recei=Bi_opt(recei);    recei=decide(recei);
	recei.res_pre=recei.res;  %%% 储存结果
	recei=test_cover(recei,trans,dis); %%% 看这次是否可以
    %%%%%%%%%%%%%  更新概率  %%%%%%%%%%%%%%
	recei.PB=update_pro(recei.PB,recei.res,recei.res_pre,recei.B,recei.B_pre);
	if recei.res                  
        F='d';
    else
        recei.tc=recei.tc+dt;
    end
else  %%% 还在等待时间
    if recei.tc<recei.TC
        recei.tc=recei.TC+dt;
    else
        recei.tc=0;
        if recei.nc<recei.NC
            recei.nc=recei.nc+1;    return;
        else
            F='r';  recei.nc=0; recei.tc=0;
            return;
        end
	end    
end
hold on; faguang(recei); pause(0.01);
end


            
        












