%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

x = false;
if x 
    disp('True');
end
if ~x
    disp('False');
end

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

x =23;
while x >=20
    disp ('Greater than or equal to 20 ')
    break
end
while ~(x >=20)
    disp ('Less than 20 ') 
    break
end

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

coin ='YY ';

if coin (1) == 'Y'
    if coin (2) == 'Y'
        disp ('tail tail ') ;
    end
    if coin (2) == 'T'
        disp ('tail head ') ;
    end
end
if coin (1) == 'T'
    if coin (2) == 'Y'
        disp ('head tail ') ;
    end
    if coin (2) == 'T'
        disp ('head head ') ;
    end
end

% And the other version is given below.
if coin (1) == 'Y' && coin (2) == 'Y'
    disp ('tail tail ') ;
end
if coin (1) == 'Y' && coin (2) == 'T'
    disp ('tail head ') ;
end
if coin (1) == 'T' && coin (2) == 'Y'
    disp ('head tail ') ;
end
if coin (1) == 'T' && coin (2) == 'T'
    disp ('head head ');
end

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

x = 1;
while x<=4
    disp([num2str(x) '. student'])
    x = x + 1;
end

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

t = 0:0.01:4*pi;
x = zeros(1,length(t));   % natural signal
xr = zeros(1,length(t));   % rectified signal

for i = 1 : length(t)
    x(i) = sin(t(i));
    if x(i) < 0
        xr(i) = -x(i);
    else
        xr(i) = x(i);
    end
end

figure(1);

subplot(2,1,1);cla;hold on;grid on;
plot(t,x,'LineWidth',2);
xlabel('time (sec)');
ylabel('gain');

subplot(2,1,2);cla;hold on;grid on;
plot(t,xr,'LineWidth',2);
xlabel('time (sec)');
ylabel('gain');

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

t = 0:0.01:4*pi;
x = zeros(1,length(t));   % natural signal
sum = 0;
for i=1:length(t)
    sum = sum+x(i)^2;
end
sum = sqrt(sum/length(x));

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

t = 0:0.01:4*pi;
x = zeros(1,length(t));

for i = 1:length(t)
    
    x(i) = sin(t(i));
    
end
max(x)

%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
clear;clc;
t = 0:0.01:4*pi;
figure(1);clf;hold on;grid on;
plotSine(t,2,3);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
t=0:0.01:4*pi;
x=sin(t);
xder=numericDerivative(t,x);
figure(1);clf;hold on;grid on;
plot(t,x,'k','LineWidth',2);
plot(t,xder,'r','LineWidth',2);
%}





