#### About
Flux Balance Analysis (FBA) for the Urea Cycle

#### Requirements
Julia v1.2 or higher must be installed to run this code. 

In addition, the following packages are required: `DifferentialEquations.jl`, `DiffEqSensitivity.jl`, `NumericalIntegration.jl`, `DelimitedFiles.jl`, `DataFrames.jl`, `LinearAlgebra.jl`, `PyPlot.jl`.

#### Running the model

To run the model on your local machine, you can download this repository as a zip file, clone or pull it by using the command (using command line)
```
$ git pull https://github.com/sd845/CHEME-7770/master/PS3.git
```
or
```
$ git clone https://github.com/sd845/CHEME-7770/master/PS3.git
```
Start Julia and navigate to your working directory. Then run the command (using Julia REPL) 
```
include("Solve.jl")
```
