function d=stftms1of1(x,fs,nfft) %x是这一行的数据，,fs是采样频率，nfft是快速傅里叶变换的点数(归一化的短时傅里叶)
max = 0;
[~,xc]=size(x);
length = fix(1024*nfft/fs);
d = zeros(1,length);
win = hanning(xc);
u =win .* x(:);
t = fft(u , nfft);
t = abs(t);
d(1,:) =t(1:length); %取0~1024HZ的fft
for num = 1:length
    if d(1,num) > max
        max = d(1,num);
    end
end
for num = 1:length
     d(1,num) = d(1,num) / max;
end

end
