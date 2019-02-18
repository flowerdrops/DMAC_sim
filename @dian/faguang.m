function faguang(obj)
global f_hua
if ~f_hua
    return
end
set(groot,'CurrentFigure',1);
hold on
for i=1:obj.M
    if obj.D(i)==1
        %%%% 
        text(obj.p(1)+2,2+obj.p(2),num2str(i));
        jiami(obj.M,i,obj.p,obj.ang);
    end
end
% pause(0.01);
end



function jiami(M,a,P,jiaodu)
global fanwei
jiao=2*pi/M;
 
    for i=(a-1):0.1:(a-0.0)
       x=P(1)+linspace(0,fanwei*cos(jiaodu+i*jiao),20);
       y=P(2)+linspace(0,fanwei*sin(jiaodu+i*jiao),20);
       plot(x,y,'m');
       hold on
    end
end




















