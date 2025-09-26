set_property SRC_FILE_INFO {cfile:{c:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.xdc} rfile:../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.xdc id:1 order:EARLY scoped_inst:CNC_Top_i/clk_wiz/inst} [current_design]
set_property SRC_FILE_INFO {cfile:{c:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_0_1/CNC_Top_vio_0_1.xdc} rfile:../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_0_1/CNC_Top_vio_0_1.xdc id:2 order:EARLY scoped_inst:CNC_Top_i/vio_0} [current_design]
set_property SRC_FILE_INFO {cfile:{c:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_1_0/CNC_Top_vio_1_0.xdc} rfile:../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_1_0/CNC_Top_vio_1_0.xdc id:3 order:EARLY scoped_inst:CNC_Top_i/vio_1} [current_design]
set_property SRC_FILE_INFO {cfile:{c:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_2_0/CNC_Top_vio_2_0.xdc} rfile:../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_vio_2_0/CNC_Top_vio_2_0.xdc id:4 order:EARLY scoped_inst:CNC_Top_i/vio_2} [current_design]
set_property SRC_FILE_INFO {cfile:{C:/Git Repos/CNC-FPGA/Zedboard-CNC/Zedboard-CNC.srcs/constrs_1/new/cnc_constraints.xdc} rfile:../../../Zedboard-CNC.srcs/constrs_1/new/cnc_constraints.xdc id:5} [current_design]
current_instance CNC_Top_i/clk_wiz/inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
current_instance CNC_Top_i/vio_0
set_property src_info {type:SCOPED_XDC file:2 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-4 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*probe_in_reg_reg*"}]]  -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*data_int_sync1_reg*"}]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
set_property src_info {type:SCOPED_XDC file:2 line:56 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter { NAME =~  "*Hold_probe_in*" &&  IS_SEQUENTIAL } ]]  -to [get_pins -filter {REF_PIN_NAME=~CE} -of_objects [get_cells -hierarchical -filter { NAME =~  "*PROBE_IN_INST/probe_in_reg*" && IS_SEQUENTIAL} ]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
current_instance
current_instance CNC_Top_i/vio_1
set_property src_info {type:SCOPED_XDC file:3 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-4 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*probe_in_reg_reg*"}]]  -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*data_int_sync1_reg*"}]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
set_property src_info {type:SCOPED_XDC file:3 line:56 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter { NAME =~  "*Hold_probe_in*" &&  IS_SEQUENTIAL } ]]  -to [get_pins -filter {REF_PIN_NAME=~CE} -of_objects [get_cells -hierarchical -filter { NAME =~  "*PROBE_IN_INST/probe_in_reg*" && IS_SEQUENTIAL} ]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
current_instance
current_instance CNC_Top_i/vio_2
set_property src_info {type:SCOPED_XDC file:4 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-4 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter {NAME =~ "*probe_in_reg_reg*"}]]  -to [get_pins -filter {REF_PIN_NAME=~D} -of_objects [get_cells -hierarchical -filter {NAME =~ "*data_int_sync1_reg*"}]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
set_property src_info {type:SCOPED_XDC file:4 line:56 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id CDC-1 -from [get_pins -filter {REF_PIN_NAME=~C} -of_objects [get_cells -hierarchical -filter { NAME =~  "*Hold_probe_in*" &&  IS_SEQUENTIAL } ]]  -to [get_pins -filter {REF_PIN_NAME=~CE} -of_objects [get_cells -hierarchical -filter { NAME =~  "*PROBE_IN_INST/probe_in_reg*" && IS_SEQUENTIAL} ]]  -user "vio" -description {The path has combinational circuit. But from hardware prospective the design works perfectly and the signals crossing happen after a very long time from the source has the value.} -tags "1050886" -scope -internal
current_instance
set_property src_info {type:XDC file:5 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y9 [get_ports sys_clock]
set_property src_info {type:XDC file:5 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property src_info {type:XDC file:5 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property src_info {type:XDC file:5 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property src_info {type:XDC file:5 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property src_info {type:XDC file:5 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property src_info {type:XDC file:5 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property src_info {type:XDC file:5 line:48 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property src_info {type:XDC file:5 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]
set_property src_info {type:XDC file:5 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y11 [get_ports drv_direction]
set_property src_info {type:XDC file:5 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA11 [get_ports drv_step]
set_property src_info {type:XDC file:5 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN Y10 [get_ports drv_reset]
set_property src_info {type:XDC file:5 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB11 [get_ports drv_enable]
set_property src_info {type:XDC file:5 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB10 [get_ports drv_ms1]
set_property src_info {type:XDC file:5 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AB9 [get_ports drv_ms2]
set_property src_info {type:XDC file:5 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AA8 [get_ports drv_ms3]
set_property src_info {type:XDC file:5 line:77 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N15 [get_ports left]
set_property src_info {type:XDC file:5 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN R18 [get_ports right]
set_property src_info {type:XDC file:5 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:5 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:5 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:5 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]] 31
set_property src_info {type:XDC file:5 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:5 line:108 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:5 line:111 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]] 31
set_property src_info {type:XDC file:5 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]] 31
set_property src_info {type:XDC file:5 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -hold -from [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]] -to [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]] 31
set_property src_info {type:XDC file:5 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:5 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:5 line:123 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:5 line:124 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets clk]
