function outimg=edgeTracking(inpimg)

[row,col]=size(inpimg);
[sR, sC]=find(inpimg==2); % Strong edge index row/col
[wR, wC]=find(inpimg==1); % Weak edge index row/col


%������ �ڵ� �����ϱ