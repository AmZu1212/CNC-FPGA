# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\diskio.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ff.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\ffconf.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\sleep.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilffs_config.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xilrsa.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xiltimer.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\include\\xtimer_config.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilffs.a"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxilrsa.a"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\zynq_fsbl\\zynq_fsbl_bsp\\lib\\libxiltimer.a"
  )
endif()
