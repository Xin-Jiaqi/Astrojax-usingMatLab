function [Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range,dt,omega,r)

%输入3个range*3矩阵，储存上中下三球位移，每行一个迭代结果
%将位移拆分，并交换y、z轴
%输出3*3个1*range矩阵，每一元素为迭代结果的一个方向分量

Xtx=zeros(1,range);
Xty=zeros(1,range);
Xtz=zeros(1,range);
Xmx=zeros(1,range);
Xmy=zeros(1,range);
Xmz=zeros(1,range);
Xbx=zeros(1,range);
Xby=zeros(1,range);
Xbz=zeros(1,range);

for i=1:range
   Xtx(i)=Xtop(i,1); 
   Xty(i)=Xtop(i,3);
   Xtz(i)=Xtop(i,2);
   Xmx(i)=Xmiddle(i,1);
   Xmy(i)=Xmiddle(i,3);
   Xmz(i)=Xmiddle(i,2);
   Xbx(i)=Xbottom(i,1);
   Xby(i)=Xbottom(i,3);
   Xbz(i)=Xbottom(i,2);
end