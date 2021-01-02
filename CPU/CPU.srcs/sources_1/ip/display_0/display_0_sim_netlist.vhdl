-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Nov 25 09:14:25 2020
-- Host        : DESKTOP-AM4RCB5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Vivado_project/CPU/CPU.srcs/sources_1/ip/display_0/display_0_sim_netlist.vhdl
-- Design      : display_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_0_display is
  port (
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sm_duan : out STD_LOGIC_VECTOR ( 6 downto 0 );
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of display_0_display : entity is "display";
end display_0_display;

architecture STRUCTURE of display_0_display is
  signal \^q\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_400Hz : STD_LOGIC;
  signal clk_400Hz_1 : STD_LOGIC;
  signal clk_400Hz_i_1_n_0 : STD_LOGIC;
  signal clk_cnt : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \clk_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__1_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__1_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__2_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__2_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__2_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__2_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__3_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__3_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__3_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__3_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__4_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__4_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__4_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__4_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__5_n_0\ : STD_LOGIC;
  signal \clk_cnt0_carry__5_n_1\ : STD_LOGIC;
  signal \clk_cnt0_carry__5_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__5_n_3\ : STD_LOGIC;
  signal \clk_cnt0_carry__6_n_2\ : STD_LOGIC;
  signal \clk_cnt0_carry__6_n_3\ : STD_LOGIC;
  signal clk_cnt0_carry_n_0 : STD_LOGIC;
  signal clk_cnt0_carry_n_1 : STD_LOGIC;
  signal clk_cnt0_carry_n_2 : STD_LOGIC;
  signal clk_cnt0_carry_n_3 : STD_LOGIC;
  signal \clk_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_7_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_8_n_0\ : STD_LOGIC;
  signal \clk_cnt[0]_i_9_n_0\ : STD_LOGIC;
  signal clk_cnt_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal data0 : STD_LOGIC_VECTOR ( 31 downto 1 );
  signal duan_ctrl : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \sm_duan[6]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \sm_duan[6]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \sm_duan[6]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \sm_duan[6]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \NLW_clk_cnt0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_clk_cnt0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk_400Hz_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \clk_cnt[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \sm_duan[0]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sm_duan[1]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \sm_duan[2]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sm_duan[3]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sm_duan[5]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sm_duan[6]_INST_0\ : label is "soft_lutpair1";
begin
  Q(3 downto 0) <= \^q\(3 downto 0);
clk_400Hz_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => clk_cnt(0),
      I1 => \clk_cnt[0]_i_4_n_0\,
      I2 => \clk_cnt[0]_i_3_n_0\,
      I3 => \clk_cnt[0]_i_2_n_0\,
      I4 => clk_400Hz,
      O => clk_400Hz_i_1_n_0
    );
clk_400Hz_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => clk_400Hz_i_1_n_0,
      Q => clk_400Hz,
      R => '0'
    );
clk_cnt0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => clk_cnt0_carry_n_0,
      CO(2) => clk_cnt0_carry_n_1,
      CO(1) => clk_cnt0_carry_n_2,
      CO(0) => clk_cnt0_carry_n_3,
      CYINIT => clk_cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => clk_cnt(4 downto 1)
    );
\clk_cnt0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => clk_cnt0_carry_n_0,
      CO(3) => \clk_cnt0_carry__0_n_0\,
      CO(2) => \clk_cnt0_carry__0_n_1\,
      CO(1) => \clk_cnt0_carry__0_n_2\,
      CO(0) => \clk_cnt0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => clk_cnt(8 downto 5)
    );
\clk_cnt0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__0_n_0\,
      CO(3) => \clk_cnt0_carry__1_n_0\,
      CO(2) => \clk_cnt0_carry__1_n_1\,
      CO(1) => \clk_cnt0_carry__1_n_2\,
      CO(0) => \clk_cnt0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => clk_cnt(12 downto 9)
    );
