# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\Git-Repos\CNC-FPGA\Vitis3\SD-UART_system\_ide\scripts\systemdebugger_sd-uart_system_14_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\Git-Repos\CNC-FPGA\Vitis3\SD-UART_system\_ide\scripts\systemdebugger_sd-uart_system_14_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248585425" && level==0 && jtag_device_ctx=="jsn-Zed-210248585425-23727093-0"}
fpga -file E:/Git-Repos/CNC-FPGA/Vitis3/SD-UART/_ide/bitstream/CNC_FPGA_HW.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/Git-Repos/CNC-FPGA/Vitis3/CNC-FPGA-PLATFORM/export/CNC-FPGA-PLATFORM/hw/CNC_FPGA_HW.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source E:/Git-Repos/CNC-FPGA/Vitis3/SD-UART/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/Git-Repos/CNC-FPGA/Vitis3/SD-UART/Debug/SD-UART.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
