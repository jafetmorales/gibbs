clear all;
close all;
clc;

origSignalPath='C:\Users\nnf001\Desktop\SSP\FinalProject\house.tif';
img=imread(origSignalPath);
img=im2bw(img);

img=double(img);
lambda=sum(uint8(img(:)))/length(img(:));
img(img==0)=double(80);
img(img==1)=double(170);
figure(1);imshow(img,[0 255]);

originalSignalPath='C:\Users\nnf001\Desktop\SSP\FinalProject\house_original.tif';
imwrite(uint8(img),originalSignalPath,'tif','Compression','none');

img=img+30*randn(size(img));
figure(2);imshow(img,[0 255]);
figure(3);hist(img(:));

noisySignalPath='C:\Users\nnf001\Desktop\SSP\FinalProject\house_noisy.tif';
imwrite(uint8(img),noisySignalPath,'tif','Compression','none');


% GATHER A FEW SAMPLES FOR THE MH AND GIBBS SAMPLING
index=unidrnd(length(img(:)),50,1);
y=img(index);
figure(3);hist(y,50);


% mu1=-2;
% mu2=2;
% lambda=.7;
% sig1=1;
% sig2=1;
% % CHOSE TO USE A NORMAL DISTRIBUTION FOR THE JUMPING PDF
% y(1)=0;
% for t=2:500
%     y_star=5*randn(1,1);%has a 5 because it must be wide enough
%     alpha=mixtureLikelihood(y_star,mu1,mu2,lambda,sig1,sig2)/mixtureLikelihood(y(end),mu1,mu2,lambda,sig1,sig2)
%     if(alpha>=1)
%         y(length(y)+1)=y_star;
%     else
%         u=rand(1,1);
%         if(u<alpha)
%             y(length(y)+1)=y_star;
%         end
%     end
% end
% figure(2);hist(y,50)

savePath='C:\Users\nnf001\Desktop\SSP\FinalProject\yData.mat';
save(savePath,'y');