\clk_cnt0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__1_n_0\,
      CO(3) => \clk_cnt0_carry__2_n_0\,
      CO(2) => \clk_cnt0_carry__2_n_1\,
      CO(1) => \clk_cnt0_carry__2_n_2\,
      CO(0) => \clk_cnt0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => clk_cnt(16 downto 13)
    );
\clk_cnt0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__2_n_0\,
      CO(3) => \clk_cnt0_carry__3_n_0\,
      CO(2) => \clk_cnt0_carry__3_n_1\,
      CO(1) => \clk_cnt0_carry__3_n_2\,
      CO(0) => \clk_cnt0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => clk_cnt(20 downto 17)
    );
\clk_cnt0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__3_n_0\,
      CO(3) => \clk_cnt0_carry__4_n_0\,
      CO(2) => \clk_cnt0_carry__4_n_1\,
      CO(1) => \clk_cnt0_carry__4_n_2\,
      CO(0) => \clk_cnt0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => clk_cnt(24 downto 21)
    );
\clk_cnt0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__4_n_0\,
      CO(3) => \clk_cnt0_carry__5_n_0\,
      CO(2) => \clk_cnt0_carry__5_n_1\,
      CO(1) => \clk_cnt0_carry__5_n_2\,
      CO(0) => \clk_cnt0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(28 downto 25),
      S(3 downto 0) => clk_cnt(28 downto 25)
    );
\clk_cnt0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \clk_cnt0_carry__5_n_0\,
      CO(3 downto 2) => \NLW_clk_cnt0_carry__6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \clk_cnt0_carry__6_n_2\,
      CO(0) => \clk_cnt0_carry__6_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_clk_cnt0_carry__6_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(31 downto 29),
      S(3) => '0',
      S(2 downto 0) => clk_cnt(31 downto 29)
    );
\clk_cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => \clk_cnt[0]_i_2_n_0\,
      I1 => \clk_cnt[0]_i_3_n_0\,
      I2 => \clk_cnt[0]_i_4_n_0\,
      I3 => clk_cnt(0),
      O => clk_cnt_0(0)
    );
\clk_cnt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \clk_cnt[0]_i_5_n_0\,
      I1 => \clk_cnt[0]_i_6_n_0\,
      I2 => clk_cnt(31),
      I3 => clk_cnt(30),
      I4 => clk_cnt(1),
      I5 => \clk_cnt[0]_i_7_n_0\,
      O => \clk_cnt[0]_i_2_n_0\
    );
\clk_cnt[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFB"
    )
        port map (
      I0 => clk_cnt(4),
      I1 => clk_cnt(5),
      I2 => clk_cnt(2),
      I3 => clk_cnt(3),
      I4 => \clk_cnt[0]_i_8_n_0\,
      O => \clk_cnt[0]_i_3_n_0\
    );
\clk_cnt[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => clk_cnt(12),
      I1 => clk_cnt(13),
      I2 => clk_cnt(11),
      I3 => clk_cnt(10),
      I4 => \clk_cnt[0]_i_9_n_0\,
      O => \clk_cnt[0]_i_4_n_0\
    );
\clk_cnt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_cnt(23),
      I1 => clk_cnt(22),
      I2 => clk_cnt(25),
      I3 => clk_cnt(24),
      O => \clk_cnt[0]_i_5_n_0\
    );
\clk_cnt[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_cnt(19),
      I1 => clk_cnt(18),
      I2 => clk_cnt(21),
      I3 => clk_cnt(20),
      O => \clk_cnt[0]_i_6_n_0\
    );
\clk_cnt[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => clk_cnt(27),
      I1 => clk_cnt(26),
      I2 => clk_cnt(29),
      I3 => clk_cnt(28),
      O => \clk_cnt[0]_i_7_n_0\
    );
\clk_cnt[0]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => clk_cnt(7),
      I1 => clk_cnt(6),
      I2 => clk_cnt(9),
      I3 => clk_cnt(8),
      O => \clk_cnt[0]_i_8_n_0\
    );
