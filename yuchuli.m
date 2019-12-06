function [x] = yuchuli(y,fs)
y=double(y);
longx=length(y);


%´øÍ¨ÂË²¨Æ÷£¨60hz-2400hz£©
n=50;
wn=[2*60/fs,2*2400/fs];
window=chebwin(n+1,30);
b=fir1(n,wn,window);
x=filter(b,1,y);
end

