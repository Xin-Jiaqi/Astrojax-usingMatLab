function [xmiddle,ymiddle,zmiddle] = Analysy_location(Xexp,range)
%输入Xexp,range
%输出中球的x,y,z坐标

xmiddle=zeros(1,range);
ymiddle=zeros(1,range);
zmiddle=zeros(1,range);

for i=1:range
    Xexp{i}(2,1)=xmiddle(i);
    Xexp{i}(2,2)=ymiddle(i);
    Xexp{i}(2,3)=ymiddle(i);
end