function outimg=gaussianSmoothing(inpimg, num)

if nargin<2
    num=2;
end
if mod(num,2)==1
    num=num-1;
end

[height, width]=size(inpimg);
mask=gaussianCoefficient(num);
ex=floor(num/2);
orgimg=zeros(height+ex*2, width+ex*2);
outimg=zeros(height, width);
orgimg(ex+1:height+ex, ex+1:width+ex)=inpimg;

for i=1:height
    for j=1:width
        value=orgimg(i:i+num, j:j+num).*mask;
        outimg(i,j)=sum(value(:));
    end
end
