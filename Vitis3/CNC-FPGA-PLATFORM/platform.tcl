# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\Git-Repos\CNC-FPGA\Vitis3\CNC-FPGA-PLATFORM\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\Git-Repos\CNC-FPGA\Vitis3\CNC-FPGA-PLATFORM\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {CNC-FPGA-PLATFORM}\
-hw {E:\Git-Repos\CNC-FPGA\Zedboard-CNC\CNC_FPGA_HW.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {E:/Git-Repos/CNC-FPGA/Vitis3}

platform write
platform generate -domains 
platform active {CNC-FPGA-PLATFORM}
domain active {zynq_fsbl}
bsp reload
domain active {standalone_domain}
bsp reload
domain active {zynq_fsbl}
bsp write
domain active {standalone_domain}
bsp setlib -name xilffs -ver 5.3
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform active {CNC-FPGA-PLATFORM}
platform active {CNC-FPGA-PLATFORM}
platform active {CNC-FPGA-PLATFORM}
platform active {CNC-FPGA-PLATFORM}
catch {platform remove CNC-PL333}
catch {platform remove CNC-PL-PRE-RELEASE}
catch {platform remove CNC-FPGA-FINAL-RELEASE}
