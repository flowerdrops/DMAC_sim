function me=update(me)
global dt
%%%%%%%%%%%%%%%%% �ռ�λ�� %%%%%%%%%%%%%%%%%
me.p=me.p+me.v*dt;
me.ang=me.ang+me.angv*dt;

end