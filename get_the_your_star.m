function y = get_the_your_star(x,fs,framelength)
[xc,xr] = size(x);
y =zeros(1,xc);
max= 0; 
local= 0;
for num = 1 : xc
    for k = 1 : xr
        if x(num,k) > max
            max = x(num,k);
            local = k;
        end
    end
    y(1,num) = local * fs / framelength;
    max = 0;
    local = 0;
end
end
            


            
        