# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\Git-Repos\CNC-FPGA\Vitis3\CNC-PL7\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\Git-Repos\CNC-FPGA\Vitis3\CNC-PL7\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {CNC-PL7}\
-hw {E:\Git-Repos\CNC-FPGA\Zedboard-CNC\CNC_Top_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {E:/Git-Repos/CNC-FPGA/Vitis3}

platform write
platform generate -domains 
platform active {CNC-PL7}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
bsp setlib -name xilffs -ver 5.3
bsp setlib -name xiltimer -ver 2.1
bsp write
bsp reload
catch {bsp regenerate}
platform generate
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp removelib -name xiltimer
bsp write
bsp reload
catch {bsp regenerate}
catch {platform remove CNC-PL5}
catch {platform remove CNC-PL6}
platform clean
platform clean
platform generate