\clk_cnt[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => clk_cnt(15),
      I1 => clk_cnt(14),
      I2 => clk_cnt(16),
      I3 => clk_cnt(17),
      O => \clk_cnt[0]_i_9_n_0\
    );
\clk_cnt[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => clk_cnt(0),
      I1 => \clk_cnt[0]_i_4_n_0\,
      I2 => \clk_cnt[0]_i_3_n_0\,
      I3 => \clk_cnt[0]_i_2_n_0\,
      O => clk_400Hz_1
    );
\clk_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => clk_cnt_0(0),
      Q => clk_cnt(0),
      R => '0'
    );
\clk_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(10),
      Q => clk_cnt(10),
      R => clk_400Hz_1
    );
\clk_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(11),
      Q => clk_cnt(11),
      R => clk_400Hz_1
    );
\clk_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(12),
      Q => clk_cnt(12),
      R => clk_400Hz_1
    );
\clk_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(13),
      Q => clk_cnt(13),
      R => clk_400Hz_1
    );
\clk_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(14),
      Q => clk_cnt(14),
      R => clk_400Hz_1
    );
\clk_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(15),
      Q => clk_cnt(15),
      R => clk_400Hz_1
    );
\clk_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(16),
      Q => clk_cnt(16),
      R => clk_400Hz_1
    );
\clk_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(17),
      Q => clk_cnt(17),
      R => clk_400Hz_1
    );
\clk_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(18),
      Q => clk_cnt(18),
      R => clk_400Hz_1
    );
\clk_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(19),
      Q => clk_cnt(19),
      R => clk_400Hz_1
    );
\clk_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(1),
      Q => clk_cnt(1),
      R => clk_400Hz_1
    );
\clk_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(20),
      Q => clk_cnt(20),
      R => clk_400Hz_1
    );
\clk_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(21),
      Q => clk_cnt(21),
      R => clk_400Hz_1
    );
\clk_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(22),
      Q => clk_cnt(22),
      R => clk_400Hz_1
    );
\clk_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(23),
      Q => clk_cnt(23),
      R => clk_400Hz_1
    );
\clk_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(24),
      Q => clk_cnt(24),
      R => clk_400Hz_1
    );
\clk_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(25),
      Q => clk_cnt(25),
      R => clk_400Hz_1
    );
\clk_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(26),
      Q => clk_cnt(26),
      R => clk_400Hz_1
    );
\clk_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(27),
      Q => clk_cnt(27),
      R => clk_400Hz_1
    );
\clk_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(28),
      Q => clk_cnt(28),
      R => clk_400Hz_1
    );
\clk_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(29),
      Q => clk_cnt(29),
      R => clk_400Hz_1
    );
\clk_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(2),
      Q => clk_cnt(2),
      R => clk_400Hz_1
    );
\clk_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(30),
      Q => clk_cnt(30),
      R => clk_400Hz_1
    );
\clk_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(31),
      Q => clk_cnt(31),
      R => clk_400Hz_1
    );
\clk_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(3),
      Q => clk_cnt(3),
      R => clk_400Hz_1
    );
\clk_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(4),
      Q => clk_cnt(4),
      R => clk_400Hz_1
    );
\clk_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(5),
      Q => clk_cnt(5),
      R => clk_400Hz_1
    );
\clk_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(6),
      Q => clk_cnt(6),
      R => clk_400Hz_1
    );
\clk_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(7),
      Q => clk_cnt(7),
      R => clk_400Hz_1
    );
\clk_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(8),
      Q => clk_cnt(8),
      R => clk_400Hz_1
    );
\clk_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data0(9),
      Q => clk_cnt(9),
      R => clk_400Hz_1
    );
\sm_duan[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2894"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(2),
      I2 => duan_ctrl(0),
      I3 => duan_ctrl(1),
      O => sm_duan(0)
    );
\sm_duan[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A4C8"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(2),
      I2 => duan_ctrl(1),
      I3 => duan_ctrl(0),
      O => sm_duan(1)
    );
