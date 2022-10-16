%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
n=5;
ans=1;
for i=1:1:n
    
    ans = ans*(i);
end
ans
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
n=n:-1:1;
ans=1;
for i=n
ans=ans*i
end
ans
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
factorial(0)
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
recursiveFactorial(5)
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
num = 1;
den = [2 3 4];
sys = tf(num,den);
step(sys)
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
syms s;
frac = 1/s+1;
[n,d]=numden(frac);
d=sym2poly(d);
n=sym2poly(n);
G=tf(double(n),double(d));
g_step=step(G);
H=feedback(G,1);
h_step = step(H);

%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Gs = tf (1 ,[1 1]);
t =0:0.01:5;
[y , t ]= step ( Gs , t ) ;
[ yc , t ]= step ( feedback ( Gs ,1) ,t ) ;
figure (3) ; clf ; hold on ; grid on ;
%plot (t ,y ,'k','LineWidth',2,'DisplayName','Open loop ') ;
%plot (t , yc ,'b','LineWidth' ,2 ,'DisplayName','Closed loop ') ;
xlabel ('time (sec )') ;
ylabel ('gain ') ;
title ('Step response comparison ')
legend ('show ') ;
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOTE : To run this answer, first uncomment the Answer of the Q7 block
%{
subplot(2,1,1);
plot(t,y);
subplot(2,1,2);
plot(t,yc);
info1=stepinfo(Gs);
ts1=info1.SettlingTime;
info2=stepinfo(feedback(Gs,1));
ts2=info2.SettlingTime;

figure (4) ; clf ;
subplot (2 ,1 ,1) ; cla ; hold on ; grid on ;
plot (t ,y ,'k','LineWidth' ,2 ,'DisplayName','Open loop ') ;
xlabel ('time ( sec)') ;
ylabel ('gain ') ;
title ([ 'open loop ' ' ts=' num2str(ts1)])
subplot (2 ,1 ,2) ; cla ; hold on ; grid on ;
plot (t , yc ,'k','LineWidth' ,2 ,'DisplayName','Closed loop ') ;
xlabel ('time ( sec)') ;
ylabel ('gain ') ;
title ([ 'closed loop ' ' ts=' num2str(ts2)]);
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Answer Q9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (1) ; clf ;
subplot (2 ,1 ,1) ; cla ; hold on ; grid on ;
xlabel ('time (sec )') ; ylabel ('gain ') ; title ('open loop ') ;
subplot (2 ,1 ,2) ; cla ; hold on ; grid on ;
xlabel ('time (sec )') ; ylabel ('gain ') ; title ('closed loop ') ;
for p=1:5
    for t=0.001:0.01:5
        Gs = tf (1 ,[1 p]);
        [y,t] = step(Gs,t);
        [yc,t] = step(feedback(Gs,1),t);
    end
    subplot (2 ,1 ,1) ;
    plot (t ,y ,'LineWidth' ,2 ,'DisplayName' ,['p= ', num2str(p)]) ;
    legend ('show') ;
    subplot (2 ,1 ,2) ;
    plot (t , yc ,'LineWidth' ,2 ,'DisplayName',['p= ', num2str(p)]) ;
    legend ('show') ;
    
end
subplot(2,1,1);
plot(t,y);
subplot(2,1,2);
plot(t,yc);
