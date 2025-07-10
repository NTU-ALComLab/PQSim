-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Apr 12 01:11:35 2025
-- Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {d:/Vivado
--               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_rx_0_0/mainDesign_uart_rx_0_0_sim_netlist.vhdl}
-- Design      : mainDesign_uart_rx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mainDesign_uart_rx_0_0_uart_rx is
  port (
    data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : out STD_LOGIC;
    clk : in STD_LOGIC;
    RXD : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mainDesign_uart_rx_0_0_uart_rx : entity is "uart_rx";
end mainDesign_uart_rx_0_0_uart_rx;

architecture STRUCTURE of mainDesign_uart_rx_0_0_uart_rx is
  signal cnt : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[10]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[11]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[13]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_3_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_4_n_0\ : STD_LOGIC;
  signal \cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[9]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[14]_i_5_n_3\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal \data[7]_i_2_n_0\ : STD_LOGIC;
  signal \data[7]_i_3_n_0\ : STD_LOGIC;
  signal \data[7]_i_4_n_0\ : STD_LOGIC;
  signal data_1 : STD_LOGIC;
  signal data_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \data_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[0]_i_2_n_0\ : STD_LOGIC;
  signal \data_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[4]_i_2_n_0\ : STD_LOGIC;
  signal \data_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \data_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \data_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \data_r[7]_i_2_n_0\ : STD_LOGIC;
  signal flag : STD_LOGIC;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal num : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \num[0]_i_1_n_0\ : STD_LOGIC;
  signal \num[1]_i_1_n_0\ : STD_LOGIC;
  signal \num[2]_i_2_n_0\ : STD_LOGIC;
  signal \num[3]_i_1_n_0\ : STD_LOGIC;
  signal num_0 : STD_LOGIC;
  signal p_7_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rxd_r : STD_LOGIC;
  signal wr_en_i_1_n_0 : STD_LOGIC;
  signal \NLW_cnt_reg[14]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_cnt_reg[14]_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt[14]_i_4\ : label is "soft_lutpair4";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[14]_i_5\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[8]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \data[7]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \data[7]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \data_r[0]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \data_r[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \data_r[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_r[5]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \data_r[6]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of flag_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \num[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \num[2]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \num[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of wr_en_i_1 : label is "soft_lutpair0";
begin
\cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => flag,
      I1 => cnt(0),
      O => \cnt[0]_i_1_n_0\
    );
\cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(10),
      O => \cnt[10]_i_1_n_0\
    );
\cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(11),
      O => \cnt[11]_i_1_n_0\
    );
\cnt[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(12),
      O => \cnt[12]_i_1_n_0\
    );
\cnt[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(13),
      O => \cnt[13]_i_1_n_0\
    );
\cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(14),
      O => \cnt[14]_i_1_n_0\
    );
\cnt[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => cnt(13),
      I1 => cnt(14),
      I2 => cnt(11),
      I3 => cnt(12),
      I4 => cnt(2),
      I5 => cnt(1),
      O => \cnt[14]_i_2_n_0\
    );
\cnt[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => cnt(7),
      I1 => cnt(4),
      I2 => cnt(10),
      I3 => cnt(9),
      O => \cnt[14]_i_3_n_0\
    );
\cnt[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDFFF"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(6),
      I2 => cnt(8),
      I3 => cnt(5),
      I4 => cnt(3),
      O => \cnt[14]_i_4_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(1),
      O => \cnt[1]_i_1_n_0\
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(2),
      O => \cnt[2]_i_1_n_0\
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(3),
      O => \cnt[3]_i_1_n_0\
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(4),
      O => \cnt[4]_i_1_n_0\
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(5),
      O => \cnt[5]_i_1_n_0\
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(6),
      O => \cnt[6]_i_1_n_0\
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(7),
      O => \cnt[7]_i_1_n_0\
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(8),
      O => \cnt[8]_i_1_n_0\
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000000"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt[14]_i_3_n_0\,
      I2 => \cnt[14]_i_4_n_0\,
      I3 => flag,
      I4 => data0(9),
      O => \cnt[9]_i_1_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[0]_i_1_n_0\,
      Q => cnt(0)
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[10]_i_1_n_0\,
      Q => cnt(10)
    );
\cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[11]_i_1_n_0\,
      Q => cnt(11)
    );
\cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[12]_i_1_n_0\,
      Q => cnt(12)
    );
\cnt_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[8]_i_2_n_0\,
      CO(3) => \cnt_reg[12]_i_2_n_0\,
      CO(2) => \cnt_reg[12]_i_2_n_1\,
      CO(1) => \cnt_reg[12]_i_2_n_2\,
      CO(0) => \cnt_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => cnt(12 downto 9)
    );
\cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[13]_i_1_n_0\,
      Q => cnt(13)
    );
\cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[14]_i_1_n_0\,
      Q => cnt(14)
    );
\cnt_reg[14]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[12]_i_2_n_0\,
      CO(3 downto 1) => \NLW_cnt_reg[14]_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \cnt_reg[14]_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_cnt_reg[14]_i_5_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => data0(14 downto 13),
      S(3 downto 2) => B"00",
      S(1 downto 0) => cnt(14 downto 13)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[1]_i_1_n_0\,
      Q => cnt(1)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[2]_i_1_n_0\,
      Q => cnt(2)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[3]_i_1_n_0\,
      Q => cnt(3)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[4]_i_1_n_0\,
      Q => cnt(4)
    );
\cnt_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_reg[4]_i_2_n_0\,
      CO(2) => \cnt_reg[4]_i_2_n_1\,
      CO(1) => \cnt_reg[4]_i_2_n_2\,
      CO(0) => \cnt_reg[4]_i_2_n_3\,
      CYINIT => cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => cnt(4 downto 1)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[5]_i_1_n_0\,
      Q => cnt(5)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[6]_i_1_n_0\,
      Q => cnt(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[7]_i_1_n_0\,
      Q => cnt(7)
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[8]_i_1_n_0\,
      Q => cnt(8)
    );
\cnt_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[4]_i_2_n_0\,
      CO(3) => \cnt_reg[8]_i_2_n_0\,
      CO(2) => \cnt_reg[8]_i_2_n_1\,
      CO(1) => \cnt_reg[8]_i_2_n_2\,
      CO(0) => \cnt_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => cnt(8 downto 5)
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \cnt[9]_i_1_n_0\,
      Q => cnt(9)
    );
\data[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00200000"
    )
        port map (
      I0 => num(3),
      I1 => num(2),
      I2 => num(0),
      I3 => num(1),
      I4 => \data[7]_i_3_n_0\,
      O => data_1
    );
\data[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \data[7]_i_2_n_0\
    );
\data[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \data[7]_i_4_n_0\,
      I1 => cnt(8),
      I2 => \cnt[14]_i_2_n_0\,
      I3 => \cnt[14]_i_3_n_0\,
      O => \data[7]_i_3_n_0\
    );
\data[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => cnt(5),
      I1 => cnt(6),
      I2 => cnt(0),
      I3 => cnt(3),
      O => \data[7]_i_4_n_0\
    );
\data_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFF00080000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(0),
      I2 => num(1),
      I3 => num(2),
      I4 => \data_r[0]_i_2_n_0\,
      I5 => data_r(0),
      O => \data_r[0]_i_1_n_0\
    );
\data_r[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \cnt[14]_i_3_n_0\,
      I1 => \cnt[14]_i_2_n_0\,
      I2 => cnt(8),
      I3 => \data[7]_i_4_n_0\,
      I4 => num(3),
      O => \data_r[0]_i_2_n_0\
    );
\data_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(2),
      I2 => \data_r[5]_i_2_n_0\,
      I3 => num(3),
      I4 => \data[7]_i_3_n_0\,
      I5 => data_r(1),
      O => \data_r[1]_i_1_n_0\
    );
\data_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(2),
      I2 => \data_r[6]_i_2_n_0\,
      I3 => num(3),
      I4 => \data[7]_i_3_n_0\,
      I5 => data_r(2),
      O => \data_r[2]_i_1_n_0\
    );
\data_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(1),
      I2 => num(0),
      I3 => \data_r[4]_i_2_n_0\,
      I4 => data_r(3),
      O => \data_r[3]_i_1_n_0\
    );
\data_r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(1),
      I2 => num(0),
      I3 => \data_r[4]_i_2_n_0\,
      I4 => data_r(4),
      O => \data_r[4]_i_1_n_0\
    );
\data_r[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => num(3),
      I1 => \data[7]_i_4_n_0\,
      I2 => cnt(8),
      I3 => \cnt[14]_i_2_n_0\,
      I4 => \cnt[14]_i_3_n_0\,
      I5 => num(2),
      O => \data_r[4]_i_2_n_0\
    );
\data_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(2),
      I2 => \data[7]_i_3_n_0\,
      I3 => num(3),
      I4 => \data_r[5]_i_2_n_0\,
      I5 => data_r(5),
      O => \data_r[5]_i_1_n_0\
    );
\data_r[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num(1),
      I1 => num(0),
      O => \data_r[5]_i_2_n_0\
    );
\data_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => num(2),
      I2 => \data[7]_i_3_n_0\,
      I3 => num(3),
      I4 => \data_r[6]_i_2_n_0\,
      I5 => data_r(6),
      O => \data_r[6]_i_1_n_0\
    );
