function energy = feature_extraction(y,fs)
%分帧she
y=double(y);
longx=length(y);

%带通滤波器（60hz-2400hz）
n=50;
wn=[2*60/fs,2*2400/fs];
window=chebwin(n+1,30);
b=fir1(n,wn,window);
x=filter(b,1,y);
%subplot 212,plot(x);title('音频预处理结果示意图');
%axis([-inf,inf, -0.4, 0.4]);

%预加重
%x=double(x);
%x=filter([1 -0.9375], 1, x);
%subplot 312,plot(x);title('音频预处理后的示意图');

win = 500;%45.5ms为一帧；帧长为500
inc = 200;%帧移
f = enframe(x,win,inc);
[fn,len]=size(f);

%find the Max of every frame 
frameMax=zeros(fn+5,1);
num = 1; %frameMax的指标
for row = 1:fn
    for column = 1:len
        if f(row,column) > frameMax(num)
            frameMax(num) = f(row,column);
        end
    end
    num= num + 1;
end


%smooth frameMax
for num = 1:fn
    frameMax(num)=frameMax(num)+frameMax(num+1)+frameMax(num+2)+frameMax(num+3)+frameMax(num+4);
end

%do the difference
diff = zeros(fn,1);
diff(1) = frameMax(1);
diffMax =diff(1);
for num =2:fn
    diff(num) = frameMax(num) - frameMax(num-1);
    if diff(num) > diffMax
        diffMax = diff(num);
    end 
end 
for num =1:fn
    diff(num)=diff(num)/diffMax;
end



%find the endpoint
endpoint = zeros(length(x),1); %端点在原图中的位置
endpoint1 = zeros(length(x),1); %端点在原图中的位置
endpointframe =zeros(fn,1); %端点在帧数中的位置
num = 1;
count = 1;
%distance = 0;
while(num < fn)
    %distance = distance + 1;
    if diff(num) > 0.11 || diff(num) < -0.45
        %if distance >60
            endpoint((num-1)*inc,1) = 0.25;
            endpoint1((num-1)*inc,1) = -0.25;
            endpointframe(num-1) = 1;
            num= num + 125;
            count = count + 1; %计数起始点的数目。
            %distance = 0;
        %end
    end
    num = num + 1;
end

%calculation the localtion of every endpoint in x
endpointlocal = zeros(count,1);
count = 1;
for num = 1:length(x)
    if endpoint(num) == 0.25
        endpointlocal(count) = num; 
        count = count + 1;
    end
    if num == length(x)
        %if num - endpointlocal(t-1) >20000
           endpointlocal(count) = num;
        %end
    end
    
end
plot(x);hold on;plot(endpoint,'b');hold on;plot(endpoint1,'b');title('音频切分');
axis([-inf,inf, -0.4, 0.4]);

CountNum = count - 1; %最后分了多少帧 

%build a new array to storage the every endpoint data
diff1Max = 0;
for num = 2:length(endpointlocal)
    if (endpointlocal(num) - endpointlocal(num-1)) >diff1Max
        diff1Max = (endpointlocal(num) - endpointlocal(num-1));
    end
end
%frameing array
framelength = diff1Max + 1;  %帧的最大实际长度
if mod(framelength,2) == 1   %如果帧长为奇数，将其+1变成偶数方便fft
    framelength =framelength + 1;
end

framearray = zeros(length(endpointlocal)-1,framelength);
row = 1;
column =2;
framearray(row,1) = x(endpointlocal(1));

for num = endpointlocal(1)+1:length(x)
    if endpoint(num) == 0
        framearray(row,column) = x(num);
        column = column + 1;
    else
        row = row + 1;
        column = 1;
        framearray(row,column) = x(num);
        column = column + 1;
    end
end

plot(x);hold on;plot(endpoint);

for num = 1 : CountNum
    every_frame=framearray(num,:);
    st(num,:)=stftms1(every_frame,fs,framelength);
end
%energy = Extraction_parameter1(every_frame,fs,framelength);

%提取参数Extraction parameter
for num = 1 : CountNum
    every_frame=st(num,:);
    %energy(: ,num) = Extraction_parameter1(every_frame,fs,framelength);
    energy (:,num)= Extraction_parameterof70(every_frame,fs,framelength);
end
end
