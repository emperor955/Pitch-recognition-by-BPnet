function f = enframe1(x,win,inc)

nx = length(x(:));
nwin = length(win);
if(nwin == 1)
    len = win;
else
    len = nwin;
end
if(nargin < 3)
    inc = len;
end
fn = ceil((nx-len+inc)/inc); %È¡Ö¡Êý
f = zeros(fn,len);
indf = inc * (0:(fn-1)).';
inds = (1:len);
f(:) = x(indf(:,ones(1,len))+inds(ones(fn,1),:));
if(nwin > 1)
    w = win(:)';
    f = f .* w(ones(fn,1),:);
end

