function [Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv
%可以输出[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom]
%输出绳形变序列，以计算绳弹性势能

[nball,dt,k,ks,damping,m,g,L0,force_radius,range,omega,r] = Initiate_params;
%参数初始化

Xexp=cell(1,range);
Xexp(:)={zeros(3,3)};
Vexp=cell(1,range);
Vexp(:)={zeros(3,3)};
dLexp=zeros(1,range);

[Xexp{1},Vexp{1}] = Initiate_xv;
%速度、位移初始化

t=0:dt:(range-1)*dt;
r=norm(Xexp{1}(1,:));
x=r*cos(t*omega);
y=r*sin(t*omega);

for i=2:range
Xexp{i-1}(1,1)=x(i-1);
Xexp{i-1}(1,3)=y(i-1);
%顶球有它自己的想法
[Xexp{i},Vexp{i},dL] = Update_xv_frog(Xexp{i-1},Vexp{i-1},nball,force_radius,k,ks,L0,damping,m,g,dt);
%若要改变算法：
%[Xexp{i},Vexp{i},dL] = Update_xv_frog(Xexp{i-1},Vexp{i-1},nball,force_radius,k,ks,L0,damping,m,g,dt);
%[Xexp{i},Vexp{i},dL] = Update_xv_RK4(Xexp{i-1},Vexp{i-1},nball,force_radius,k,ks,L0,damping,m,g,dt);

dLexp(i) = dL;
end


Xtop = zeros(range,3);
Vtop = zeros(range,3);
Xmiddle = zeros(range,3);
Vmiddle = zeros(range,3);
Xbottom = zeros(range,3);
Vbottom = zeros(range,3);

for i = 1 : range
    Xtop(i,:)=Xexp{1,i}(1,:);
    Vtop(i,:)=Vexp{1,i}(1,:);
    Xmiddle(i,:)=Xexp{1,i}(2,:);
    Vmiddle(i,:)=Vexp{1,i}(2,:);
    Xbottom(i,:)=Xexp{1,i}(3,:);
    Vbottom(i,:)=Vexp{1,i}(3,:);
end
% for i=1:range
%     plot(X)