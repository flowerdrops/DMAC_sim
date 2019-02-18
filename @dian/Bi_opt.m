function me=Bi_opt(me)
global b_naive
[a1,~]=size(me.X);
[a2,~]=size(me.B);
me.B_pre=me.B;
%%%%%%%%%%%%%%%%% initialize %%%%%%%%%%%%%%%%%%
if a1~=a2
    me.PB=zeros(a1,me.M);
    me.PB(:,1)=0.8; me.PB(:,2)=0.2;
    me.B=zeros(a1,me.M);
    me.B(:,1)=1;
    me.B_pre=me.B;
    return;
end
%%%%%%%%%%%%%%%%%  for compare %%%%%%%%%%%%%%%%%%
if b_naive
    me.B=zeros(a1,me.M);
    me.B(:,1)=1;
    return;
end
%%%%%%%%%%%%%%%%% strategy %%%%%%%%%%%%%%%%%%
for i=1:a1
    for j=1:me.M
        if rand<me.PB(i,j)
            me.B(i,j)=1;
        else
            me.B(i,j)=0;
        end
    end
    if sum(me.B(i,:))==0
        me.B(i,find(me.PB(i,:)==max(me.PB(i,:))))=1;
    end
end

end








