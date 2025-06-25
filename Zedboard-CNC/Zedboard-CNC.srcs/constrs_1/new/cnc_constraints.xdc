set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports drv_*]

# ================= FPGA PINS CHEAT SHEET ================= #

# ==================== clk PINS =====================
#IC18 - 33.33MHz CLK
#IC17 - 100MHz CLK
# PL CLK SUPPLY - Y9

# ================= PMOD JA Inputs ==================
## Upper Slots
#set_property PACKAGE_PIN Y11  [get_ports {ja_in[0]}]   ;# JA1
#set_property PACKAGE_PIN AA11 [get_ports {ja_in[1]}]   ;# JA2
#set_property PACKAGE_PIN Y10  [get_ports {ja_in[2]}]   ;# JA3
#set_property PACKAGE_PIN AA9  [get_ports {ja_in[3]}]   ;# JA4
## Lower Slots
#set_property PACKAGE_PIN AB11  [get_ports {ja_in[4]}]  ;# JA7
#set_property PACKAGE_PIN AB10  [get_ports {ja_in[5]}]  ;# JA8
#set_property PACKAGE_PIN AB9 [get_ports {ja_in[6]}]    ;# JA9
#set_property PACKAGE_PIN AA8 [get_ports {ja_in[7]}]    ;# JA10
#set_property IOSTANDARD LVCMOS33 [get_ports ja_in[*]]

# Pull Up/Down, Important, else the signals float!
#set_property PULLDOWN true [get_ports ja_in[*]]

# ================= Button inputs  ==================
# set_property PACKAGE_PIN N15 [get_ports btn_ccw]
# set_property IOSTANDARD LVCMOS33 [get_ports btn_ccw]
# set_property PULLDOWN true [get_ports btn_ccw]

# =========================================================== #


# CLK pin
#set_property PACKAGE_PIN Y9 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]
#create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]


# LED pins
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]


# A4988 stepper driver control signals on PMOD JA
# Upper
set_property PACKAGE_PIN Y11 [get_ports drv_direction]
set_property PACKAGE_PIN AA11 [get_ports drv_step]
set_property PACKAGE_PIN Y10 [get_ports drv_reset]

# Lower
set_property PACKAGE_PIN AB11 [get_ports drv_enable]
set_property PACKAGE_PIN AB10 [get_ports drv_ms1]
set_property PACKAGE_PIN AB9 [get_ports drv_ms2]
set_property PACKAGE_PIN AA8 [get_ports drv_ms3]

# set 3.3V

# Pull Up & Downs
set_property PULLTYPE PULLDOWN [get_ports drv_direction]
set_property PULLTYPE PULLDOWN [get_ports drv_step]
set_property PULLTYPE PULLUP [get_ports drv_reset]
set_property PULLTYPE PULLDOWN [get_ports drv_enable]
set_property PULLTYPE PULLDOWN [get_ports drv_ms1]
set_property PULLTYPE PULLDOWN [get_ports drv_ms2]
set_property PULLTYPE PULLDOWN [get_ports drv_ms3]


# Button inputs
set_property PACKAGE_PIN N15 [get_ports left]
set_property PACKAGE_PIN R18 [get_ports right]
set_property IOSTANDARD LVCMOS33 [get_ports left]
set_property IOSTANDARD LVCMOS33 [get_ports right]
set_property PULLTYPE PULLDOWN [get_ports left]
set_property PULLTYPE PULLDOWN [get_ports right]

# 32-cycle multicycle path from square root result to final x-axis output
#set_multicycle_path -setup -from $_distance_reg -through $_num_clk_cycles_reg -to $_cycles_per_step 32
#set_multicycle_path -hold -from $_distance_reg -through $_num_clk_cycles_reg -to $_cycles_per_step 31

#set_multicycle_path -setup -from $_curr_pos -to $_cycles_per_step 32
#set_multicycle_path -hold -from $_curr_pos -to $_cycles_per_step 31
#set_multicycle_path -setup -from $_curr_line_reg -through $_distance_reg -to $_num_clk_cycles_reg 32
#set_multicycle_path -hold -from $_curr_line_reg -through $_distance_reg -to $_num_clk_cycles_reg 31


set _curr_line_reg [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_line_reg*" }]]
set _curr_pos [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*curr_pos_*_reg[*]*" }]]
set _next_pos [get_pins -hierarchical -filter { NAME =~  "*next_pos_*" }]
set _distance_reg [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*distance_reg*" }]]
set _num_clk_cycles_reg [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*num_clk_cycles_reg*" }]]
set _cycles_per_step [get_pins -filter { NAME =~  "*reg*" } -of_objects [get_cells -hierarchical -filter { NAME =~  "*cycles_per_step_*" }]]




set_multicycle_path -setup 
    -from $_curr_line_reg               \
        -through $_next_pos             \
        -through $_curr_pos             \
        -through $_distance_reg         \
        -through $_num_clk_cycles_reg   \
    -to $_cycles_per_step 32

set_multicycle_path -hold 
    -from $_curr_line_reg               \
        -through $_next_pos             \
        -through $_curr_pos             \
        -through $_distance_reg         \
        -through $_num_clk_cycles_reg   \
    -to $_cycles_per_step 31



