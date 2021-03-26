a=zeros(1,range);
b=zeros(1,range);

for i=1:range
    a(i)=Xtop(i,1);
    b(i)=Xtop(i,3);
end

plot(a,b)