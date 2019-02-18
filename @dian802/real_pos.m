function node=real_pos(node)
n=length(node);
card=0:(pi*2/node(1).M):2*pi;
for i=1:(n-1)
    node(i).neigh=zeros(1,node(i).M);
    for j=1:n
        if i==j
            continue;
        end
        tmp=node(j).p-node(i).p;
        t_angle=atan2(tmp(2),tmp(1));
        if t_angle<=0
            t_angle=t_angle+2*pi;
        end
        t_angle=t_angle-node(i).ang;
        while t_angle<=0
             t_angle=t_angle+2*pi;
        end
        for k=1:node(i).M
            if (t_angle>=card(k))&&(t_angle<=card(k+1))
              node(i).neigh(k)=j;
              break;
            end
        end
    end
end
end












