# 0 "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lop-config.dts"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "X:\\Git-Repos\\CNC-FPGA\\Vitis-Platforms\\SDPlatform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lop-config.dts"

/dts-v1/;
/ {
        compatible = "system-device-tree-v1,lop";
        lops {
                lop_0 {
                        compatible = "system-device-tree-v1,lop,load";
                        load = "assists/baremetal_validate_comp_xlnx.py";
                };

                lop_1 {
                    compatible = "system-device-tree-v1,lop,assist-v1";
                    node = "/";
                    outdir = "X:/Git-Repos/CNC-FPGA/Vitis-Platforms/SDPlatform/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp";
                    id = "module,baremetal_validate_comp_xlnx";
                    options = "ps7_cortexa9_0 X:/Xilinx/Vitis/2024.2/data/embeddedsw/lib/sw_services/xilffs_v5_3/src X:/Git-Repos/CNC-FPGA/Vitis-Platforms/_ide/.wsdata/.repo.yaml";
                };

        };
    };
