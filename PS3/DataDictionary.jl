using DelimitedFiles

function build_data_dictionary()

        data_dictionary = Dict{AbstractString,Any}()

        stoichiometric_matrix = readdlm("Network.dat")
        data_dictionary["stoichiometric_matrix"] = stoichiometric_matrix

        kcat_v1 = 203*3600; #unit- 1/hr
        kcat_v2 = 34.5*3600;
        kcat_v3 = 249*3600;
        kcat_v4 = 88.1*3600;
        kcat_v5 = 13.7*3600;

        E = 0.01*10^-3; #unit- mm/gDW

        v1_max = kcat_v1*E*(4.67E-3/(4.67E-3 + 3.92E-4))*(1.49E-2/(1.49E-2 + 1.54E-4));
        v2_max = kcat_v2*E*1;
        v3_max = kcat_v3*E*2.55E-4/(1.55E-3 + 2.55E-4);
        v4_max = kcat_v4*E*1.01E-5/(1.01E-5 + 8.50E-4); #data not found in Park et al. for homo sapiens
        v5_max = kcat_v5*E*2.55E-4/(3.50E-06 + 2.55E-4);

        flux_bounds_array = [

                                0   v1_max; #v1 aspatate + ATP + citrulline -> AMP + diphosphate + argininosuccinate
                                0   v2_max; #v2 argininosuccinate -> fumarate + arginine
                                0   v3_max; #v3 arginine + water -> ornithine + urea
                                0   v4_max; #v4 carbamoyl-phosphate + ornithine -> phosphate + citrulline
                          -v5_max   v5_max; #v5 2arginine + 3NADPH + 3H+ + 4O2 <-> 2citrulline + 2nitric oxide + 3NADP + 4water
                                0   10; #b1 [] -> carbomyl-phosphate
                                0   10; #b2 []-> aspartate
                                0   10; #b3 fumarate -> []
                                0   10; #b4 urea -> []
                                0   10; #b5 [] -> ATP
                                0   10; #b6 AMP -> []
                                0   10; #b7 diphosphate -> []
                                0   10; #b8 [] -> water
                                0   10; #b9 phosphate -> []
                                0   10; #b10 [] -> NADPH
                                0   10; #b11 [] -> H+
                                0   10; #b12 [] -> O2
                                0   10; #b13 nitric oxide -> []
                                0   10; #b14 NADP+ -> []
                                0   10; #b15 H2O -> []

                                ]

        data_dictionary["flux_bounds_array"] = flux_bounds_array

        species_bounds_array = [

                                0   0; #1-  aspartate
                                0   0; #2-  ATP
                                0   0; #3-  citrulline
                                0   0; #4-  AMP
                                0   0; #5-  diphosphate
                                0   0; #6-  agrininosuccinate
                                0   0; #7-  fumarate
                                0   0; #8-  arginine
                                0   0; #9-  H2O
                                0   0; #10- ornithine
                                0   0; #11- urea
                                0   0; #12- carbamoyl-phosphate
                                0   0; #13- phosphate
                                0   0; #14- NADPH
                                0   0; #15- H
                                0   0; #16- O2
                                0   0; #17- nitric oxide
                                0   0; #18- NADP

                                        ]


        data_dictionary["species_bounds_array"] = species_bounds_array

        objective_coefficient_array = [
                                0   ; #v1 aspatate + ATP + citrulline -> AMP + diphosphate + argininosuccinate
                                0   ; #v2 argininosuccinate -> fumarate + arginine
                                0   ; #v3 arginine + water -> ornithine + urea
                                0   ; #v4 carbamoyl-phosphate + ornithine -> phosphate + citrulline
                                0   ; #v5 2arginine + 3NADPH + 3H+ + 4O2 <-> 2citrulline + 2nitric oxide + 3NADP + 4water
                                0   ; #b1 [] -> carbomyl-phosphate
                                0   ; #b2 []-> aspartate
                                0   ; #b3 fumarate -> []
                                1   ; #b4 urea -> []
                                0   ; #b5 [] -> ATP
                                0   ; #b6 AMP -> []
                                0   ; #b7 diphosphate -> []
                                0   ; #b8 [] -> water
                                0   ; #b9 phosphate -> []
                                0   ; #b10 [] -> NADPH
                                0   ; #b11 [] -> H+
                                0   ; #b12 [] -> O2
                                0   ; #b13 nitric oxide -> []
                                0   ; #b14 NADP+ -> []
                                0   ; #b15 H2O -> []

                                                ]

        data_dictionary["objective_coefficient_array"] = objective_coefficient_array

        data_dictionary["min_flag"] = false

        return data_dictionary

end
