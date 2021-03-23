function [L1,L2,L,D] = Distance(X,nball)
%输入三个球的实时位置
%计算三球间距及绳长
D=zeros(3,3);

for i=1:(nball-1)%i=1,2
    for j=(i+1):nball%j=2,3
        if i == j
            D(i,j)=0;
        else
            D(i,j)=sqrt(sum((X(i,:)-X(j,:)).^2));
            D(j,i)=D(i,j);
        end
    end
end

L1 = D(1,2);
L2 = D(2,3);
L = L1+L2;