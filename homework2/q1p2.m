clear; clc;
format long;

h = 0.1 ;
zeta = 0.01:h:1;
w = 0.01:h:15;
time_value = [];

[zeta_m, w_m] = meshgrid(zeta,w);
prod_zeta_w = zeta_m .* w_m;

for i = 1:150
    for j = 1:10
        num = [w_m(i,j)^2];
        den = [1, prod_zeta_w(i,j)*2, w_m(i,j)^2];
        Gs = tf(num, den);
        time_value(i, j) = stepinfo(Gs).SettlingTime;
    end
end
prod_zeta_w = reshape(prod_zeta_w, [1500, 1]);
time_value = reshape(time_value, [1500, 1]);
fitModel = fit(1./prod_zeta_w, time_value, 'poly1');
plot(fitModel);

