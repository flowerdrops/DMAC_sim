function me=update_pro(me)
[xun,M]=size(me.PB);
for sjji=1:xun
    r1=me.res*M-sum(me.B(sjji,:));
    r2=me.res_pre*M-sum(me.B_pre(sjji,:));
    %%%%%%%%% 保持历史记录 %%%%%%%%%%%%%%%%%
    if r1>=(M-1)
        me.PB(sjji,find(me.B(sjji,:)==1))=1;
        me.PB(sjji,find(me.B(sjji,:)~=1))=0;
        continue;
    end
    if r1==r2
        if r1<=0  
            %%%%%%%%%%%%%%%% research %%%%%%%%%%%%%%%%%%%%%
            me.PB(sjji,:)=research(me.PB(sjji,:),M,me.B(sjji,:));
        else
            %%%%%%%%%%%%%%%%% hold on %%%%%%%%%%%%%%%%
            me.PB(sjji,:)=holdon(me.PB(sjji,:),M,me.B(sjji,:),me.B_pre(sjji,:));
        end
    end
    if r1>r2  
        if r1>0
            %%%%%%%%%%%% beam reduced or connected %%%%%%%%
            me.PB(sjji,:)=broc(me.PB(sjji,:),M,me.B(sjji,:),me.B_pre(sjji,:));       
        else
            %%%%%%%%%%%%%% research %%%%%%%%%%%%%%
            me.PB(sjji,:)=research(me.PB(sjji,:),M,me.B(sjji,:));
        end
    end
    if r1<r2
        if r1>0   
            %%%%%%%%%%% beam increase %%%%%%%%%%%%%%%%%%%%%
            me.PB(sjji,:)=beam_inc(me.PB(sjji,:),M,me.B(sjji,:),me.B_pre(sjji,:));
        else if r2<0 
                %%%%%%%%%%% research %%%%%%%%%%%%%%%%%%%%%
                me.PB(sjji,:)=research(me.PB(sjji,:),M,me.B(sjji,:));
            else
                %%%%%%%%%%% disconnected %%%%%%%%%%%%%%%%%%%%%
                me.PB(sjji,:)=disconn(me.PB(sjji,:),M,me.B(sjji,:),me.B_pre(sjji,:));
            end
        end
    end
end


% res=res+1e-3;
% res=double(res>1)+res.*double(res<=1);
me.PB=0.8*me.PB./max(me.PB')';
% res=res*0.92;
% res=res+1e-3;



end

function res=research(res,M,B)
global F
% disp('research')
% res=res+1e-2;
    if sum(B)==0
        res(1)=enhance(res(1));res(2)=enhance(res(2));
        res(M)=enhance(res(M));
%         disp([F,'--',num2str(i), '---research: enhance ', num2str(res(i))])
        return
    end
	for i=1:M
        if B(i)==1
            for j=(i-1):(i+1)
                t=mod(j-1,M)+1;
                if B(t)~=1
                    res(t)=enhance(res(t));
%                 disp([F,'--',num2str(i), '---research: enhance ', num2str(res(i))])
                end
            end
        end
    end
    
end

function res=holdon(res,M,B,Bn)
global F
% disp('hold on')
	for i=1:M
        if B(i)==1
            if Bn(i)==0
%                 res(i)=reduce(res(i));
%                 disp([F,'--',num2str(i), '---holdon: reduce ', num2str(res(i))])
            else
                res(i)=enhance(res(i));
%                 disp([F,'--',num2str(i), '---holdon: enhance ', num2str(res(i))])
            end            
        else
%             res(i)=reduce(res(i));
                res(i)=0;
%             disp([F,'--',num2str(i), '---holdon: reduce ', num2str(res(i))])
        end
	end
end

function res=broc(res,M,B,Bn)
global F
% disp('beam reduced or connected')
    for i=1:M
        if B(i)==1
                res(i)=enhance(res(i));
%                 disp([F,'--',num2str(i), '--beam reduced or connected: reduce ', num2str(res(i))])
        end
        if B(i)==0 
            res(i)=0;
%             res(i)=reduce(res(i));
        end
    end
end


function res=beam_inc(res,M,B,Bn)
global F
% disp('beam increased')
    for i=1:M
        if B(i)==1 && Bn(i)==0
%             res(i)=reduce(res(i));
%%%%%%%%%%%%%%%%%  有争议 %%%%%%%%%%%%%%%%%%%%%%%%
            res(i)=0;
%             disp([F, '---beam increased: reduce ', num2str(res(i))])
        end
        if B(i)==0
            res(i)=0;
%             res(i)=reduce(res(i));
%             disp([F,'--',num2str(i), '---beam increased: reduce ', num2str(res(i))])
        end
    end
end

function res=disconn(res,M,B,Bn)
global F
% disp('disconnected')
    for i=1:M
        if B(i)==0 && Bn(i)==1
            res(i)=enhance(res(i));
%             disp([F,'--',num2str(i), '---disconnected: enhance ', num2str(res(i))])
        end
    end
end










