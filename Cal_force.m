function [a,dL] = Cal_force(X,V,nball,force_radius,k,ks,L0,damping,m,g)
%输出3个球的加速度
%输出绳形变，以计算绳弹性势能

[L1,L2,L,D] = Distance(X,nball);
[Fs1,Fs2,F_pair,dL] = Cal_force_pair(X,V,nball,force_radius,k,ks,L,L0,L1,L2,damping,D);

F = zeros(3,3);
for i=1:nball
    for j=1:nball
        if (j~=i) && D(i,j)<force_radius
            F(i,:)=F(i,:)+F_pair{i,j};
        end
    end
    F(i,2)=F(i,2) - m*g;%加入重力场
end

F(2,:)=F(2,:)+Fs1;%中球加入绳力与空气阻力
F(3,:)=F(3,:)+Fs2;%底球加入绳力与空气阻力
    
a = F/m;
a(1,:)=zeros(1,3);