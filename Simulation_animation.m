function Simulation_animation

%对输出结果进行可视化处理，动画尝试

[nball,dt,k,ks,damping,m,g,L0,force_radius,range] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;
[Xtx,Xty,Xtz,Xmx,Xmy,Xmz,Xbx,Xby,Xbz] = Order_xyz(Xtop,Xmiddle,Xbottom,range);

subplot(1,3,1)
axis([-0.6 0.6 -0.8 0.6])
a1 = animatedline('Color',[0 .7 .7]);
a2 = animatedline('Color',[0 .5 .5]);
for i=1:range
    addpoints(a1,Xmx(i),Xmy(i),Xmz(i));
    addpoints(a2,Xbx(i),Xby(i),Xbz(i));
    drawnow limitrate
end
title('2D俯视')
    
subplot(1,3,2)
comet3(Xmx,Xmy,Xmz);
title('3Dmiddle')

subplot(1,3,3)
comet3(Xbx,Xby,Xbz);
title('3Dbottom')