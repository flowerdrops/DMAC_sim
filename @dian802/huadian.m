function huadian(obj,color)
global f_hua daxiao
if ~f_hua
    return
end
set(groot,'CurrentFigure',1);
tt=0:0.1:2*pi;
x_o=cos(tt);    y_o=sin(tt);
plot(x_o+obj.p(1),y_o+obj.p(2));    hold on;    
fill(x_o+obj.p(1),y_o+obj.p(2),color); hold on
% axis equal
% axis([-1.2*daxiao 1.2*daxiao -1.2*daxiao 1.2*daxiao])
% pause(0.001)
end
