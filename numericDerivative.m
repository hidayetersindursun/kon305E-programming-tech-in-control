function xder = numericDerivative(t,x)
xder = zeros(size(t));
T = t(2)-t(1);
    for i=1:length(t)-1
        xder(i) = (x(i+1)-x(i))/T;
    end
    xder(length(t)) = xder(length(t)-1);
end 