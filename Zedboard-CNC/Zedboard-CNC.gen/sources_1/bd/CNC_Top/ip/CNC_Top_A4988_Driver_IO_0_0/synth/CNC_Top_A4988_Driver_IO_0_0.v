// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:A4988_Driver_IO:1.0
// IP Revision: 1

(* X_CORE_INFO = "A4988_Driver_IO,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "CNC_Top_A4988_Driver_IO_0_0,A4988_Driver_IO,{}" *)
(* CORE_GENERATION_INFO = "CNC_Top_A4988_Driver_IO_0_0,A4988_Driver_IO,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=A4988_Driver_IO,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module CNC_Top_A4988_Driver_IO_0_0 (
  enable,
  direction,
  step,
  reset,
  ms1,
  ms2,
  ms3,
  drv_enable,
  drv_direction,
  drv_step,
  drv_reset,
  drv_ms1,
  drv_ms2,
  drv_ms3
);

input wire enable;
input wire direction;
input wire step;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire reset;
input wire ms1;
input wire ms2;
input wire ms3;
output wire drv_enable;
output wire drv_direction;
output wire drv_step;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 drv_reset RST" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME drv_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
output wire drv_reset;
output wire drv_ms1;
output wire drv_ms2;
output wire drv_ms3;

  A4988_Driver_IO inst (
    .enable(enable),
    .direction(direction),
    .step(step),
    .reset(reset),
    .ms1(ms1),
    .ms2(ms2),
    .ms3(ms3),
    .drv_enable(drv_enable),
    .drv_direction(drv_direction),
    .drv_step(drv_step),
    .drv_reset(drv_reset),
    .drv_ms1(drv_ms1),
    .drv_ms2(drv_ms2),
    .drv_ms3(drv_ms3)
  );
endmodule
