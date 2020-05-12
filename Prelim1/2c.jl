using DifferentialEquations

α_x = 1.5
β_x = 5.0
z_x = 0.4
n_zx = 2.7
n_xz = 2.7
delta_z = 1.0
x_z = 1.5

function balances(dudt,u,S,t)
    dudt[1] = (α_x + β_x*S)/(1 + S + (u[2]/z_x)^n_zx) - u[1]
    dudt[2] = 1/(1 + (u[1]/x_z)^n_xz) - delta_z*u[2]
end

u0 = [0.0; 0.0]
tspan = (0.0,100.0)
S = range(0.001, stop = 100, length = 500)
X = zeros(length(S))
Z = zeros(length(S))

for i in 1:length(S)
    prob = ODEProblem(balances,u0,tspan,S[i])
    sol = solve(prob)
    X[i] = sol[1,end]
    Z[i] = sol[2,end]
end


plot(S,X)
plot(S,X, xaxis = ("S", :log), yaxis = ("Gene Expression", :log), color = "black")
#plot(sol,label=["X" "Z"])
#S = range(1, stop = 100, length = 10)

#for i = 1:length(S)
#    prob_ss = SteadyStateProblem(balances,u0,S[i])
##    sol_ss = solve(prob_ss)
#    ss = Array(sol_ss)
#    X[i] = ss[1]
#    Z[i] = ss[2]
#end

#steadystate_prob = SteadyStateProblem(balances, u0)
#steadystate_sol = solve(steadystate_prob)
