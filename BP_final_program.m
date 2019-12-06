clear;
[x,fs] = audioread('D:\workplace\bishe\the-star.5.mp3');%��ȡ��Ƶ 
energy = feature_extraction(x,fs);  %��ȡ����ֵ
[W1,W2,B1,B2] = get_weight_and_threshold(1); %��ȡѵ����ɵ�Ȩֵ����ֵ
[er,ec] = size(energy);
The_result = zeros(36,ec);
The_resultofstandar = zeros(1,ec);
for num = 1 : ec 
    The_process = energy(:,num);
    v1 = (W1 * The_process) + B1;
    y1 = Sigmoid(v1);
    v  = (W2 * y1) + B2;
    f  = Softmax(v);
    The_result(:,num) = one_hot(f);
end
for num = 1 : ec
    for i = 1 : 36
        if The_result(i,num) == 1
            The_resultofstandar(1,num)=i;
        end
    end
end
            
    
    


