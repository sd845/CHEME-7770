using DifferentialEquations

α_x = 3.9*10^-2
α_y = 4.3*10^-3
β_x = 6.1
β_y = 5.7
z_x = 1.3*10^-5
x_y = 7.9*10^-4
y_z = 11*10^-3
x_z = 12*10^-2
n_zx = 2.32
n_xz = 2
n_yz = 2
n_xy = 2

function balances(dudt,u,S,t)
    dudt[1] = (α_x + β_x*S)/(1 + S + (u[3]/z_x)^n_zx) - u[1]
    dudt[2] = (α_y + β_x*S)/(1 + S + (u[1]/x_y) ^n_xy) - u[2]
    dudt[3] = 1/(1 + (u[1]/x_z)^n_xz + (u[2]/y_z)^n_yz) - u[3]
end

u0 = [0.0; 0.0; 0.0]
tspan = (0.0,50.0)
S = [0.02, 10.0, 10^5]

prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
X1 = sol[1,:]
plot(sol[1,:], label="S = 0.02", xaxis = "t", yaxis = "X")

prob = ODEProblem(balances,u0,tspan,S[2])
sol = solve(prob)
X2 = sol[1,:]
plot(sol[1,:], label= "S = 10.0", xaxis = "t", yaxis = "X")

prob = ODEProblem(balances,u0,tspan,S[3])
sol = solve(prob)
X3 = sol[1,:]
plot(sol[1,:], label="S = 10^-5", xaxis = "t", yaxis = "X")
