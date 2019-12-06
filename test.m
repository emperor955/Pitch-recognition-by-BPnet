%基于端点检测的切分
clear;
%分帧she
[y,fs] = audioread('D:\workplace\bishe\录音\H1.m4a');%读取音频
subplot 211,plot(y);title('音频原图');

y=double(y);
longx=length(y);

%带通滤波器（60hz-2400hz）
n=50;
wn=[2*60/fs,2*2400/fs];
window=chebwin(n+1,30);
b=fir1(n,wn,window);
x=filter(b,1,y);
x = x/max(abs(x));
duandian = zeros(length(x),1);

%预加重
%x=double(x);
%x=filter([1 -0.9375], 1, x);
%subplot 312,plot(x);title('音频预处理后的示意图');

win = 500;%45.5ms为一帧；帧长为500
inc = 200;%帧移
f = enframe(x,win,inc);
[fn,len]=size(f);
amp =sum((abs(enframe(x,win,inc))).^2,2);
for i = 40:length(amp)-40
    if amp(i)-amp(i-39)>30
        duandian(i*inc,1)=1;
        i = i+20;
        
    end
end


subplot 311,plot(x);
subplot 312,plot(amp);
subplot 313,plot(x);hold on ;plot(duandian);

