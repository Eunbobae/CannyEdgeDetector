function outimg=NMS(inpimg,dir)
% Non-Maximum-Suppression
% without interpolation

[row,col]=size(inpimg);
boxlen=3;
ex=floor(boxlen/2);
outimg=zeros(row+2*ex, col+2*ex);
outimg(ex+1:row+ex, ex+1:col+ex)=inpimg;
cen=ceil(boxlen/2);

% direction normalizing
normdir=zeros(row,col);
diffdir=zeros(1, 4);
compdir=[180,90,45,135];
for i=1:row
    for j=1:col
        if dir(i,j)<=0
            dir(i,j)=dir(i,j)+180;
        end
        for k=1:4
            diffdir(k)=dir(i,j)-compdir(k);
        end
        [~,ind]=min(abs(diffdir));
        normdir(i,j)=ind;
    end
end

% non-maximum suppression
comp=zeros(1,3);
for i=1:row
    for j=1:col
        box=outimg(i:i+boxlen-1, j:j+boxlen-1);
        comp(2)=box(cen,cen);
        d=normdir(i,j);
        if d==1
            comp(1)=box(cen,cen-1);
            comp(3)=box(cen,cen+1);
        elseif d==2
            comp(1)=box(cen-1,cen);
            comp(3)=box(cen+1,cen);
        elseif d==4 %여기 왜 3 아니고 4인지 다시 보기
            comp(1)=box(cen-1,cen+1);
            comp(3)=box(cen+1,cen-1);
        else
            comp(1)=box(cen-1,cen-1);
            comp(3)=box(cen+1,cen+1);
        end
        maxV=max(comp);
        if comp(2)<maxV
            outimg(i+cen-1, j+cen-1)=0;
        end
    end
end

outimg=outimg(ex+1:row+ex, ex+1:col+ex);
%maxV=max(outimg(:));
%outimg=outimg/maxV;
    