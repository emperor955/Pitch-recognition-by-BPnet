function [W1,W2,E] = MultiClass2(W1,W2,X,D,B1,B2,epoch) %w1是sigmoid的系数,w2是softmax的系数,x训练样本,d训练样本标签,epoch轮数,B1是sigmoid阈值,B2是softmax阈值
alpha = 0.9 * (1/epoch); %梯度下降系数
N = 245 %训练样本数
dw1 = zeros(100,36);%sigmoid的阈值
dw2 = zeros(36,100);%softmax的阈值
db1 = zeros(100,1);
db2 = zeros(36,1);
count = 0 ;
E = 0;
for k = 1 : N
    x = X(:,k);
    d = D(:,k);
   
    v1 = (W1 * x) + B1;
    y1 = Sigmoid(v1);
    v  = (W2 * y1) + B2;
    f  = Softmax(v);
    y  = one_hot(f); 
    
    
    count = count + 1;
    
    e = d - y; %输出误差
    E = E + sum(abs(e));
    delta = e; %softmax激活函数的δ=φ'(v) * e
    e1 = W2' * delta; %sigmoid函数的输出误差
    delta1 = y1 .* (1 - y1) .* e1;%sigmoid函数的δ
    
    
    dw1 = dw1 + alpha * delta1 * x';
    dw2 = dw2 + alpha * delta * y1';
    
    db1 = db1 + alpha .* delta1;
    db2 = db2 + alpha .* delta;
    
    
    if count == 35
        dw1 = dw1 ./ count;
        dw2 = dw2 ./ count;
        db1 = db1 ./ count;
        db2 = db2 ./ count;
        
        W1 = W1 + dw1;
        W2 = W2 + dw2;
        B1 = B1 + db1;
        B2 = B2 + db2;
        
        dw1 = zeros(100,36);
        dw2 = zeros(36,100);
        db1 = zeros(100,1);
        db2 = zeros(36,1);
        count = 0;
    end
end
end