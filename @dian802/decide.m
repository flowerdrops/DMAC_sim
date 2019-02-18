function me=decide(me)
global b_perfect
me.D=zeros(1,me.M);
if b_perfect
    me.D(find(me.neigh>0))=1;
    return;
end
if me.mubiao~=0
    me.D(1+mod(me.mubiao-1,me.M))=1;
end

end