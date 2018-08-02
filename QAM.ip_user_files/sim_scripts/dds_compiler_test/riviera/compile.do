vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../QAM.srcs/sources_1/ip/dds_compiler_test/dds_compiler_test_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

