# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\Git-Repos\CNC-FPGA\Vitis3\CNC-PL333\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\Git-Repos\CNC-FPGA\Vitis3\CNC-PL333\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {CNC-PL333}\
-hw {E:\Git-Repos\CNC-FPGA\Zedboard-CNC\CNC_Top_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {E:/Git-Repos/CNC-FPGA/Vitis3}

platform write
platform generate -domains 
platform active {CNC-PL333}
domain active {zynq_fsbl}
bsp reload
bsp reload
domain active {standalone_domain}
bsp reload
bsp setlib -name xilffs -ver 5.3
bsp setlib -name xiltimer -ver 2.1
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform generate
platform active {CNC-PL333}
catch {platform remove CNC-PL-NEW}
catch {platform remove CNC-PL-FINAL}
catch {platform remove CNC-PL1}
platform active {CNC-PL333}
domain active {zynq_fsbl}
bsp reload
bsp reload
domain active {standalone_domain}
bsp reload
bsp reload
platform generate -domains 
platform clean
platform generate
platform generate
platform active {CNC-PL333}
