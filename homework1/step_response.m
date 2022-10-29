%% UPLOAD ONLY THIS FILE
function  [y,t]=step_response(Gs,method)
        [num,den] = tfdata(Gs);
        num = cell2mat(num);
        den = cell2mat(den);
        [A,B,C,D] = tf2ss(num,den);
        t_midpoint = 0:0.1:3;
        
        % default
        % default implementation goes here
        %if method == "default"
            y_default = step(Gs,3);
            stepinfo(Gs);
        
        %% midpoint
        % midpoint implementation goes here
        %elseif method == "midpoint"           
            u = 1;
            h = 0.1;
            t_midpoint = 0:0.1:3;
            t = t_midpoint;
            n = 2; % order of equation
            x = zeros(n,length(t_midpoint));
            y_midpoint = zeros(n-1,length(t_midpoint));
            x(:,1) = 0;
            
            for i = 1:length(t_midpoint)
                k1 = A*x(:,i)+ B*u;
                k2 = A*(x(:,i)+ k1*h*0.5) + B*u;
                x(:,i+1) = (x(:,i) + k2*h);
                y_midpoint(i) = C*x(:,i+1) + D*u; 
            end

        %% heun
        % heun implementation goes here
        %elseif method == "heun"
        %% rkutta4
        % rkutta4 implementation goes here
        %elseif method == "rkutta4"
        % plotting goes here
        %else
            
        %end
        x = 0:0.1:3;
        x1 = linspace(0,3,length(y_default))
  
        plot(x,y_midpoint);
        title("combine plots")
        hold on
        plot(x1,y_default);
        % return of the result for given method method
end

%% Which method performs the best and why?
% response goes here




