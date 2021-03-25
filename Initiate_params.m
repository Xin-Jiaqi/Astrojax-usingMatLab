function [nball,dt,k,ks,damping,m,g,L0,force_radius,range] = Initiate_params
nball = 3;
dt = 0.0001;
k = 28000;
ks = 28000;
damping = 0;%有阻尼：damping = 0.001
m = 31.88/1000;
g = 9.8;
L0 = 0.61;%无阻尼顶球固定绳长
%L0 = 1.28290629;%有阻尼受迫绳长
radius = 0.01;%球的半径
force_radius = 2*radius;%两个球碰撞的极限

range = 100000;