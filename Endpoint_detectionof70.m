%���ڶ˵�����з�
clear;
%��֡she
[y,fs] = audioread('D:\workplace\bishe\yinjie39.mp3');%��ȡ��Ƶ
subplot 211,plot(y);title('��Ƶԭͼ');

y=double(y);
longx=length(y);

%��ͨ�˲�����60hz-2400hz��
n=50;
wn=[2*60/fs,2*2400/fs];
window=chebwin(n+1,30);
b=fir1(n,wn,window);
x=filter(b,1,y);
%subplot 212,plot(x);title('��ƵԤ������ʾ��ͼ');
%axis([-inf,inf, -0.4, 0.4]);

%Ԥ����
%x=double(x);
%x=filter([1 -0.9375], 1, x);
%subplot 312,plot(x);title('��ƵԤ������ʾ��ͼ');

win = 500;%45.5msΪһ֡��֡��Ϊ500
inc = 200;%֡��
f = enframe(x,win,inc);
[fn,len]=size(f);

%find the Max of every frame 
frameMax=zeros(fn+5,1);
num = 1; %frameMax��ָ��
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
endpoint = zeros(length(x),1); %�˵���ԭͼ�е�λ��
endpoint1 = zeros(length(x),1); %�˵���ԭͼ�е�λ��
endpointframe =zeros(fn,1); %�˵���֡���е�λ��
num = 1;
count = 1;
distance = 0;
while(num < fn)
    %distance = distance + 1;
    if diff(num) > 0.11 || diff(num) < -0.45
        %if distance >60
            endpoint((num-1)*inc,1) = 0.25;
            endpoint1((num-1)*inc,1) = -0.25;
            endpointframe(num-1) = 1;
            num= num + 125;
            count = count + 1; %������ʼ�����Ŀ��
            distance = 0;
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
CountNum = count - 1; %�����˶���֡ 

%build a new array to storage the every endpoint data
diff1Max = 0;
for num = 2:length(endpointlocal)
    if (endpointlocal(num) - endpointlocal(num-1)) >diff1Max
        diff1Max = (endpointlocal(num) - endpointlocal(num-1));
    end
end
%frameing array
framelength = diff1Max + 1;  %֡�����ʵ�ʳ���
if mod(framelength,2) == 1   %���֡��Ϊ����������+1���ż������fft
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
%plot(diff);hold on ;plot(endpointframe);

subplot 211;plot(x);hold on;plot(endpoint,'b');
subplot 212;plot(framearray(2,:));

%�������Ϊֹ��������ڶ˵���ķ�֡


%��ÿһ֡���и���Ҷ�任�õ�st����ÿһ����ÿһ֡�ĸ���Ҷ�任    

for num = 1 : CountNum
    every_frame=framearray(num,:);
    st(num,:)=stftms1(every_frame,fs,framelength);
end
%energy = Extraction_parameter1(every_frame,fs,framelength);

%��ȡ����Extraction parameter
for num = 1 : CountNum
    every_frame=st(num,:);
    %energy(: ,num) = Extraction_parameter1(every_frame,fs,framelength);
    energy (:,num)= Extraction_parameterof70(every_frame,fs,framelength);
end
canshu = zeros(CountNum,1);
for num = 1 : CountNum
    for i = 1:70
        if energy (i,num) == 1
            canshu(num,1) = i;
        end
    end
end



%��ȡ��׼�Ķ�����Ϊѵ������

[r , c] = size(energy);
practice = zeros(70,1);
practice_label = zeros(70,1);
y = 1;
for num = 1:c
    switch canshu(num)
        case 28
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
        case 0
            practice(:,y) = energy(:,num);
            y = y + 1;
    end
end
            
    

% for num = 1 : c
%     if num == 1
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 2
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 4
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 6
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 7
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 8
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 9
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 10
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 11
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 12
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 13
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 14
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 16
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 18
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 19
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 20
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 21
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 22
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 23
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 27
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 28
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 29
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 30
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 31
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 32
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 35
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 37
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 39
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 40
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 41
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 42
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     if num == 0
%         practice(:,y) = energy(:,num);
%         y = y + 1;
%     end
%     
%     
% end

for num = 1 : (y-1)
    for  k = 1 : 70
        if practice(k,num)==1
            practice_label(k ,num) = 1;
        end
    end
end

xlswrite('practice.xlsx',practice,2,'ID');
xlswrite('practice_label.xlsx',practice_label,2,'ID');