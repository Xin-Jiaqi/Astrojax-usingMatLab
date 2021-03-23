function Simulation_trail

%对输出结果进行可视化处理，描绘轨迹

[nball,dt,k,ks,damping,m,g,L0,force_radius,range,omega,r] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;
[Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range,dt,omega,r);

plot3(Xmx,Xmy,Xmz,'.',Xbx,Xby,Xbz,'.')
title('球的轨迹')
grid on
xlabel('x');ylabel('y');zlabel('z');
legend('中球','底球')