\sm_duan[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A210"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(0),
      I2 => duan_ctrl(1),
      I3 => duan_ctrl(2),
      O => sm_duan(2)
    );
\sm_duan[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C214"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(2),
      I2 => duan_ctrl(0),
      I3 => duan_ctrl(1),
      O => sm_duan(3)
    );
\sm_duan[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5710"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(1),
      I2 => duan_ctrl(2),
      I3 => duan_ctrl(0),
      O => sm_duan(4)
    );
\sm_duan[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5190"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(2),
      I2 => duan_ctrl(0),
      I3 => duan_ctrl(1),
      O => sm_duan(5)
    );
\sm_duan[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4025"
    )
        port map (
      I0 => duan_ctrl(3),
      I1 => duan_ctrl(0),
      I2 => duan_ctrl(2),
      I3 => duan_ctrl(1),
      O => sm_duan(6)
    );
\sm_duan[6]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4F45"
    )
        port map (
      I0 => \^q\(2),
      I1 => data(11),
      I2 => \^q\(3),
      I3 => data(15),
      I4 => \sm_duan[6]_INST_0_i_5_n_0\,
      O => duan_ctrl(3)
    );
\sm_duan[6]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4F45"
    )
        port map (
      I0 => \^q\(2),
      I1 => data(8),
      I2 => \^q\(3),
      I3 => data(12),
      I4 => \sm_duan[6]_INST_0_i_6_n_0\,
      O => duan_ctrl(0)
    );
\sm_duan[6]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4F45"
    )
        port map (
      I0 => \^q\(2),
      I1 => data(10),
      I2 => \^q\(3),
      I3 => data(14),
      I4 => \sm_duan[6]_INST_0_i_7_n_0\,
      O => duan_ctrl(2)
    );
\sm_duan[6]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4F45"
    )
        port map (
      I0 => \^q\(2),
      I1 => data(9),
      I2 => \^q\(3),
      I3 => data(13),
      I4 => \sm_duan[6]_INST_0_i_8_n_0\,
      O => duan_ctrl(1)
    );
\sm_duan[6]_INST_0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D5FF7F9595FF7F"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => data(7),
      I4 => \^q\(1),
      I5 => data(3),
      O => \sm_duan[6]_INST_0_i_5_n_0\
    );
\sm_duan[6]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D5FF7F9595FF7F"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => data(4),
      I4 => \^q\(1),
      I5 => data(0),
      O => \sm_duan[6]_INST_0_i_6_n_0\
    );
\sm_duan[6]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D5FF7F9595FF7F"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => data(6),
      I4 => \^q\(1),
      I5 => data(2),
      O => \sm_duan[6]_INST_0_i_7_n_0\
    );
\sm_duan[6]_INST_0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D5FF7F9595FF7F"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => data(5),
      I4 => \^q\(1),
      I5 => data(1),
      O => \sm_duan[6]_INST_0_i_8_n_0\
    );
\wei_ctrl_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_400Hz,
      CE => '1',
      D => \^q\(3),
      Q => \^q\(0),
      R => '0'
    );
\wei_ctrl_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_400Hz,
      CE => '1',
      D => \^q\(0),
      Q => \^q\(1),
      R => '0'
    );
\wei_ctrl_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_400Hz,
      CE => '1',
      D => \^q\(1),
      Q => \^q\(2),
      R => '0'
    );
\wei_ctrl_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_400Hz,
      CE => '1',
      D => \^q\(2),
      Q => \^q\(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity display_0 is
  port (
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sm_wei : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sm_duan : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of display_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of display_0 : entity is "display_0,display,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of display_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of display_0 : entity is "display,Vivado 2017.4";
end display_0;

architecture STRUCTURE of display_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000";
begin
inst: entity work.display_0_display
     port map (
      Q(3 downto 0) => sm_wei(3 downto 0),
      clk => clk,
      data(15 downto 0) => data(15 downto 0),
      sm_duan(6 downto 0) => sm_duan(6 downto 0)
    );
end STRUCTURE;
