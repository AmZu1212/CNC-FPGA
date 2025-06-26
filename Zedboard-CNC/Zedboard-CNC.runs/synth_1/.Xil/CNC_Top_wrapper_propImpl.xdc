set_property SRC_FILE_INFO {cfile:{c:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.xdc} rfile:../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.xdc id:1 order:EARLY scoped_inst:CNC_Top_i/clk_wiz/inst} [current_design]
set_property SRC_FILE_INFO {cfile:{C:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.srcs/constrs_1/new/cnc_constraints.xdc} rfile:../../../Zedboard-CNC.srcs/constrs_1/new/cnc_constraints.xdc id:2} [current_design]
current_instance CNC_Top_i/clk_wiz/inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property src_info {type:XDC file:2 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property src_info {type:XDC file:2 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property src_info {type:XDC file:2 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property src_info {type:XDC file:2 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property src_info {type:XDC file:2 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property src_info {type:XDC file:2 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property src_info {type:XDC file:2 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]
set_property src_info {type:XDC file:2 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y11 [get_ports drv_direction]
set_property src_info {type:XDC file:2 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA11 [get_ports drv_step]
set_property src_info {type:XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y10 [get_ports drv_reset]
set_property src_info {type:XDC file:2 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB11 [get_ports drv_enable]
set_property src_info {type:XDC file:2 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB10 [get_ports drv_ms1]
set_property src_info {type:XDC file:2 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB9 [get_ports drv_ms2]
set_property src_info {type:XDC file:2 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA8 [get_ports drv_ms3]
set_property src_info {type:XDC file:2 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N15 [get_ports left]
set_property src_info {type:XDC file:2 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R18 [get_ports right]
set_property src_info {type:XDC file:2 line:97 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:2 line:100 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:2 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:2 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:2 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:2 line:112 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:2 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:2 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]] 31
set_property src_info {type:XDC file:2 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]] 31
