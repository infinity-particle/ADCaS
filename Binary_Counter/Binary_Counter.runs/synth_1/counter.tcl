# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.cache/wt [current_project]
set_property parent.project_path D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.2 [current_project]
read_vhdl -library xil_defaultlib {
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/rco_logic.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/jk_flip_flop.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/enable_logic.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/direction_logic.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/count_logic_3.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/count_logic_2.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/count_logic_1.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/count_logic.vhd
  D:/BSUIR/github/ADCaS/Binary_Counter/Binary_Counter.srcs/sources_1/new/counter.vhd
}
synth_design -top counter -part xc7a200tfbg676-2
write_checkpoint -noxdef counter.dcp
catch { report_utilization -file counter_utilization_synth.rpt -pb counter_utilization_synth.pb }
