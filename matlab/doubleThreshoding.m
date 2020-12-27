function [outimg, colorimg]=doubleThreshoding(inpimg, thRatio, mode)

if nargin<3
    mode=0;
end

[row,col]=size(inpimg);
outimg=zeros(row,col);
orgimg=inpimg(2:row-1, 2:col-1);
highTh=max(orgimg(:))*thRatio(2);
lowTh=highTh*thRatio(1);

for i=1:row
    for j=1:col
        if inpimg(i,j)>lowTh
            outimg(i,j)=1;
        end
        if inpimg(i,j)>highTh
            outimg(i,j)=2;
        end
    end
end

if mode==1
    colorimg=zeros(row,col,3);
    for i=1:row
        for j=1:col
            if outimg(i,j)==1 %green
                colorimg(i,j,2)=255;
            elseif outimg(i,j)==2 %red
                colorimg(i,j,1)=255;
            end
        end
    end
end