function obj=dian(M,p,v,angv,id,name)
%%%%%%%%%%%%%  �����  %%%%%%%%%%%%%
d.id=id;
d.name=name;
%%%%%%%%%%%%%  ģ����  %%%%%%%%%%%%%
d.X = [];
d.B = [];
d.B_pre=[];
d.PB = [];
d.M=M;
%%%%%%%%%%%%%  �ռ�λ��  %%%%%%%%%%%%%
d.p=p;
d.v=v;
d.ang=0;
d.angv=angv;
%%%%%%%%%%%%%  ��������ʵ  %%%%%%%%%%%%%
d.D=zeros(1,M);
d.D_pre=zeros(1,M);
d.neigh=zeros(1,M);
%%%%%%%%%%%%%  ͨ������  %%%%%%%%%%%%%
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














