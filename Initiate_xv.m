function [X,V] = Initiate_xv

%无阻尼顶球固定：
% X=[0,0,0;
%      0.159561,-0.276369,0;
%      -0.102632,-0.402322,0];
% V=[0,0,0;
%     0,0,2.249603;
%     0,0,-1.446969];

%有阻尼顶球受迫
X=[0.1181606,0,0;
0.2573569,-0.1221390,-0.0097188;
-0.1433187,-0.2619555,0.0029959];
V=[0,0,0;
0.1360626,0,3.6029960;
-0.0419422,0,-2.0064617];

% dp  =       0.0050000
% l0       =       0.6064928
% g        =       9.8000000
% k       =     280.0000000
% dt       =       0.0000100
% w =      14.0000000
% T        =       0.4487990
% M0       =       0.0330000
% M1       =       0.0330000
% M2       =       0.0330000
% 
% X0x      =       0.1181606
% X0y      =       0.0000000
% X0z      =       0.0000000
% 
% V0x      =       0.0000000
% V0y      =       0.0000000
% V0z      =       1.6542485
% 
% X1x      =       0.2573569
% X1y      =      -0.1221390
% X1z      =      -0.0097188
% 
% V1x      =       0.1360626
% V1y      =       0.0000000
% V1z      =       3.6029960
% 
% X2x      =      -0.1433187
% X2y      =      -0.2619555
% X2z      =       0.0029959
% 
% V2x      =      -0.0419422
% V2y      =       0.0000000
% V2z      =      -2.0064617