\data_r[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => num(0),
      I1 => num(1),
      O => \data_r[6]_i_2_n_0\
    );
\data_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFF00080000"
    )
        port map (
      I0 => p_7_in(0),
      I1 => \data_r[7]_i_2_n_0\,
      I2 => num(0),
      I3 => num(1),
      I4 => \data[7]_i_3_n_0\,
      I5 => data_r(7),
      O => \data_r[7]_i_1_n_0\
    );
\data_r[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => num(3),
      I1 => num(2),
      O => \data_r[7]_i_2_n_0\
    );
\data_r_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[0]_i_1_n_0\,
      Q => data_r(0)
    );
\data_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[1]_i_1_n_0\,
      Q => data_r(1)
    );
\data_r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[2]_i_1_n_0\,
      Q => data_r(2)
    );
\data_r_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[3]_i_1_n_0\,
      Q => data_r(3)
    );
\data_r_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[4]_i_1_n_0\,
      Q => data_r(4)
    );
\data_r_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[5]_i_1_n_0\,
      Q => data_r(5)
    );
\data_r_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[6]_i_1_n_0\,
      Q => data_r(6)
    );
\data_r_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \data_r[7]_i_1_n_0\,
      Q => data_r(7)
    );
\data_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(0),
      Q => data(0)
    );
\data_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(1),
      Q => data(1)
    );
\data_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(2),
      Q => data(2)
    );
\data_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(3),
      Q => data(3)
    );
\data_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(4),
      Q => data(4)
    );
\data_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(5),
      Q => data(5)
    );
\data_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(6),
      Q => data(6)
    );
\data_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => data_1,
      CLR => \data[7]_i_2_n_0\,
      D => data_r(7),
      Q => data(7)
    );
flag_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7530"
    )
        port map (
      I0 => wr_en_i_1_n_0,
      I1 => rxd_r,
      I2 => p_7_in(0),
      I3 => flag,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => flag_i_1_n_0,
      Q => flag
    );
\num[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \data[7]_i_3_n_0\,
      I1 => num(0),
      O => \num[0]_i_1_n_0\
    );
\num[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \data[7]_i_3_n_0\,
      I1 => num(1),
      I2 => num(0),
      O => \num[1]_i_1_n_0\
    );
\num[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => num(1),
      I1 => num(0),
      I2 => num(3),
      I3 => num(2),
      I4 => \data[7]_i_3_n_0\,
      O => num_0
    );
\num[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => \data[7]_i_3_n_0\,
      I1 => num(2),
      I2 => num(0),
      I3 => num(1),
      O => \num[2]_i_2_n_0\
    );
\num[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"78F0F0D0"
    )
        port map (
      I0 => num(1),
      I1 => num(0),
      I2 => num(3),
      I3 => num(2),
      I4 => \data[7]_i_3_n_0\,
      O => \num[3]_i_1_n_0\
    );
\num_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num_0,
      CLR => \data[7]_i_2_n_0\,
      D => \num[0]_i_1_n_0\,
      Q => num(0)
    );
\num_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num_0,
      CLR => \data[7]_i_2_n_0\,
      D => \num[1]_i_1_n_0\,
      Q => num(1)
    );
\num_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num_0,
      CLR => \data[7]_i_2_n_0\,
      D => \num[2]_i_2_n_0\,
      Q => num(2)
    );
\num_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => \num[3]_i_1_n_0\,
      Q => num(3)
    );
rxd_r_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => RXD,
      Q => rxd_r,
      R => '0'
    );
rxd_rr_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => rxd_r,
      Q => p_7_in(0),
      R => '0'
    );
wr_en_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => num(2),
      I1 => num(3),
      I2 => num(0),
      I3 => num(1),
      O => wr_en_i_1_n_0
    );
wr_en_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => \data[7]_i_2_n_0\,
      D => wr_en_i_1_n_0,
      Q => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mainDesign_uart_rx_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    RXD : in STD_LOGIC;
    data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mainDesign_uart_rx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mainDesign_uart_rx_0_0 : entity is "mainDesign_uart_rx_0_0,uart_rx,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of mainDesign_uart_rx_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of mainDesign_uart_rx_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of mainDesign_uart_rx_0_0 : entity is "uart_rx,Vivado 2024.1";
end mainDesign_uart_rx_0_0;

architecture STRUCTURE of mainDesign_uart_rx_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.mainDesign_uart_rx_0_0_uart_rx
     port map (
      RXD => RXD,
      clk => clk,
      data(7 downto 0) => data(7 downto 0),
      rst_n => rst_n,
      wr_en => wr_en
    );
end STRUCTURE;
