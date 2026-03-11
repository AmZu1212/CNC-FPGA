transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_19
vlib riviera/processing_system7_vip_v1_0_21
vlib riviera/xil_defaultlib
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_3
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_gpio_v2_0_35
vlib riviera/xlconstant_v1_1_9
vlib riviera/proc_sys_reset_v5_0_16
vlib riviera/smartconnect_v1_0
vlib riviera/axi_register_slice_v2_1_33

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_19 riviera/axi_vip_v1_1_19
vmap processing_system7_vip_v1_0_21 riviera/processing_system7_vip_v1_0_21
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_3 riviera/lib_cdc_v1_0_3
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_35 riviera/axi_gpio_v2_0_35
vmap xlconstant_v1_1_9 riviera/xlconstant_v1_1_9
vmap proc_sys_reset_v5_0_16 riviera/proc_sys_reset_v5_0_16
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_register_slice_v2_1_33 riviera/axi_register_slice_v2_1_33

vlog -work xilinx_vip  -incr "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"E:/Programs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"E:/Programs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"E:/Programs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_19  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/8c45/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_21  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_processing_system7_0_0/sim/SD_System_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -93  -incr \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_35 -93  -incr \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/6718/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SD_System/ip/SD_System_axi_gpio_0_0/sim/SD_System_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/sim/bd_d332.v" \

vlog -work xlconstant_v1_1_9  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_0/sim/bd_d332_one_0.v" \

vcom -work proc_sys_reset_v5_0_16 -93  -incr \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0831/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_1/sim/bd_d332_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/3718/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_2/sim/bd_d332_arinsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_3/sim/bd_d332_rinsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_4/sim/bd_d332_awinsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_5/sim/bd_d332_winsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_6/sim/bd_d332_binsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_7/sim/bd_d332_aroutsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_8/sim/bd_d332_routsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_9/sim/bd_d332_awoutsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_10/sim/bd_d332_woutsw_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_11/sim/bd_d332_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_12/sim/bd_d332_arni_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_13/sim/bd_d332_rni_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_14/sim/bd_d332_awni_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_15/sim/bd_d332_wni_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_16/sim/bd_d332_bni_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f49a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_17/sim/bd_d332_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/2da8/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_18/sim/bd_d332_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/63ed/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_19/sim/bd_d332_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/cef3/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_20/sim/bd_d332_s00a2s_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_21/sim/bd_d332_sarn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_22/sim/bd_d332_srn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_23/sim/bd_d332_sawn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_24/sim/bd_d332_swn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_25/sim/bd_d332_sbn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/7f4f/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_26/sim/bd_d332_m00s2a_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_27/sim/bd_d332_m00arn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_28/sim/bd_d332_m00rn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_29/sim/bd_d332_m00awn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_30/sim/bd_d332_m00wn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_31/sim/bd_d332_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/37bc/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_32/sim/bd_d332_m00e_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_33/sim/bd_d332_m01s2a_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_34/sim/bd_d332_m01arn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_35/sim/bd_d332_m01rn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_36/sim/bd_d332_m01awn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_37/sim/bd_d332_m01wn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_38/sim/bd_d332_m01bn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_39/sim/bd_d332_m01e_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_40/sim/bd_d332_m02s2a_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_41/sim/bd_d332_m02arn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_42/sim/bd_d332_m02rn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_43/sim/bd_d332_m02awn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_44/sim/bd_d332_m02wn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_45/sim/bd_d332_m02bn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_46/sim/bd_d332_m02e_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_47/sim/bd_d332_m03s2a_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_48/sim/bd_d332_m03arn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_49/sim/bd_d332_m03rn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_50/sim/bd_d332_m03awn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_51/sim/bd_d332_m03wn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_52/sim/bd_d332_m03bn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_53/sim/bd_d332_m03e_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_54/sim/bd_d332_m04s2a_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_55/sim/bd_d332_m04arn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_56/sim/bd_d332_m04rn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_57/sim/bd_d332_m04awn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_58/sim/bd_d332_m04wn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_59/sim/bd_d332_m04bn_0.sv" \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/bd_0/ip/ip_60/sim/bd_d332_m04e_0.sv" \

vlog -work axi_register_slice_v2_1_33  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/3ee4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_axi_smc_0/sim/SD_System_axi_smc_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SD_System/ip/SD_System_rst_ps7_0_100M_0/sim/SD_System_rst_ps7_0_100M_0.vhd" \
"../../../bd/SD_System/ip/SD_System_axi_gpio_1_0/sim/SD_System_axi_gpio_1_0.vhd" \
"../../../bd/SD_System/ip/SD_System_axi_gpio_0_1/sim/SD_System_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/ip/SD_System_Interconnect_Manager_0_0/sim/SD_System_Interconnect_Manager_0_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/SD_System/ip/SD_System_axi_gpio_0_2/sim/SD_System_axi_gpio_0_2.vhd" \
"../../../bd/SD_System/ip/SD_System_axi_gpio_0_3/sim/SD_System_axi_gpio_0_3.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/ec67/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/86fe/hdl" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/f0b6/hdl/verilog" "+incdir+../../../../SD_Demo.gen/sources_1/bd/SD_System/ipshared/0127/hdl/verilog" "+incdir+E:/Programs/Xilinx/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_19 -l processing_system7_vip_v1_0_21 -l xil_defaultlib -l axi_lite_ipif_v3_0_4 -l lib_cdc_v1_0_3 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_35 -l xlconstant_v1_1_9 -l proc_sys_reset_v5_0_16 -l smartconnect_v1_0 -l axi_register_slice_v2_1_33 \
"../../../bd/SD_System/sim/SD_System.v" \

vlog -work xil_defaultlib \
"glbl.v"

