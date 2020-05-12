using DifferentialEquations
#S in the range of 10^3 to 10^5
α_x = 1.5
α_y = 0.31
β_x = 7.17
β_y = 14.9
z_x = 1.75*10^-3
x_y = 2.0*10^-3
y_z = 0.13
x_z = 0.19

n_zx = 2.0
n_xz = 2.0
n_yz = 2.0
n_xy = 2.0

δ_y = 1.0
δ_z = 1.0

# S, near but below the Hopf bifurcation point

S = 80

u0 = [0.0; 0.0; 0.0]
prob = ODEProblem(balances,u0,tspan,S[1])
ssol = solve(prob)

S = 100

u0 = [ssol[1,end]; ssol[2,end]; ssol[3,end]]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z1 = sol[3,:]
plot(sol[3,:], label = "Cell 1")

u0 = [ssol[1,end]*1.25;  ssol[2,end]*1.25; ssol[3,end]*1.25]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z2 = sol[3,:]
plot!(sol[3,:], label = "Cell 2")

u0 = [ssol[1,end]*0.75; ssol[2,end]*0.75; ssol[3,end]*0.75]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z3 = sol[3,:]
plot!(sol[3,:], label = "Cell 3", xaxis = "t", yaxis = "Z")

# S near but above the saddle node bifurcation

function balances(dudt,u,S,t)
    dudt[1] = (α_x + β_x*S)/(1 + S + (u[3]/z_x)^n_zx) - u[1]
    dudt[2] = (α_y + β_x*S)/(1 + S + (u[1]/x_y) ^n_xy) - δ_y*u[2]
    dudt[3] = 1/(1 + (u[1]/x_z)^n_xz + (u[2]/y_z)^n_yz) - δ_z*u[3]
end

tspan = (0.0,1000.0)
S = 2000

u0 = [0.0; 0.0; 0.0]
prob = ODEProblem(balances,u0,tspan,S[1])
ssol = solve(prob)

S = 100

u0 = [ssol[1,end]; ssol[2,end]; ssol[3,end]]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z1 = sol[3,:]
plot(sol[3,:], label = "Cell 1")

u0 = [ssol[1,end]*1.25;  ssol[2,end]*1.25; ssol[3,end]*1.25]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z2 = sol[3,:]
plot!(sol[3,:], label = "Cell 2")

u0 = [ssol[1,end]*0.75; ssol[2,end]*0.75; ssol[3,end]*0.75]
prob = ODEProblem(balances,u0,tspan,S[1])
sol = solve(prob)
Z3 = sol[3,:]
plot!(sol[3,:], label = "Cell 3", xaxis = "t", yaxis = "Z")
