#### About
A simple Flux Balance Analysis (FBA) solution for the Urea Cycle.

#### Requirements
Julia v1.2 or higher must be installed to run this code. In addition, the packages `DelimitedFiles.jl` and `GLPK.jl` are required.

#### Running the model
To run the model on your local machine, you can download this repository as a zip file, clone or pull it by using the command (using command line)
```
$ git pull https://github.com/sd845/CHEME-7770.git
```
or
```
$ git clone https://github.com/sd845/CHEME-7770.git
```
Start Julia and navigate to the `PS3` folder. Then run the command (using Julia REPL) 
```
include("Solve.jl")
```
