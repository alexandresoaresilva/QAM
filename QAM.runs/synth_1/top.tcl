# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config  -ruleid {1}  -id {Place 30-99}  -string {{ERROR: [Place 30-99] Placer failed with error: 'IO Clock Placer failed'
Please review all ERROR, CRITICAL WARNING, and WARNING messages during placement to understand the cause for failure.}}  -suppress 
set_msg_config  -ruleid {2}  -id {Place 30-574}  -string {{ERROR: [Place 30-574] Poor placement for routing between an IO pin and BUFG. If this sub optimal condition is acceptable for this design, you may use the CLOCK_DEDICATED_ROUTE constraint in the .xdc file to demote this message to a WARNING. However, the use of this override is highly discouraged. These examples can be used directly in the .xdc file to override this clock rule.
	< set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF] >

	clk_IBUF_inst (IBUF.O) is locked to IOB_X1Y96
	 and clk_IBUF_BUFG_inst (BUFG.I) is provisionally placed by clockplacer on BUFGCTRL_X0Y0
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.}}  -suppress 
set_msg_config  -ruleid {3}  -id {Common 17-69}  -string {{ERROR: [Common 17-69] Command failed: Placer could not place all instances}}  -suppress 
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Users/alexa/Documents/GitHub/QAM/QAM.cache/wt [current_project]
set_property parent.project_path D:/Users/alexa/Documents/GitHub/QAM/QAM.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/Users/alexa/Documents/GitHub/QAM/QAM.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/PWM.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/conv_Hex_to_sin_Xperiods.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/counter.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/separateASCII_to_hex.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/sin_wave.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/sin_wave_Xperiods.v
  D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/new/top.v
}
read_ip -quiet D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all d:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all d:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/constrs_1/imports/02_proj_lab_3/Basys3_Master.xdc
set_property used_in_implementation false [get_files D:/Users/alexa/Documents/GitHub/QAM/QAM.srcs/constrs_1/imports/02_proj_lab_3/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
