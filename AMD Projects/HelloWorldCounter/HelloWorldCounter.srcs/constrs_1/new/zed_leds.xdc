
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
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]


# LED pins
set_property PACKAGE_PIN T22 [get_ports {led[0]}]
set_property PACKAGE_PIN T21 [get_ports {led[1]}]
set_property PACKAGE_PIN U22 [get_ports {led[2]}]
set_property PACKAGE_PIN U21 [get_ports {led[3]}]
set_property PACKAGE_PIN V22 [get_ports {led[4]}]
set_property PACKAGE_PIN W22 [get_ports {led[5]}]
set_property PACKAGE_PIN U19 [get_ports {led[6]}]
set_property PACKAGE_PIN U14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports led[*]]


# A4988 stepper driver control signals on PMOD JA
# Upper
set_property PACKAGE_PIN Y11  [get_ports drv_dir]   ;
set_property PACKAGE_PIN AA11 [get_ports drv_step]  ;
set_property PACKAGE_PIN Y10  [get_ports drv_rst]   ;

# Lower
set_property PACKAGE_PIN AB11 [get_ports drv_en]    ;
set_property PACKAGE_PIN AB10 [get_ports drv_ms1]   ;
set_property PACKAGE_PIN AB9  [get_ports drv_ms2]   ;
set_property PACKAGE_PIN AA8  [get_ports drv_ms3]   ;
set_property IOSTANDARD LVCMOS33 [get_ports {drv_*}]

# Pull Up & Downs
set_property PULLDOWN true [get_ports drv_dir]
set_property PULLDOWN true [get_ports drv_step]
set_property PULLUP true [get_ports drv_rst]
set_property PULLDOWN true [get_ports drv_en]
set_property PULLDOWN true [get_ports drv_ms1]
set_property PULLDOWN true [get_ports drv_ms2]
set_property PULLDOWN true [get_ports drv_ms3]


# Button inputs
set_property PACKAGE_PIN N15 [get_ports btn_ccw]  ; #Left Button
set_property IOSTANDARD LVCMOS33 [get_ports btn_ccw]
set_property PULLDOWN true [get_ports btn_ccw]

set_property PACKAGE_PIN R18 [get_ports btn_cw]   ; #Right Button
set_property IOSTANDARD LVCMOS33 [get_ports btn_cw]
set_property PULLDOWN true [get_ports btn_cw]

