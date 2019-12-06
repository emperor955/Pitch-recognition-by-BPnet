clear all
rng(3);
practice = xlsread('practice.xlsx','Sheet2');
practice_label = xlsread('practice_label.xlsx','Sheet3');

W1 = 2 * rand(150,70) - 1;
W2 = 2 * rand(36,150) - 1;
B1 = 2 * rand(150,1) - 1;
B2 = 2 * rand(36,1) - 1;
E = 100;
epoch = 1;

while(E >0.01 )
   [W1,W2,B1,B2,E] = MultiClass1(W1,W2,practice,practice_label,B1,B2,epoch); 
   epoch  = epoch + 1;
end
xlswrite('Weight and Threshold1.xlsx',W1,1);
xlswrite('Weight and Threshold1.xlsx',W2,2);
xlswrite('Weight and Threshold1.xlsx',B1,3);
xlswrite('Weight and Threshold1.xlsx',B2,4);

