function y = one_hot(x)
[xr,~] = size(x);
y = zeros(xr,1);
max = 0;
maxnum = 0; 
for k = 1:xr
    if x(k,1) > max
        max = x(k,1);
        maxnum = k;
    end
end
y(maxnum,1) = 1;
end