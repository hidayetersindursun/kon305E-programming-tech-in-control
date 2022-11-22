clear; clc;
format long

h = 0.1 ;
zeta = 0.01:h:1;
w = 0.01:h:15;

time_value = [];
err = [];

[zeta_m, w_m] = meshgrid(zeta,w);
prod_zeta_w = zeta_m .* w_m;

counter = 1;
for coeff = 1:h:10
    ise = 0;
    
    
    for i=1:150
        for j=1:10
            num = [w_m(i,j)^2];
            den = [1, prod_zeta_w(i,j)*2, w_m(i,j)^2];
            Gs = tf(num, den);
            SI = stepinfo(Gs);
            time_value(i,j) = SI.SettlingTime;
            time_calc = coeff / prod_zeta_w(i,j);
            
            ise = double(ise+abs(time_calc-time_value(i,j))^2);                
        end
    end
    
    err(counter) = ise;
    counter = counter+1;
end
coeff = 1:h:10;


min_err = err(1);
for i = 2:length(err)
    if err(i) < min_err
        min_err = err(i);
        index = i;
    end
end
best_coeff = coeff(index)