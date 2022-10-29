%% DO NOT UPLOAD THIS FILE
clear;clc;

Gs=tf(1,[1 2*0.2*10 10^2]);

[y,t]=step_response(Gs,'rkutta4');
