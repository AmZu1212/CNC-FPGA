-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Thu Mar  5 13:26:46 2026
-- Host        : OBSIDIAN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Git-Repos/CNC-FPGA/SD_Demo/SD_Demo.gen/sources_1/bd/SD_System/ip/SD_System_Interconnect_Manager_0_0/SD_System_Interconnect_Manager_0_0_sim_netlist.vhdl
-- Design      : SD_System_Interconnect_Manager_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SD_System_Interconnect_Manager_0_0_Interconnect_Manager is
  port (
    led : out STD_LOGIC_VECTOR ( 4 downto 0 );
    X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    PS_Channel : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of SD_System_Interconnect_Manager_0_0_Interconnect_Manager : entity is "Interconnect_Manager";
end SD_System_Interconnect_Manager_0_0_Interconnect_Manager;

architecture STRUCTURE of SD_System_Interconnect_Manager_0_0_Interconnect_Manager is
  signal \led0_inferred__0/led[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \led0_inferred__0/led[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \led0_inferred__0/led[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \led0_inferred__0/led[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \led0_inferred__0/led[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \led0_inferred__0/led[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \led0_inferred__1/led[2]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \led0_inferred__2/led[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \led0_inferred__3/led[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \led[0]_INST_0_i_6_n_0\ : STD_LOGIC;
begin
\led0_inferred__0/led[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \led0_inferred__0/led[1]_INST_0_i_1_n_0\,
      I1 => \led0_inferred__0/led[1]_INST_0_i_2_n_0\,
      I2 => \led0_inferred__0/led[1]_INST_0_i_3_n_0\,
      I3 => \led0_inferred__0/led[1]_INST_0_i_4_n_0\,
      I4 => \led0_inferred__0/led[1]_INST_0_i_5_n_0\,
      I5 => \led0_inferred__0/led[1]_INST_0_i_6_n_0\,
      O => led(1)
    );
\led0_inferred__0/led[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Y(12),
      I1 => Y(13),
      I2 => Y(10),
      I3 => Y(11),
      I4 => Y(9),
      I5 => Y(8),
      O => \led0_inferred__0/led[1]_INST_0_i_1_n_0\
    );
\led0_inferred__0/led[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Y(18),
      I1 => Y(19),
      I2 => Y(16),
      I3 => Y(17),
      I4 => Y(15),
      I5 => Y(14),
      O => \led0_inferred__0/led[1]_INST_0_i_2_n_0\
    );
\led0_inferred__0/led[1]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Y(30),
      I1 => Y(31),
      I2 => Y(28),
      I3 => Y(29),
      I4 => Y(27),
      I5 => Y(26),
      O => \led0_inferred__0/led[1]_INST_0_i_3_n_0\
    );
\led0_inferred__0/led[1]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Y(24),
      I1 => Y(25),
      I2 => Y(22),
      I3 => Y(23),
      I4 => Y(21),
      I5 => Y(20),
      O => \led0_inferred__0/led[1]_INST_0_i_4_n_0\
    );
\led0_inferred__0/led[1]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Y(0),
      I1 => Y(1),
      O => \led0_inferred__0/led[1]_INST_0_i_5_n_0\
    );
\led0_inferred__0/led[1]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Y(6),
      I1 => Y(7),
      I2 => Y(4),
      I3 => Y(5),
      I4 => Y(3),
      I5 => Y(2),
      O => \led0_inferred__0/led[1]_INST_0_i_6_n_0\
    );
\led0_inferred__1/led[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \led0_inferred__1/led[2]_INST_0_i_1_n_0\,
      I1 => \led0_inferred__1/led[2]_INST_0_i_2_n_0\,
      I2 => \led0_inferred__1/led[2]_INST_0_i_3_n_0\,
      I3 => \led0_inferred__1/led[2]_INST_0_i_4_n_0\,
      I4 => \led0_inferred__1/led[2]_INST_0_i_5_n_0\,
      I5 => \led0_inferred__1/led[2]_INST_0_i_6_n_0\,
      O => led(2)
    );
\led0_inferred__1/led[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Z(12),
      I1 => Z(13),
      I2 => Z(10),
      I3 => Z(11),
      I4 => Z(9),
      I5 => Z(8),
      O => \led0_inferred__1/led[2]_INST_0_i_1_n_0\
    );
\led0_inferred__1/led[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Z(18),
      I1 => Z(19),
      I2 => Z(16),
      I3 => Z(17),
      I4 => Z(15),
      I5 => Z(14),
      O => \led0_inferred__1/led[2]_INST_0_i_2_n_0\
    );
\led0_inferred__1/led[2]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Z(30),
      I1 => Z(31),
      I2 => Z(28),
      I3 => Z(29),
      I4 => Z(27),
      I5 => Z(26),
      O => \led0_inferred__1/led[2]_INST_0_i_3_n_0\
    );
\led0_inferred__1/led[2]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Z(24),
      I1 => Z(25),
      I2 => Z(22),
      I3 => Z(23),
      I4 => Z(21),
      I5 => Z(20),
      O => \led0_inferred__1/led[2]_INST_0_i_4_n_0\
    );
\led0_inferred__1/led[2]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => Z(0),
      I1 => Z(1),
      O => \led0_inferred__1/led[2]_INST_0_i_5_n_0\
    );
\led0_inferred__1/led[2]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => Z(6),
      I1 => Z(7),
      I2 => Z(4),
      I3 => Z(5),
      I4 => Z(3),
      I5 => Z(2),
      O => \led0_inferred__1/led[2]_INST_0_i_6_n_0\
    );
\led0_inferred__2/led[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => CMD(0),
      I1 => CMD(1),
      I2 => CMD(2),
      I3 => CMD(3),
      I4 => \led0_inferred__2/led[3]_INST_0_i_1_n_0\,
      O => led(3)
    );
\led0_inferred__2/led[3]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => CMD(6),
      I1 => CMD(7),
      I2 => CMD(5),
      I3 => CMD(4),
      O => \led0_inferred__2/led[3]_INST_0_i_1_n_0\
    );
