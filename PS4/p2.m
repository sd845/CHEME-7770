i_1_array = 0.001:10:100;
i_2_array = 0.001:10:100;

number_of_simulation_points = length(i_1_array);

A_conc = zeros(length(i_1_array),length(i_2_array));

for j = 1:number_of_simulation_points
    for k = 1:number_of_simulation_points

        syms A I_1 I_2

        I_1 = i_1_array(j);
        I_2 = i_2_array(k);

        eqn = A * (1 + 25/((1+I_1)*(5+A) - 5*A) + 25/((1+I_2)*(5+A)-5*A)) == 100;
        sol = solve(eqn,A);
        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

        A_conc(j,k) = val;

    end
end

figure()
contour3(log(i_1_array),log(i_2_array),A_conc,200)
title('Response for K = 5')
xlabel('Inhibitor 1')
ylabel('Inhibitor 2')
zlabel('[A]')
