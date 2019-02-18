function hua_pro(trans,recei)
global f_hua
if ~f_hua
    return
end
set(groot,'CurrentFigure',2);
hold off
a1=trans.PB';a2=recei.PB';
subplot(2,1,1)
bar(a1(:)) 
title('transmitter')
axis([0 2*trans.M 0 1])
subplot(2,1,2)
bar(a2(:)) 
title('receiver')
axis([0 2*recei.M 0 1])
pause(0.001)
end