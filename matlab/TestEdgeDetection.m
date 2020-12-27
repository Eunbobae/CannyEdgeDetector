clear;
clc;

%img=imread("도로.png");
img=imread("컵.png");
img=double(img(:,:,1));

% step1 : Gaussian filter를 이용한 smoothing
num=2;
out1=gaussianSmoothing(img, num);

% step2 : sobel mask를 이용한 gradients 검출
[out2, dir]=sobelEdge(out1);

result1=[out1/max(out1(:)), out2/max(out2(:))];
figure; imshow(result1);

% step3 : non-maximum suppression
out3=NMS(out2, dir);
figure; imshow(out3/max(out3(:)));

% step4 : double thresholding
thRatio=[0.2,0.5];
[out4, colorout4]=doubleThreshoding(out3, thRatio, 1);
figure; imshow(colorout4);

% step5 : Edge Tracking by Hysteresis