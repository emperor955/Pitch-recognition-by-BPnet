function d=stftms1of1(x,fs,nfft) %x����һ�е����ݣ�,fs�ǲ���Ƶ�ʣ�nfft�ǿ��ٸ���Ҷ�任�ĵ���(��һ���Ķ�ʱ����Ҷ)
max = 0;
[~,xc]=size(x);
length = fix(1024*nfft/fs);
d = zeros(1,length);
win = hanning(xc);
u =win .* x(:);
t = fft(u , nfft);
t = abs(t);
d(1,:) =t(1:length); %ȡ0~1024HZ��fft
for num = 1:length
    if d(1,num) > max
        max = d(1,num);
    end
end
for num = 1:length
     d(1,num) = d(1,num) / max;
end

end
