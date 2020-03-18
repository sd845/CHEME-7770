#= ---------------------------------------------------------------------
metabolites--
asparate #1, ATP #2, citrulline #3, AMP #4,
diphosphate #5, agrininosuccinate #6, fumarate #7,
arginine #8, H2O #9, ornithine #10, urea #11,
carbamoyl-phosphate #12, phosphate #13, NADPH #14, H #15, O2 #16,
Nitric oxide #17, NADP #18

reactions--
v1, v2, v3, v4, v5,
b1- carbomyl-phosphate in, b2- aspartate in, b3- fumarate out,
b4- urea out, b5- ATP out, b6- AMP in, b7- diphosphate in,
b8- water out, b9- phosphate in, b10- NADPH out, b11- H+ out,
b12- O2 out, b13- NO in, b14- NADP+ in, b15- water in

----------------------------------------------------------------------=#

using DelimitedFiles

stoichiometric_matrix = readdlm("./Network.dat")
atom_matrix = readdlm("./Atom.dat")

check_atom_balance = transpose(atom_matrix)*stoichiometric_matrix

nrows, ncols = size(check_atom_balance)
atom_balance_array = zeros(nrows)

for row in collect(1:nrows)
    atom_balance_array[row] = sum((check_atom_balance[row,:]))
end

return atom_balance_array
#if all elements are zero, atoms are balanced
#nitorgen is not balanced here
