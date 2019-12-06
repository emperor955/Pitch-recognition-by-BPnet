function [y,scores] = get_scores(x)
[xr,~] = size(x);
scores = zeros(1,xr);

num1 = 0;
num2 = 0;
num3 = 0;
for i = 1 : xr
    if x(i,1) > 5
        scores(1,i) = 0;
    end
    if x(i,1) == 5
        scores(1,i) = 60;
    end
    if x(i,1) < 5
        scores(1,i) = 100 - 8 * x(i,1) ;
    end
end
for i = 1 : xr
    if scores(1,i) >= 90
        num1 = num1+1;
    end
    if scores(1,i) >= 80
        num2 = num2+1;
    end
    if scores(1,i) >= 60
        num3 = num3+1;
    end
end
if (xr-num3)/xr > 0.4
    y = 4;
end
if num3/xr >= 0.6
    y = 3;
end
if num2/xr >= 0.7
    y = 2;
end
if num1/xr >= 0.9
    y = 1;
end
end
