kd = 0.1:0.1:100;
arr_1 = 0*kd;
arr_2 = 0*kd;
arr_3 = 0*kd;
arr_4 = 0*kd;

for i = 1:length(kd)

syms x k1 k2

k1 = 0.1; k2 = 0.1;

eqn = (5*(1-x)*(k2 + x))-(x*(k1 + 1-x) *(1+kd(i))) == 0;
sol = solve(eqn, x);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

arr_1(i) = val;
arr_2(i) = 1/kd(i);

syms y k3 k4

k3 = 0.1; k4 = 0.1;

eqn = (10*(1-y)*(k4 + y)* val)-(y *(k3 + 1-y)) == 0;
sol = solve(eqn, y);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

arr_3(i) = val;

arr_4(i) = 1/(1+kd(i));
end


figure()
plot(arr_2,arr_1)
title('Response')
xlabel('Input [1/kd]')
ylabel('Output')
hold on
plot(arr_2,arr_3)
hold on
plot(arr_2,arr_4)
legend('x*','y*','\theta_B')
