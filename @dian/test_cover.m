function me=test_cover(me,varargin)
n=numel(varargin);
me.res_pre=me.res;
me.res=1;
tmp=find(me.D==1);
for i=1:n
    yanzh=varargin{i};
    me.res=me.res && ismember(yanzh,me.neigh(tmp));
end

end