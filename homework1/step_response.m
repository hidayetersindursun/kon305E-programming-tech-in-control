%% UPLOAD ONLY THIS FILE
function  [y,t]=step_response(Gs,method)
        [num,den] = tfdata(Gs)
        num = cell2mat(num);
        den = cell2mat(den);

        [A,B,C,D] = tf2ss(num,den)
        
        %% default
        % default implementation goes here
        if method == "default"
            step(Gs);
        %% midpoint
        % midpoint implementation goes here
        elseif method == "midpoint"
                
        %% heun
        % heun implementation goes here
        elseif method == "heun"
        %% rkutta4
        % rkutta4 implementation goes here
        elseif method == "rkutta4"
        % plotting goes here
        else
            
        end

        % return of the result for given method method
end

%% Which method performs the best and why?
% response goes here