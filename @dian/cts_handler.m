function recei=mycts(recei,trans,dis)
global F dt
if recei.tr==0  %%% ����Ҫ����
	recei=Bi_opt(recei);    recei=decide(recei);
	recei.res_pre=recei.res;  %%% ������
	recei=test_cover(recei,trans,dis); %%% ������Ƿ����
    %%%%%%%%%%%%%  ���¸���  %%%%%%%%%%%%%%
	recei.PB=update_pro(recei.PB,recei.res,recei.res_pre,recei.B,recei.B_pre);
	if recei.res                  
        F='d';
    else
        recei.tc=recei.tc+dt;
    end
else  %%% ���ڵȴ�ʱ��
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


            
        












