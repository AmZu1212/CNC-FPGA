# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\diskio.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\ff.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\ffconf.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xilffs.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xilffs_config.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxilffs.a"
  "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
