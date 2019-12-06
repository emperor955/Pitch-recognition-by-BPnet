function [W1,W2,B1,B2] = get_weight_and_threshold(x)
W1 = xlsread('Weight and Threshold1.xlsx',1);
W2 = xlsread('Weight and Threshold1.xlsx',2);
B1 = xlsread('Weight and Threshold1.xlsx',3);
B2 = xlsread('Weight and Threshold1.xlsx',4);
end
