function Simulation_movie
clc
clear
%对输出结果进行可视化处理，描绘轨迹

[nball,dt,k,ks,damping,m,g,L0,force_radius,range] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;
[Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range);
c=1;
pic_num = 1;
shpere_radius=0.03;
for i=1:range
    frame_interval=5;
    if rem(i,frame_interval)==0
%         [shpx,shpy,shpz]  = ellipsoid(Xtx(i),Xty(i),Xtz(i),shpere_radius,shpere_radius,shpere_radius,6);
%         surf(shpx,shpy,shpz);hold on
%         [shpx,shpy,shpz]  = ellipsoid(Xmx(i),Xmy(i),Xmz(i),shpere_radius,shpere_radius,shpere_radius,6);
%         surf(shpx,shpy,shpz);
%         [shpx,shpy,shpz]  = ellipsoid(Xbx(i),Xby(i),Xbz(i),shpere_radius,shpere_radius,shpere_radius,6);
%         surf(shpx,shpy,shpz);
%         plot3([Xtx(i),Xmx(i),Xbx(i)],[Xty(i),Xmy(i),Xby(i)],[Xtz(i),Xmz(i),Xbz(i)])
        plot3(Xtx(i),Xty(i),Xtz(i),'.',Xmx(i),Xmy(i),Xmz(i),'.',Xbx(i),Xby(i),Xbz(i),'.',[Xtx(i),Xmx(i),Xbx(i)],[Xty(i),Xmy(i),Xby(i)],[Xtz(i),Xmz(i),Xbz(i)])
        title(['Runing Time:',num2str(roundn(i*dt,-2))])
        grid on
        xlabel('x');ylabel('y');zlabel('z');
        legend('顶球','中球','底球')
        axis equal 
        axis([ -L0 L0  -L0 L0  -L0 L0/10 ])
        hold off
        F=getframe(gcf);
        I=frame2im(F);
        [I,map]=rgb2ind(I,256);
        
        if pic_num == 1
        imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);
        else
        imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);
        end
        pic_num = pic_num + 1;
    end
end
close all