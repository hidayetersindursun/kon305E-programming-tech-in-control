function y = factorial(n)
if n <=1 && n>=0
    y=1;
elseif n<0
    y=nan;
else
    f=1;
    vect=1:n;
    for i=vect
        f=f*i;
        y=f;
    end
end

end