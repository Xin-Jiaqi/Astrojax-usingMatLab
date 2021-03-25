function Energy_analysis
%对输出结果进行能量分析

[nball,dt,k,ks,damping,m,g,L0,force_radius,range] = Initiate_params;
[Xtop,Vtop,Xmiddle,Vmiddle,Xbottom,Vbottom,dLexp] = Get_xv;

Ekm=zeros(1,range);%中球动能
Epm=zeros(1,range);%中球势能
Ekb=zeros(1,range);%底球动能
Epb=zeros(1,range);%底球势能
Eps=zeros(1,range);%绳子势能
Ep=zeros(1,range);%总势能
Ek=zeros(1,range);%总动能
E=zeros(1,range);%总能量

for i=1:range
    Ekm(i) = (m*sum(Vmiddle(i,:).^2))/2;
    Ekb(i) = (m*sum(Vbottom(i,:).^2))/2;
    Epm(i) = m*g*Xmiddle(i,2);
    Epb(i) = m*g*Xbottom(i,2);
    Eps(i) = (k*(dLexp(i)).^2)/2;
    Ek(i) = Ekm(i)+Ekb(i);
    Ep(i) = Epm(i)+Epb(i)+Eps(i);
    E(i) = Ek(i)+Ep(i);
end

subplot(1,3,1)
plot(Ekb);
hold on;
plot(Ekm);
title('Kinetic energy evolution','FontSize',20);
%title('标题','fontname','Times New Roman','Color','b','FontSize',20);
legend('bottom ball','middle ball','location','SouthWest','FontSize',14);

subplot(1,3,2)
plot(Epb);
hold on;
plot(Epm);
plot(Eps);
title('Potential energy evolution','FontSize',20);
legend('bottom ball','middle ball','the string','location','SouthWest','FontSize',14);

subplot(1,3,3)
plot(E);
title('Total energy evolution','FontSize',20);