function obj=dian802(M,p,v,angv,id,name)
%%%%%%%%%%%%%  �����  %%%%%%%%%%%%%
d.id=id;
d.name=name;
%%%%%%%%%%%%%  �ռ�λ��  %%%%%%%%%%%%%
d.p=p;
d.v=v;
d.ang=0;
d.angv=angv;
%%%%%%%%%%%%%  ��������ʵ  %%%%%%%%%%%%%
d.D=zeros(1,M);
d.neigh=zeros(1,M);
d.ind=1;
%%%%%%%%%%%%%  ͨ������  %%%%%%%%%%%%%
d.res=1;
d.M=M;
d.mubiao=1;
d.duifang=1;
%%%%%%%%%%%%%  for transmitter  %%%%%%%%%%%%%
d.nr=0;d.nd=0;
%%%%%%%%%%%%%  for receiver  %%%%%%%%%%%%%
d.nc=0;d.na=0;
obj = class(d, 'dian802');
end









