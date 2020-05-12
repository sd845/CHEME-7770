using Plots
#
IPTG = [0.0, 5E-4, 0.005, 0.012, 0.053, 0.216, 1.0] #mM
data = [19, 21, 41, 67, 86, 93, 93] #mRNA/cell

#parameters given in Q1
doubling_time = 40/60 # hr
mRNA_half_life = 5/60 # hr
characteristic_transcript_length = 1000 # nt
lacZ_copy_number = 2 #copies/cell
cell_count = 10^8 #cells/ml
sample_volume = 1 #ml
dilution = log(2) / doubling_time # hr^-1
mRNA_degradation = log(2) / mRNA_half_life # hr^-1

#estimated parameters from literature
RNAPII_copy_number = 1150 # copies/cell Biophysical TXTL
transcription_elongation_rate = 60 # nt/s Biophysical TXTL
characteristic_initiation_time = 42 # s Biophysical TXTL
transcription_saturation_constant = 0.24 # nmol/gDW Biophysical TXTL
mass_of_single_cell = 2.8e-13 # g Biophysical TXTL
fraction_dry_cell = 0.3 # dimensionless Biophysical TXTL

#calculating kinetic rate of transcription
av_number = 6.02e23
R_X_T = RNAPII_copy_number*(1/mass_of_single_cell)*(1/av_number)*(1e9)*(1/fraction_dry_cell) # nmol/gDW
G = lacZ_copy_number*(1/mass_of_single_cell)*(1/av_number)*(1e9)*(1/fraction_dry_cell)   # nmol/gDW

k_E_x = transcription_elongation_rate*(1/characteristic_transcript_length)
kI = (1/characteristic_initiation_time)
time_constant = k_E_x/kI
r_x = k_E_x * R_X_T * (G / (time_constant * transcription_saturation_constant + (time_constant + 1) * G)) * 3600

mRNA_lacZ = zeros(length(IPTG))
control_function  = zeros(length(IPTG))
hill_function = zeros(length(IPTG))

n_IPTG_LacZ = 1.0
W_IPTG_RNAP = 0.01 #
W_IPTG_LacZ = 0.08
K_IPTG_LacZ = 49.6e-3 #Bionumbers : 101976

for i = 1:length(IPTG)
    hill_function[i] = IPTG[i]^n_IPTG_LacZ / (K_IPTG_LacZ^n_IPTG_LacZ + IPTG[i]^n_IPTG_LacZ)
    control_function[i] = (W_IPTG_RNAP + W_IPTG_LacZ * hill_function[i]) / (1 + W_IPTG_RNAP + W_IPTG_LacZ * hill_function[i])
    mRNA_lacZ[i] = (r_x * control_function[i])/(dilution + mRNA_degradation)
end

mRNA_data = data.*(1/mass_of_single_cell)*(1/av_number)*(1e9)*(1/fraction_dry_cell) # nmol/gDW
mRNA = [mRNA_lacZ[2:end] mRNA_data[2:end]]

plot(IPTG[2:end], mRNA, xaxis = ("IPTG (mM)", :log), ylabel = "lacZ mRNA (nmol/gDW)", label= ["model" "data"])
