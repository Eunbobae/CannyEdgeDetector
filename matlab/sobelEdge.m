function [outimg, direction]=sobelEdge(inpimg)

[row,col]=size(inpimg);
horiout=zeros(row,col);
vertiout=zeros(row,col);
orgimg=zeros(row+2, col+2);
orgimg(2:row+1, 2:col+1)=inpimg;
hori=[-1,-2,-1;0,0,0;1,2,1];
verti=[-1,0,1;-2,0,2;-1,0,1];

for i=1:row-1
    for j=1:col-1
        value=orgimg(i:i+2, j:j+2).*hori;
        horiout(i,j)=sum(value(:));
    end
end

for i=1:row-1
    for j=1:col-1
        value=orgimg(i:i+2, j:j+2).*verti;
        vertiout(i,j)=sum(value(:));
    end
end

outimg=sqrt(horiout.^2+vertiout.^2);
%maxV=max(outimg(:));
%outimg=outimg/maxV;
direction=zeros(row,col);
for i=1:row
    for j=1:col
        direction(i,j)=atand(horiout(i,j)/vertiout(i,j));
    end
end