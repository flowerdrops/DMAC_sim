function me=decide(me)
global b_perfect
if b_perfect
    me.D=me.neigh;
    me.D=me.D>0;
    return;
end
me.D=zeros(1,me.M);
[a1,~]=size(me.X);
[a2,~]=size(me.B);
if a1~=a2
    a=min(a1,a2);
else
    a=a1;
end
for i=1:a
    me.D=me.D+yuanjuanji(me.X(i,:),me.B(i,:),me.M);
end
me.D=me.D>0;
end


function res=yuanjuanji(x1,x2,M)
res=zeros(1,M);
for i=1:M
    for j=1:M
        res(i)=res(i)+x1(j)*x2(mod(i-j,M)+1);
    end
end
end









