function me=camera(me)
global f_pian
tmp=find(me.neigh>0);
n=length(tmp);
X=[];
for i=1:n
    X=[X;zeros(1,me.M)];
    if f_pian
        X(i,mod(tmp(i)+randi(3)-3,me.M)+1)=me.neigh(tmp(i));
    else
        X(i,tmp(i))=me.neigh(tmp(i));
    end  
end
me.X=X;
%%%%%%%%%%%%%%%%% 每次更新时都选择相信 %%%%%%%%%%%
me.PB=zeros(n,me.M);
me.PB(:,1)=0.8; me.PB(:,2)=0.2;
me.B=zeros(n,me.M);
me.B(:,1)=1;
end