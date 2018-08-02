vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../QAM.srcs/sources_1/ip/dds_compiler_test/dds_compiler_test_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

