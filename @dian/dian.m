function obj=dian(M,p,v,angv,id,name)
%%%%%%%%%%%%%  标记用  %%%%%%%%%%%%%
d.id=id;
d.name=name;
%%%%%%%%%%%%%  模型用  %%%%%%%%%%%%%
d.X = [];
d.B = [];
d.B_pre=[];
d.PB = [];
d.M=M;
%%%%%%%%%%%%%  空间位置  %%%%%%%%%%%%%
d.p=p;
d.v=v;
d.ang=0;
d.angv=angv;
%%%%%%%%%%%%%  决策与现实  %%%%%%%%%%%%%
d.D=zeros(1,M);
d.D_pre=zeros(1,M);
d.neigh=zeros(1,M);
%%%%%%%%%%%%%  通信与结果  %%%%%%%%%%%%%
d.res=1;
d.res_pre=1;
d.timer=0;
%%%%%%%%%%%%%  for transmitter  %%%%%%%%%%%%%
d.nr=0;d.nd=0;
%%%%%%%%%%%%%  for receiver  %%%%%%%%%%%%%
d.nc=0;d.na=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
obj = class(d, 'dian');
end














