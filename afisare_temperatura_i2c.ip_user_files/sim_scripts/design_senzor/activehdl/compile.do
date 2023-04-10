vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xil_defaultlib -93  \
"../../../bd/design_senzor/ip/design_senzor_controler_0_0/sim/design_senzor_controler_0_0.vhd" \
"../../../bd/design_senzor/ip/design_senzor_i2c_master_0_0/sim/design_senzor_i2c_master_0_0.vhd" \
"../../../bd/design_senzor/ip/design_senzor_i2c_read_0_0/sim/design_senzor_i2c_read_0_0.vhd" \
"../../../bd/design_senzor/ip/design_senzor_afis_0_0/sim/design_senzor_afis_0_0.vhd" \
"../../../bd/design_senzor/sim/design_senzor.vhd" \


