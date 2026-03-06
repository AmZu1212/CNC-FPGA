# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\diskio.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\ff.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\ffconf.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xilffs.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xilffs_config.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxilffs.a"
  "E:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
