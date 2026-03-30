transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/xlconstant_v1_1_9
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_19
vlib activehdl/processing_system7_vip_v1_0_21
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_3
vlib activehdl/interrupt_control_v3_1_5
vlib activehdl/axi_gpio_v2_0_35
vlib activehdl/proc_sys_reset_v5_0_16
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_register_slice_v2_1_33

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xlconstant_v1_1_9 activehdl/xlconstant_v1_1_9
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_19 activehdl/axi_vip_v1_1_19
vmap processing_system7_vip_v1_0_21 activehdl/processing_system7_vip_v1_0_21
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_3 activehdl/lib_cdc_v1_0_3
vmap interrupt_control_v3_1_5 activehdl/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_35 activehdl/axi_gpio_v2_0_35
vmap proc_sys_reset_v5_0_16 activehdl/proc_sys_reset_v5_0_16
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_register_slice_v2_1_33 activehdl/axi_register_slice_v2_1_33

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0_clk_wiz.v" \
"../../../bd/CNC_Top/ip/CNC_Top_clk_wiz_0/CNC_Top_clk_wiz_0.v" \

vlog -work xlconstant_v1_1_9  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_xlconstant_0_1/sim/CNC_Top_xlconstant_0_1.v" \
"../../../bd/CNC_Top/ip/CNC_Top_A4988_Driver_IO_0_0/sim/CNC_Top_A4988_Driver_IO_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_DriverController_0_0/sim/CNC_Top_DriverController_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_LED_IO_0_0/sim/CNC_Top_LED_IO_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_XYZ_Axis_Coordinator_0_0/sim/CNC_Top_XYZ_Axis_Coordinator_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_GCODE_Parser_0_0/sim/CNC_Top_GCODE_Parser_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_DriverController_X_0/sim/CNC_Top_DriverController_X_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_DriverController_X_1/sim/CNC_Top_DriverController_X_1.v" \
"../../../bd/CNC_Top/ip/CNC_Top_A4988_Driver_IO_1/sim/CNC_Top_A4988_Driver_IO_1.v" \
"../../../bd/CNC_Top/ip/CNC_Top_A4988_Driver_IO_2/sim/CNC_Top_A4988_Driver_IO_2.v" \
"../../../bd/CNC_Top/ip/CNC_Top_vio_0_0/sim/CNC_Top_vio_0_0.v" \
"../../../bd/CNC_Top/ip/CNC_Top_Buttons_Vector_0_1/sim/CNC_Top_Buttons_Vector_0_1.v" \
"../../../bd/CNC_Top/ip/CNC_Top_hexfile_holder_0_0/sim/CNC_Top_hexfile_holder_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_19  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/8c45/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_21  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_processing_system7_0_0/sim/CNC_Top_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -93  \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_35 -93  \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/6718/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_0/sim/CNC_Top_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/sim/bd_0a6d.v" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_0/sim/bd_0a6d_one_0.v" \

