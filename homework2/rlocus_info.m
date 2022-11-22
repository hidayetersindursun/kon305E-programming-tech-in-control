%% UPLOAD ONLY THIS FILE
function  info=rlocus_info(Gs)
        % convert Gs into a symbolic expression

        [num, den] = tfdata(Gs);
        syms s k1 w1;
        assume([k1 w1], "real");
        
        den_symb = poly2sym(cell2mat(den), s);
        num_symb = poly2sym(cell2mat(num), s);
        
        Gs_symb = num_symb/den_symb;

        % calculate real axis breaking points
        bpoints= [];
        
        diff_num_sym = diff(num_symb, s);
        diff_den_sym = diff(den_symb, s);
        equation = (num_symb * diff_den_sym) - (diff_num_sym * den_symb);
        
        all_Bpoints = double(solve(equation, s));
        b_count = 1;
        
        for i = 1:length(all_Bpoints)
            
            if isreal(all_Bpoints(i))
                
                bpoints(b_count) = all_Bpoints(i);
                b_count = b_count + 1;
                
            end
        end 

        % calculate jw-crossings

        k=[];
        w=[];
        pcs = 1+(k1*Gs_symb);
        pjw = subs(pcs,s,1j*w1);
        w = double(solve(imag(pjw)==0, w1));
        k = solve(subs(real(pjw),w1,w)==0,k1);

        info=struct("bpoints",bpoints,"k",k,"w",w); %% DO NOT CHANGE THIS struct and the variable names
end