syms x k1 k2

k1 = 0.1; k2 = 0.1;

kd_i = 1/0.1;
kd_f = 1/0.15;

th_i = 1/(1+kd_i);
th_f = 1/(1+kd_f);

th_c = (th_f - th_i) * 100 /(th_i);
%disp(th_c)

eqn = (5*(1-x)*(k2 + x))-(x*(k1 + 1-x) *(1+kd_i)) == 0;
sol = solve(eqn, x);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

x_i = val;

syms x
eqn = (5*(1-x)*(k2 + x))-(x*(k1 + 1-x) *(1+kd_f)) == 0;
sol = solve(eqn, x);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end
x_f = val;

x_c = (x_f - x_i) * 100 /(x_i);
%disp(x_c)

syms y k3 k4

k3 = 0.1; k4 = 0.1;

eqn = (10*(1-y)*(k4 + y)* x_i)-(y *(k3 + 1-y)) == 0;
sol = solve(eqn, y);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

y_i = val;

syms y
eqn = (10*(1-y)*(k4 + y)* x_f)-(y *(k3 + 1-y)) == 0;
sol = solve(eqn, y);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

y_f = val;

y_c = (y_f - y_i) * 100 /(y_i);
%disp(y_c)

fprintf('For k = 0.1 \n')
fprintf('Percentage change in theta_B = %f \n', th_c)
fprintf('Percentage change in x* = %f \n', x_c)
fprintf('Percentage change in y* = %f \n', y_c)


syms x k1 k2

k1 = 10; k2 = 10;

kd_i = 1/0.1;
kd_f = 1/0.15;

th_i = 1/(1+kd_i);
th_f = 1/(1+kd_f);

th_c = (th_f - th_i) * 100 /(th_i);
%disp(th_c)

eqn = (5*(1-x)*(k2 + x))-(x*(k1 + 1-x) *(1+kd_i)) == 0;
sol = solve(eqn, x);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

x_i = val;

syms x
eqn = (5*(1-x)*(k2 + x))-(x*(k1 + 1-x) *(1+kd_f)) == 0;
sol = solve(eqn, x);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end
x_f = val;

x_c = (x_f - x_i) * 100 /(x_i);
%disp(x_c)

syms y k3 k4

k3 = 10; k4 = 10;

eqn = (10*(1-y)*(k4 + y)* x_i)-(y *(k3 + 1-y)) == 0;
sol = solve(eqn, y);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

y_i = val;

syms y k3 k4

k3 = 10; k4 = 10;

eqn = (10*(1-y)*(k4 + y)* x_f)-(y *(k3 + 1-y)) == 0;
sol = solve(eqn, y);

        sol = double(sol);
        sol = sol(sol >= 0);
        [r,c] = (size(sol));
        if(r > 1)
            val = min(sol);
        else
            val = sol;
        end

y_f = val;

y_c = (y_f - y_i) * 100 /(y_i);
%disp(y_c)

fprintf('\nFor k = 10 \n')
fprintf('Percentage change in theta_B = %f \n', th_c)
fprintf('Percentage change in x* = %f \n', x_c)
fprintf('Percentage change in y* = %f \n', y_c)
