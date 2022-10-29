%% UPLOAD ONLY THIS FILE
function  [y,t]=step_response(Gs,method)
        
        [num,den] = tfdata(Gs);
        num = cell2mat(num);
        den = cell2mat(den);
        [A,B,C,D] = tf2ss(num,den);
        u = 1;
        h = 0.1;
        n = size(A,1); % order of equation
        tfinal = 3;
        
        %% default
        % default implementation goes here
        y_default = step(Gs,tfinal);
        stepinfo(Gs);
        t_default = linspace(0,3,length(y_default));
        
        %% midpoint
        % midpoint implementation goes here          
        
        t_midpoint = 0:h:tfinal;
        x_midpoint = zeros(n,length(t_midpoint));
        y_midpoint = zeros(n-1,length(t_midpoint));
        x_midpoint(:,1) = 0;

        for i = 1:length(t_midpoint)
            k1_mid = A*x_midpoint(:,i)+ B*u;
            k2_mid = A*(x_midpoint(:,i)+ k1_mid*h*0.5) + B*u;
            x_midpoint(:,i+1) = (x_midpoint(:,i) + k2_mid*h);
            y_midpoint(i) = C*x_midpoint(:,i+1) + D*u; 
        end
        
        %% heun
        % heun implementation goes here
        t_heun = 0:h:tfinal;
        x_heun = zeros(n,length(t_heun));
        y_heun = zeros(n-1,length(t_heun));
        x_heun(:,1) = 0;
        
        for i = 1:length(t_heun)
            k1_heun = A*x_heun(:,i)+ B*u;
            k2_heun = A*(x_heun(:,i) + k1_heun*h) + B*u;
            x_heun(:,i+1) = (x_heun(:,i) + ((k1_heun/2)+(k2_heun/2))*h);
            y_heun(i) = C*x_heun(:,i+1) + D*u;
        end
        
        %% rkutta4
        % rkutta4 implementation goes here
        t_rkutta4 = 0:h:tfinal;
        x_rkutta4 = zeros(n,length(t_rkutta4));
        y_rkutta4 = zeros(n-1,length(t_rkutta4));
        x_rkutta4(:,1) = 0;
        
        for i = 1:length(t_rkutta4)
            k1_rkutta4 = A*x_rkutta4(:,i)+ B*u;
            k2_rkutta4 = A*(x_rkutta4(:,i) + k1_rkutta4*h*0.5) + B*u;
            k3_rkutta4 = A*(x_rkutta4(:,i) + k2_rkutta4*h*0.5) + B*u;
            k4_rkutta4 = A*(x_rkutta4(:,i) + k3_rkutta4*h) + B*u;
            x_rkutta4(:,i+1) = (x_rkutta4(:,i) + ((k1_rkutta4+2*k2_rkutta4+2*k3_rkutta4+k4_rkutta4)*h*(1/6)));
            y_rkutta4(i) = C*x_rkutta4(:,i+1) + D*u;
        end
        
        %% plotting goes here
        
        plot(t_midpoint,y_midpoint,"r","LineWidth",1);
        
        title("combine plots")
        hold on
        
        plot(t_default,y_default,"k","LineWidth",1);
        hold on
        
        plot(t_heun,y_heun,"b","LineWidth",1);
        hold on
        
        plot(t_rkutta4,y_rkutta4,"m","LineWidth",1);
        
        legend(' method=’default’, color=’k’ ',' method=’midpoint’, color=’r’ ',' method=’heun’, color=’b’ ', ' method=’rkutta4’, color=’m’ ');
        

        %% return of the result for given method method
        if method == "default"
            y = y_default;
            t = t_default;
        elseif method == "midpoint"           
            y = y_midpoint;
            t = t_midpoint;
        elseif method == "heun"
            y = y_heun;
            t = t_heun;
        elseif method == "rkutta4"
            y = y_rkutta4;
            t = t_rkutta4;
        end
end

%% Which method performs the best and why?
% response goes here




