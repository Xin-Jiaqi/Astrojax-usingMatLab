function [newX,newV,dL] = Update_xv_RK4(X,V,nball,force_radius,k,ks,L0,damping,m,g,dt)
%输出每一步迭代的速度、位移(均是3*3矩阵)
%算法：四阶龙格库塔法
%输出迭代后的速度、位移（3*3）
%输出每一步的绳形变，以计算绳弹性势能

X0=X;
V0=V;

%第一阶
X1=X0;
V1=V0;

[a1,dL] = Cal_force(X1,V1,nball,force_radius,k,ks,L0,damping,m,g);
a1=dt*a1;
V1=dt*V1;

%第二阶
X2=X0+V1/2.0;
V2=V0+a1/2.0;

[a2,dL] = Cal_force(X2,V2,nball,force_radius,k,ks,L0,damping,m,g);
a2=dt*a2;
V2=dt*V2;

%第三阶
X3=X0+V2/2.0;
V3=V0+a2/2.0;

[a3,dL] = Cal_force(X3,V3,nball,force_radius,k,ks,L0,damping,m,g);
a3=dt*a3;
V3=dt*V3;

%第四阶
V4=V0+a3;
X4=X0+V3;

[a4,dL] = Cal_force(X4,V4,nball,force_radius,k,ks,L0,damping,m,g);
a4=dt*a4;
V4=dt*V4;

%加权平均
dV=a1+2*(a2+a3)+a4;
newV=V0+dV/6.0;

dX=V1+2*(V2+V3)+V4;
newX=X0+dX/6.0;