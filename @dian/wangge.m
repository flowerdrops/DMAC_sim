function wangge(obj)
global f_hua
if ~f_hua
    return
end
global daxiao
x=-daxiao:0.2:daxiao;
set(groot,'CurrentFigure',1);hold on;
y=x*tan(obj.ang);    plot(obj.p(1)+x,obj.p(2)+y,'r');    hold on
for i=1:(obj.M/2-1)
    y=x*tan(2*pi/obj.M*i+obj.ang);
    plot(obj.p(1)+x,obj.p(2)+y,'k')
    hold on
end
end













