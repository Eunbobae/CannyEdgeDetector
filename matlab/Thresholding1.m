function outimg=Thresholding1(inpimg, th, value)

if nargin==2
    value=255;
end
[row, col]=size(inpimg);
outimg=zeros(row, col);
for i=1:row
    for j=1:col
        if (inpimg(i,j)>th)
            outimg(i,j)=value;
        end
    end
end