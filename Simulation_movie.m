%function Simulation_movie
clc
clear
close all
%对输出结果进行可视化处理，描绘轨迹

[nball,dt,k,ks,damping,m,g,L0,force_radius,range,omega,r] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;
[Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range,dt,omega,r);

% a=zeros(1,range);
% b=zeros(1,range);

% for i=1:range
%     a(i)=Xtx(i);
%     b(i)=Xty(i);
% end
% plot(a,b)
% axis equal
% 
c=1;
for i=1:range
    frame_interval=600;
    if rem(i,frame_interval)==0
        plot3(Xtx(i),Xty(i),Xtz(i),'.',Xmx(i),Xmy(i),Xmz(i),'.',Xbx(i),Xby(i),Xbz(i),'.',[Xtx(i),Xmx(i),Xbx(i)],[Xty(i),Xmy(i),Xby(i)],[Xtz(i),Xmz(i),Xbz(i)])
        title('球的轨迹')
        grid on
        xlabel('x');ylabel('y');zlabel('z');
        len=1;
        legend('顶球','中球','底球')
        axis(0.7*[-len len -len len -len len/10]);
        f(c)=getframe;
        c=c+1;
    end
end
movie(f,10,fix(1/dt/frame_interval))

% subplot(121)
% plot3(Xmx,Xmy,Xmz)
% subplot(122)
% plot3(Xbx,Xby,Xbz)

% plot(Xtz)
% hold on;
% plot(Xmz)
% plot(Xbz)

% top=[Xtx(range),Xty(range),Xtz(range)]
% middle=[Xmx(range),Xmy(range),Xmz(range)]
% bottom=[Xbx(range),Xby(range),Xbz(range)]