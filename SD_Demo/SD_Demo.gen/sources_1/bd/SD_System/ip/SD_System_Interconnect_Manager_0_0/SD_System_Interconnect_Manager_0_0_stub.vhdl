-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Thu Dec 25 21:41:51 2025
-- Host        : OBSIDIAN-NITRO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               x:/Git-Repos/CNC-FPGA/SD_Demo/SD_Demo.gen/sources_1/bd/SD_System/ip/SD_System_Interconnect_Manager_0_0/SD_System_Interconnect_Manager_0_0_stub.vhdl
-- Design      : SD_System_Interconnect_Manager_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SD_System_Interconnect_Manager_0_0 is
  Port ( 
    X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Z : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    PS_Channel : in STD_LOGIC_VECTOR ( 7 downto 0 );
    switch0 : in STD_LOGIC;
    PL_Channel : out STD_LOGIC_VECTOR ( 7 downto 0 );
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of SD_System_Interconnect_Manager_0_0 : entity is "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SD_System_Interconnect_Manager_0_0 : entity is "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Interconnect_Manager,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of SD_System_Interconnect_Manager_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of SD_System_Interconnect_Manager_0_0 : entity is "module_ref";
end SD_System_Interconnect_Manager_0_0;

architecture stub of SD_System_Interconnect_Manager_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "X[31:0],Y[31:0],Z[15:0],CMD[7:0],PS_Channel[7:0],switch0,PL_Channel[7:0],led[7:0]";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "Interconnect_Manager,Vivado 2024.2";
begin
end;
