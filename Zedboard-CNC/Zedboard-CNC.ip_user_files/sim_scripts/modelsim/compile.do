vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_9

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_9 modelsim_lib/msim/xlconstant_v1_1_9

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" \
"../../../Zedboard-CNC.srcs/sources_1/new/A4988_Driver_IO.v" \
"../../../Zedboard-CNC.srcs/sources_1/new/DriverController.v" \
"../../../Zedboard-CNC.srcs/sources_1/new/LED_IO.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0_clk_wiz.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.v" \

vlog -work xlconstant_v1_1_9  -incr -mfcu  "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_xlconstant_0_1/sim/CNC_Top_xlconstant_0_1.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_A4988_Driver_IO_0_0/sim/CNC_Top_A4988_Driver_IO_0_0.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_DriverController_0_0/sim/CNC_Top_DriverController_0_0.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ip/CNC_Top_LED_IO_0_0/sim/CNC_Top_LED_IO_0_0.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/sim/CNC_Top.v" \
"../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/hdl/CNC_Top_wrapper.v" \

vlog -work xil_defaultlib \
"glbl.v"

