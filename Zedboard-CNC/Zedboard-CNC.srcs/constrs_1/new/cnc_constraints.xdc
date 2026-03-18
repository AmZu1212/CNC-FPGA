# CLK pin
set_property PACKAGE_PIN Y9 [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]
# create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports sys_clock]

# Button inputs
set_property PACKAGE_PIN N15 [get_ports Left]
set_property PACKAGE_PIN R18 [get_ports Right]
set_property PACKAGE_PIN T18 [get_ports Up]
set_property PACKAGE_PIN R16 [get_ports Down]
set_property PACKAGE_PIN P16 [get_ports Middle]
set_property PULLTYPE PULLDOWN [get_ports {Left Right Middle Up Down}]
set_property IOSTANDARD LVCMOS33 [get_ports {Left Right Middle Up Down}]

# control switches - TBD
# "switch 7" - reset
# "switch 0" - Z select
set_property PACKAGE_PIN M15 [get_ports ResetSwitch] 
set_property PACKAGE_PIN G22 [get_ports Zswitch]     
set_property PULLTYPE PULLDOWN [get_ports {ResetSwitch Zswitch}]
set_property IOSTANDARD LVCMOS33 [get_ports {ResetSwitch Zswitch}]

# LED pins
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]


## A4988 Stepper Driver - Axis X on PMOD JA
set_property PACKAGE_PIN Y11 [get_ports directionX]
set_property PACKAGE_PIN AA11 [get_ports stepX]
set_property PACKAGE_PIN Y10 [get_ports resetX]
##set_property PACKAGE_PIN AA9 [get_ports lssX]
set_property PACKAGE_PIN AB11 [get_ports enableX]
set_property PACKAGE_PIN AB10 [get_ports ms1X]
set_property PACKAGE_PIN AB9 [get_ports ms2X]
set_property PACKAGE_PIN AA8 [get_ports ms3X]

# A4988 Stepper Driver - Axis Z on PMOD JB
set_property PACKAGE_PIN W12 [get_ports directionZ]
set_property PACKAGE_PIN W11 [get_ports stepZ]
set_property PACKAGE_PIN V10 [get_ports resetZ]
##set_property PACKAGE_PIN W8 [get_ports lssZ]
set_property PACKAGE_PIN V12 [get_ports enableZ]
set_property PACKAGE_PIN W10 [get_ports ms1Z]
set_property PACKAGE_PIN V9 [get_ports ms2Z]
set_property PACKAGE_PIN V8 [get_ports ms3Z]

## A4988 Stepper Driver - Axis Y on PMOD JC
set_property PACKAGE_PIN AB7 [get_ports directionY]
set_property PACKAGE_PIN AB6 [get_ports stepY]
set_property PACKAGE_PIN Y4 [get_ports resetY]
##set_property PACKAGE_PIN AA4 [get_ports lssY]
set_property PACKAGE_PIN R6 [get_ports enableY]
set_property PACKAGE_PIN T6 [get_ports ms1Y]
set_property PACKAGE_PIN T4 [get_ports ms2Y]
set_property PACKAGE_PIN U4 [get_ports ms3Y]





# PMOD D - Template (unused) - can be used in the future for an SD IO
#set_property PACKAGE_PIN V7 [get_ports ]
#set_property PACKAGE_PIN W7 [get_ports ]
#set_property PACKAGE_PIN V5 [get_ports ]
#set_property PACKAGE_PIN V4 [get_ports ]
#set_property PACKAGE_PIN W6 [get_ports ]
#set_property PACKAGE_PIN W5 [get_ports ]
#set_property PACKAGE_PIN U6 [get_ports ]
#set_property PACKAGE_PIN U5 [get_ports ]


# set ports to 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports *X]
set_property IOSTANDARD LVCMOS33 [get_ports *Y]
set_property IOSTANDARD LVCMOS33 [get_ports *Z]

# Pull Up & Downs
set_property PULLTYPE PULLUP [get_ports {resetX resetY resetZ}]
set_property PULLTYPE PULLDOWN [get_ports { \
    stepX enableX directionX ms1X ms2X ms3X \
    stepY enableY directionY ms1Y ms2Y ms3Y \
    stepZ enableZ directionZ ms1Z ms2Z ms3Z \
}]

# xdc magic for root function
# 32-cycle multicycle path from square root result to final x-axis output
#set _xlnx_shared_i0 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]]
#set _xlnx_shared_i1 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i2 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i2 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i2 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i3 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i4 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i4 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i4 -to $_xlnx_shared_i1 31

#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i2 31

#set_multicycle_path -setup -from $_xlnx_shared_i4 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i4 -to $_xlnx_shared_i2 31

#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i2 31

#set _xlnx_shared_i5 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i5 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i5 31

#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i5 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i5 31#set _xlnx_shared_i0 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]]
#set _xlnx_shared_i1 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i2 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i2 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i2 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i3 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i1 31

#set _xlnx_shared_i4 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i4 -to $_xlnx_shared_i1 32
#set_multicycle_path -hold -from $_xlnx_shared_i4 -to $_xlnx_shared_i1 31

#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i2 31

#set_multicycle_path -setup -from $_xlnx_shared_i4 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i4 -to $_xlnx_shared_i2 31

#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i2 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i2 31

#set _xlnx_shared_i5 [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*val_reg*" }]]
#set_multicycle_path -setup -from $_xlnx_shared_i0 -to $_xlnx_shared_i5 32
#set_multicycle_path -hold -from $_xlnx_shared_i0 -to $_xlnx_shared_i5 31

#set_multicycle_path -setup -from $_xlnx_shared_i3 -to $_xlnx_shared_i5 32
#set_multicycle_path -hold -from $_xlnx_shared_i3 -to $_xlnx_shared_i5 31

# debug stuff
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
