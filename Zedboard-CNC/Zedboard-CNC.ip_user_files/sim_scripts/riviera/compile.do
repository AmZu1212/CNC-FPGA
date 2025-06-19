transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_9

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_9 riviera/xlconstant_v1_1_9

vlog -work xpm  -incr "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../Zedboard-CNC.srcs/sources_1/new/A4988_Driver_IO.v" \
"../../../Zedboard-CNC.srcs/sources_1/new/DriverController.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_A4988_Driver_IO_0_0/sim/CNC_Top_A4988_Driver_IO_0_0.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0_clk_wiz.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.v" \

vlog -work xlconstant_v1_1_9  -incr -v2k5 "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_xlconstant_0_1/sim/CNC_Top_xlconstant_0_1.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_DriverController_0_0/sim/CNC_Top_DriverController_0_0.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/sim/CNC_Top.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/hdl/CNC_Top_wrapper.v" \

vlog -work xil_defaultlib \
"glbl.v"

