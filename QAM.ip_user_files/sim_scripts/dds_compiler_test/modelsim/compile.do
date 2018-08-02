vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../QAM.srcs/sources_1/ip/dds_compiler_test/dds_compiler_test_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

