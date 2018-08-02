vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../QAM.srcs/sources_1/ip/dds_compiler_test/dds_compiler_test_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

