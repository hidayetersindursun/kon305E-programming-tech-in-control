function y = recursiveFactorial(n)
    if n <=1 && n>=0
        y=1;
    else
        y=n*recursiveFactorial(n-1);
    end
end