vcom -work proc_sys_reset_v5_0_16 -93  \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0831/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_1/sim/bd_0a6d_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_2/sim/bd_0a6d_arinsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_3/sim/bd_0a6d_rinsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_4/sim/bd_0a6d_awinsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_5/sim/bd_0a6d_winsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_6/sim/bd_0a6d_binsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_7/sim/bd_0a6d_aroutsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_8/sim/bd_0a6d_routsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_9/sim/bd_0a6d_awoutsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_10/sim/bd_0a6d_woutsw_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_11/sim/bd_0a6d_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_12/sim/bd_0a6d_arni_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_13/sim/bd_0a6d_rni_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_14/sim/bd_0a6d_awni_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_15/sim/bd_0a6d_wni_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_16/sim/bd_0a6d_bni_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f49a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_17/sim/bd_0a6d_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_18/sim/bd_0a6d_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/63ed/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_19/sim/bd_0a6d_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_20/sim/bd_0a6d_s00a2s_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_21/sim/bd_0a6d_sarn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_22/sim/bd_0a6d_srn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_23/sim/bd_0a6d_sawn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_24/sim/bd_0a6d_swn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_25/sim/bd_0a6d_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_26/sim/bd_0a6d_m00s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_27/sim/bd_0a6d_m00arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_28/sim/bd_0a6d_m00rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_29/sim/bd_0a6d_m00awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_30/sim/bd_0a6d_m00wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_31/sim/bd_0a6d_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/37bc/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_32/sim/bd_0a6d_m00e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_33/sim/bd_0a6d_m01s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_34/sim/bd_0a6d_m01arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_35/sim/bd_0a6d_m01rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_36/sim/bd_0a6d_m01awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_37/sim/bd_0a6d_m01wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_38/sim/bd_0a6d_m01bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_39/sim/bd_0a6d_m01e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_40/sim/bd_0a6d_m02s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_41/sim/bd_0a6d_m02arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_42/sim/bd_0a6d_m02rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_43/sim/bd_0a6d_m02awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_44/sim/bd_0a6d_m02wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_45/sim/bd_0a6d_m02bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_46/sim/bd_0a6d_m02e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_47/sim/bd_0a6d_m03s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_48/sim/bd_0a6d_m03arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_49/sim/bd_0a6d_m03rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_50/sim/bd_0a6d_m03awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_51/sim/bd_0a6d_m03wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_52/sim/bd_0a6d_m03bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_53/sim/bd_0a6d_m03e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_54/sim/bd_0a6d_m04s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_55/sim/bd_0a6d_m04arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_56/sim/bd_0a6d_m04rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_57/sim/bd_0a6d_m04awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_58/sim/bd_0a6d_m04wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_59/sim/bd_0a6d_m04bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_60/sim/bd_0a6d_m04e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_61/sim/bd_0a6d_m05s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_62/sim/bd_0a6d_m05arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_63/sim/bd_0a6d_m05rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_64/sim/bd_0a6d_m05awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_65/sim/bd_0a6d_m05wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_66/sim/bd_0a6d_m05bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_67/sim/bd_0a6d_m05e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_68/sim/bd_0a6d_m06s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_69/sim/bd_0a6d_m06arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_70/sim/bd_0a6d_m06rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_71/sim/bd_0a6d_m06awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_72/sim/bd_0a6d_m06wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_73/sim/bd_0a6d_m06bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_74/sim/bd_0a6d_m06e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_75/sim/bd_0a6d_m07s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_76/sim/bd_0a6d_m07arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_77/sim/bd_0a6d_m07rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_78/sim/bd_0a6d_m07awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_79/sim/bd_0a6d_m07wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_80/sim/bd_0a6d_m07bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_81/sim/bd_0a6d_m07e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_82/sim/bd_0a6d_m08s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_83/sim/bd_0a6d_m08arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_84/sim/bd_0a6d_m08rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_85/sim/bd_0a6d_m08awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_86/sim/bd_0a6d_m08wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_87/sim/bd_0a6d_m08bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_88/sim/bd_0a6d_m08e_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_89/sim/bd_0a6d_m09s2a_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_90/sim/bd_0a6d_m09arn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_91/sim/bd_0a6d_m09rn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_92/sim/bd_0a6d_m09awn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_93/sim/bd_0a6d_m09wn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_94/sim/bd_0a6d_m09bn_0.sv" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/bd_0/ip/ip_95/sim/bd_0a6d_m09e_0.sv" \

vlog -work axi_register_slice_v2_1_33  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3ee4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/ip/CNC_Top_axi_smc_0/sim/CNC_Top_axi_smc_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/CNC_Top/ip/CNC_Top_rst_ps7_0_100M_0/sim/CNC_Top_rst_ps7_0_100M_0.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_1/sim/CNC_Top_axi_gpio_0_1.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_2/sim/CNC_Top_axi_gpio_0_2.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_3/sim/CNC_Top_axi_gpio_0_3.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_4/sim/CNC_Top_axi_gpio_0_4.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_5/sim/CNC_Top_axi_gpio_0_5.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_6/sim/CNC_Top_axi_gpio_0_6.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_7/sim/CNC_Top_axi_gpio_0_7.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_8/sim/CNC_Top_axi_gpio_0_8.vhd" \
"../../../bd/CNC_Top/ip/CNC_Top_axi_gpio_0_9/sim/CNC_Top_axi_gpio_0_9.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/3cbc" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/ec67/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/86fe/hdl" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/0127/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/814a/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/1017/hdl/verilog" "+incdir+../../../../Zedboard-CNC.gen/sources_1/bd/CNC_Top/ipshared/4506/hdl" "+incdir+C:/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib -l xlconstant_v1_1_9 -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/CNC_Top/sim/CNC_Top.v" \

vlog -work xil_defaultlib \
"glbl.v"

