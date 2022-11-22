clear; clc;
format long;

h = 0.1 ;
zeta = 0.01:h:1;
w = 0.01:h:15;
time_value = [];

[zeta_mesh, w_mesh] = meshgrid(zeta,w);
prod_zeta_w_mesh = zeta_mesh .* w_mesh;

for i = 1:150
    for j = 1:10
        num = [w_mesh(i,j)^2];
        den = [1, prod_zeta_w_mesh(i,j)*2, w_mesh(i,j)^2];
        Gs = tf(num, den);
        time_value(i, j) = stepinfo(Gs).RiseTime;
    end
end
new = time_value .* w_mesh;
zeta_mesh = reshape(zeta_mesh, [1500, 1]);
new = reshape(new, [1500, 1]);
fitModel = fit(zeta_mesh, new, 'poly1');
plot(fitModel);
