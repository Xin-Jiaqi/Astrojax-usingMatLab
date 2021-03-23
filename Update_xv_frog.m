function [newX,newV,dL] = Update_xv_frog(X,V,nball,force_radius,k,ks,L0,damping,m,g,dt)
%输出每一步迭代的速度、位移(均是3*3矩阵)
%算法：蛙跳法
%输出迭代后的速度、位移（3*3）
%输出每一步的绳形变，以计算绳弹性势能；

[a,dL] = Cal_force(X,V,nball,force_radius,k,ks,L0,damping,m,g);

newV = zeros(3,3);
newX = zeros(3,3);

for i=1:nball
    for j=1:3
        newV(i,j)=V(i,j)+a(i,j)*dt/2.0;
    end
end

for i=1:nball
    for j=1:3
        newX(i,j)=X(i,j)+newV(i,j)*dt;
    end
end

X=newX;
V=newV;

[a,dL] = Cal_force(X,V,nball,force_radius,k,ks,L0,damping,m,g);

for i=1:nball
    for j=1:3
        newV(i,j)=newV(i,j)+a(i,j)*dt/2.0;
    end
end