\led0_inferred__3/led[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => PS_Channel(0),
      I1 => PS_Channel(1),
      I2 => PS_Channel(2),
      I3 => PS_Channel(3),
      I4 => \led0_inferred__3/led[4]_INST_0_i_1_n_0\,
      O => led(4)
    );
\led0_inferred__3/led[4]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => PS_Channel(6),
      I1 => PS_Channel(7),
      I2 => PS_Channel(5),
      I3 => PS_Channel(4),
      O => \led0_inferred__3/led[4]_INST_0_i_1_n_0\
    );
\led[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \led[0]_INST_0_i_1_n_0\,
      I1 => \led[0]_INST_0_i_2_n_0\,
      I2 => \led[0]_INST_0_i_3_n_0\,
      I3 => \led[0]_INST_0_i_4_n_0\,
      I4 => \led[0]_INST_0_i_5_n_0\,
      I5 => \led[0]_INST_0_i_6_n_0\,
      O => led(0)
    );
\led[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => X(12),
      I1 => X(13),
      I2 => X(10),
      I3 => X(11),
      I4 => X(9),
      I5 => X(8),
      O => \led[0]_INST_0_i_1_n_0\
    );
\led[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => X(18),
      I1 => X(19),
      I2 => X(16),
      I3 => X(17),
      I4 => X(15),
      I5 => X(14),
      O => \led[0]_INST_0_i_2_n_0\
    );
\led[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => X(30),
      I1 => X(31),
      I2 => X(28),
      I3 => X(29),
      I4 => X(27),
      I5 => X(26),
      O => \led[0]_INST_0_i_3_n_0\
    );
\led[0]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => X(24),
      I1 => X(25),
      I2 => X(22),
      I3 => X(23),
      I4 => X(21),
      I5 => X(20),
      O => \led[0]_INST_0_i_4_n_0\
    );
\led[0]_INST_0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => X(0),
      I1 => X(1),
      O => \led[0]_INST_0_i_5_n_0\
    );
\led[0]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => X(6),
      I1 => X(7),
      I2 => X(4),
      I3 => X(5),
      I4 => X(3),
      I5 => X(2),
      O => \led[0]_INST_0_i_6_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SD_System_Interconnect_Manager_0_0 is
  port (
    X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Z : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    PS_Channel : in STD_LOGIC_VECTOR ( 7 downto 0 );
    switch0 : in STD_LOGIC;
    PL_Channel : out STD_LOGIC_VECTOR ( 7 downto 0 );
    led : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of SD_System_Interconnect_Manager_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of SD_System_Interconnect_Manager_0_0 : entity is "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of SD_System_Interconnect_Manager_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of SD_System_Interconnect_Manager_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of SD_System_Interconnect_Manager_0_0 : entity is "Interconnect_Manager,Vivado 2024.2";
end SD_System_Interconnect_Manager_0_0;

architecture STRUCTURE of SD_System_Interconnect_Manager_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^led\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^switch0\ : STD_LOGIC;
begin
  PL_Channel(7) <= \<const0>\;
  PL_Channel(6) <= \<const0>\;
  PL_Channel(5) <= \<const0>\;
  PL_Channel(4) <= \<const0>\;
  PL_Channel(3) <= \<const0>\;
  PL_Channel(2) <= \<const0>\;
  PL_Channel(1) <= \<const0>\;
  PL_Channel(0) <= \^switch0\;
  \^switch0\ <= switch0;
  led(7) <= \<const0>\;
  led(6) <= \<const0>\;
  led(5) <= \<const0>\;
  led(4 downto 0) <= \^led\(4 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.SD_System_Interconnect_Manager_0_0_Interconnect_Manager
     port map (
      CMD(7 downto 0) => CMD(7 downto 0),
      PS_Channel(7 downto 0) => PS_Channel(7 downto 0),
      X(31 downto 0) => X(31 downto 0),
      Y(31 downto 0) => Y(31 downto 0),
      Z(31 downto 0) => Z(31 downto 0),
      led(4 downto 0) => \^led\(4 downto 0)
    );
end STRUCTURE;
