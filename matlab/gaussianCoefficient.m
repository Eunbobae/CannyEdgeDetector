function [coefficient]=gaussianCoefficient(num)

coefficient=zeros(1,num+1);
for i=0:num
    coefficient(i+1)=nchoosek(num, i); %combination function nCr=n!/(r!*(n-r)!)
end
coefficient=coefficient'*coefficient;
csum=sum(coefficient(:));
coefficient=coefficient./csum;