function Simulation_movie
clc
clear
%对输出结果进行可视化处理，描绘轨迹

[nball,dt,k,ks,damping,m,g,L0,force_radius,range] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;
[Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range);

c=1;
for i=1:range
    frame_interval=300;
    if rem(i,frame_interval)==0
        plot3(Xtx(i),Xty(i),Xtz(i),'.',Xmx(i),Xmy(i),Xmz(i),'.',Xbx(i),Xby(i),Xbz(i),'.',[Xtx(i),Xmx(i),Xbx(i)],[Xty(i),Xmy(i),Xby(i)],[Xtz(i),Xmz(i),Xbz(i)])
        title('球的轨迹')
        grid on
        xlabel('x');ylabel('y');zlabel('z');
        len=1;
        legend('顶球','中球','底球')
        axis([-len len -len len -len len]);
        f(c)=getframe;
        c=c+1;
    end
end
movie(f,10,fix(1/dt/frame_interval))