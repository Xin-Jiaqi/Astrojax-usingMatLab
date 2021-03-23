function [Fs1,Fs2,F_pair,dL] = Cal_force_pair(X,V,nball,force_radius,k,ks,L,L0,L1,L2,damping,D)
%输入参量与位置、速度
%输出底球、中球所受合力
%输出绳形变，以计算绳弹性势能

Fr=zeros(3,3);
F_pair=cell(3,3);
F_pair(:)={zeros(1,3)};

for i=1:(nball-1)%i=1,2
    for j=(i+1):nball%j=2,3
        if D(i,j)<force_radius
            dr=force_radius-D(i,j);
            Fr(i,j)=k*dr;
        else
            Fr(i,j)=0;
        end
        e=(X(i,:)-X(j,:))/D(i,j);
        F_pair{i,j}=e*Fr(i,j);
        F_pair{j,i}=-F_pair{i,j};
    end
end
%如果撞击

dL=L-L0;
if dL>0
    Fsr = ks*dL;
else
    Fsr = 0;
end

e1=(X(2,:)-X(3,:))/L2;
Fs2=e1*Fsr;%底球所受绳力
Ft2=-Fs2;

e0=(X(1,:)-X(2,:))/L1;
Ft1=e0*Fsr;
Fs1=Ft2+Ft1;%中球所受绳力

Fs1=Fs1-V(2,:)*damping;%中球所受绳力与空气阻力
Fs2=Fs2-V(3,:)*damping;%底球所受绳力与空气阻力