function [p]=mixturePosterior(y,mu1,mu2,lambda,sig1,sig2,mup1,mup2,sigp1,sigp2)

prior=1/(2*pi*sigp1*sigp2)*exp(-1/2*(1/sigp1^2*(mu1-mup1)^2+1/sigp2^2*(mu2-mup2)^2));
if(lambda>0&&lambda<1)
    t1=lambda/(sqrt(2*pi)*sig1)*exp(-(y-mu1).^2/(2*sig1^2));
    t2=(1-lambda)/(sqrt(2*pi)*sig2)*exp(-(y-mu2).^2/(2*sig2^2));
%     t1(1000)
%     t2(1000)
    p=prior*prod(t1+t2);
%     disp('inside');
else
    p=0;
end;


% p