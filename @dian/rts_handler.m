function trans=myrts(trans,recei,dis)
global F dt
if trans.tr==0  %%% ����Ҫ����
	trans=Bi_opt(trans);    trans=decide(trans);
	hold on; faguang(trans); pause(0.01);
	trans.res_pre=trans.res;  %%% ������
	trans=test_cover(trans,recei,dis); %%% ������Ƿ����
    %%%%%%%%%%%%%  ���¸���  %%%%%%%%%%%%%%
	trans.PB=update_pro(trans.PB,trans.res,trans.res_pre,trans.B,trans.B_pre);
	if trans.res                  
        F='c';
    else
        trans.tr=trans.tr+dt;
    end
else  %%% ���ڵȴ�ʱ��
    if trans.tr<trans.TR
        trans.tr=trans.tr+dt;
    else
        trans.tr=0;
        if trans.nr<trans.NR
            trans.nr=trans.nr+1;    return;
        else
            F='r';  trans.nr=0; trans.tr=0;
            return;
        end
	end    
end
hold on; faguang(trans); pause(0.01);
end


            
        












