-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Wed Oct 30 14:29:04 2024
-- Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {d:/Vivado
--               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_tx_0_0/mainDesign_uart_tx_0_0_sim_netlist.vhdl}
-- Design      : mainDesign_uart_tx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mainDesign_uart_tx_0_0_uart_tx is
  port (
    rd_en : out STD_LOGIC;
    TXD : out STD_LOGIC;
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rst_n : in STD_LOGIC;
    empty : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of mainDesign_uart_tx_0_0_uart_tx : entity is "uart_tx";
end mainDesign_uart_tx_0_0_uart_tx;

architecture STRUCTURE of mainDesign_uart_tx_0_0_uart_tx is
  signal \^txd\ : STD_LOGIC;
  signal TXD_0 : STD_LOGIC;
  signal TXD_i_10_n_0 : STD_LOGIC;
  signal TXD_i_1_n_0 : STD_LOGIC;
  signal TXD_i_2_n_0 : STD_LOGIC;
  signal TXD_i_3_n_0 : STD_LOGIC;
  signal TXD_i_4_n_0 : STD_LOGIC;
  signal TXD_i_5_n_0 : STD_LOGIC;
  signal TXD_i_7_n_0 : STD_LOGIC;
  signal TXD_i_8_n_0 : STD_LOGIC;
  signal TXD_i_9_n_0 : STD_LOGIC;
  signal \cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[14]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_4\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_reg[14]_i_3_n_3\ : STD_LOGIC;
  signal \cnt_reg[14]_i_3_n_6\ : STD_LOGIC;
  signal \cnt_reg[14]_i_3_n_7\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_4\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_4\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[10]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[11]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[12]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[13]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[14]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[8]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[9]\ : STD_LOGIC;
  signal flag : STD_LOGIC;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal num : STD_LOGIC;
  signal \num[0]_i_1_n_0\ : STD_LOGIC;
  signal \num[1]_i_1_n_0\ : STD_LOGIC;
  signal \num[2]_i_2_n_0\ : STD_LOGIC;
  signal \num[3]_i_1_n_0\ : STD_LOGIC;
  signal \num_reg_n_0_[0]\ : STD_LOGIC;
  signal \num_reg_n_0_[1]\ : STD_LOGIC;
  signal \num_reg_n_0_[2]\ : STD_LOGIC;
  signal \num_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 14 downto 1 );
  signal rd_en_INST_0_i_1_n_0 : STD_LOGIC;
  signal rd_en_INST_0_i_2_n_0 : STD_LOGIC;
  signal rd_en_INST_0_i_3_n_0 : STD_LOGIC;
  signal rd_en_INST_0_i_4_n_0 : STD_LOGIC;
  signal \NLW_cnt_reg[14]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_cnt_reg[14]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of TXD_i_10 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of TXD_i_5 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of TXD_i_7 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of TXD_i_9 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[10]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt[11]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt[12]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt[13]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt[14]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cnt[14]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt[8]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt[9]_i_1\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \cnt_reg[12]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[14]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[4]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \cnt_reg[8]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \num[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \num[2]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \num[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of rd_en_INST_0 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rd_en_INST_0_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of rd_en_INST_0_i_4 : label is "soft_lutpair5";
begin
  TXD <= \^txd\;
TXD_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFEEE0000"
    )
        port map (
      I0 => TXD_i_3_n_0,
      I1 => TXD_i_4_n_0,
      I2 => TXD_i_5_n_0,
      I3 => \num_reg_n_0_[3]\,
      I4 => TXD_0,
      I5 => \^txd\,
      O => TXD_i_1_n_0
    );
TXD_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_reg_n_0_[2]\,
      I1 => \cnt_reg_n_0_[1]\,
      I2 => \cnt_reg_n_0_[10]\,
      I3 => \cnt_reg_n_0_[9]\,
      O => TXD_i_10_n_0
    );
TXD_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => TXD_i_2_n_0
    );
TXD_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF8888888"
    )
        port map (
      I0 => \num_reg_n_0_[3]\,
      I1 => data(7),
      I2 => data(6),
      I3 => \num_reg_n_0_[2]\,
      I4 => TXD_i_7_n_0,
      I5 => TXD_i_8_n_0,
      O => TXD_i_3_n_0
    );
TXD_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000A0ACFC00000"
    )
        port map (
      I0 => data(1),
      I1 => data(4),
      I2 => \num_reg_n_0_[2]\,
      I3 => data(0),
      I4 => \num_reg_n_0_[0]\,
      I5 => \num_reg_n_0_[1]\,
      O => TXD_i_4_n_0
    );
TXD_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \num_reg_n_0_[2]\,
      I1 => \num_reg_n_0_[0]\,
      I2 => \num_reg_n_0_[1]\,
      O => TXD_i_5_n_0
    );
TXD_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => TXD_i_9_n_0,
      I1 => TXD_i_10_n_0,
      I2 => rd_en_INST_0_i_3_n_0,
      I3 => \cnt_reg_n_0_[4]\,
      I4 => \cnt_reg_n_0_[7]\,
      O => TXD_0
    );
TXD_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \num_reg_n_0_[0]\,
      I1 => \num_reg_n_0_[1]\,
      O => TXD_i_7_n_0
    );
TXD_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0C0A0CF0000000"
    )
        port map (
      I0 => data(5),
      I1 => data(3),
      I2 => \num_reg_n_0_[0]\,
      I3 => \num_reg_n_0_[1]\,
      I4 => data(2),
      I5 => \num_reg_n_0_[2]\,
      O => TXD_i_8_n_0
    );
TXD_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => \cnt_reg_n_0_[6]\,
      I1 => \cnt_reg_n_0_[5]\,
      I2 => \cnt_reg_n_0_[8]\,
      I3 => \cnt_reg_n_0_[0]\,
      I4 => \cnt_reg_n_0_[3]\,
      O => TXD_i_9_n_0
    );
TXD_reg: unisim.vcomponents.FDPE
     port map (
      C => clk,
      CE => '1',
      D => TXD_i_1_n_0,
      PRE => TXD_i_2_n_0,
      Q => \^txd\
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => flag,
      I1 => \cnt_reg_n_0_[0]\,
      O => \cnt[0]_i_1_n_0\
    );
\cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[12]_i_2_n_6\,
      O => p_0_in(10)
    );
\cnt[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[12]_i_2_n_5\,
      O => p_0_in(11)
    );
\cnt[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[12]_i_2_n_4\,
      O => p_0_in(12)
    );
\cnt[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[14]_i_3_n_7\,
      O => p_0_in(13)
    );
\cnt[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[14]_i_3_n_6\,
      O => p_0_in(14)
    );
\cnt[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF700000000"
    )
        port map (
      I0 => \cnt_reg_n_0_[7]\,
      I1 => \cnt_reg_n_0_[4]\,
      I2 => rd_en_INST_0_i_3_n_0,
      I3 => TXD_i_10_n_0,
      I4 => \cnt[14]_i_4_n_0\,
      I5 => flag,
      O => \cnt[14]_i_2_n_0\
    );
\cnt[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFF7F"
    )
        port map (
      I0 => \cnt_reg_n_0_[8]\,
      I1 => \cnt_reg_n_0_[5]\,
      I2 => \cnt_reg_n_0_[0]\,
      I3 => \cnt_reg_n_0_[3]\,
      I4 => \cnt_reg_n_0_[6]\,
      O => \cnt[14]_i_4_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[4]_i_2_n_7\,
      O => p_0_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[4]_i_2_n_6\,
      O => p_0_in(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[4]_i_2_n_5\,
      O => p_0_in(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[4]_i_2_n_4\,
      O => p_0_in(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[8]_i_2_n_7\,
      O => p_0_in(5)
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[8]_i_2_n_6\,
      O => p_0_in(6)
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[8]_i_2_n_5\,
      O => p_0_in(7)
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[8]_i_2_n_4\,
      O => p_0_in(8)
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \cnt[14]_i_2_n_0\,
      I1 => \cnt_reg[12]_i_2_n_7\,
      O => p_0_in(9)
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => \cnt[0]_i_1_n_0\,
      Q => \cnt_reg_n_0_[0]\
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(10),
      Q => \cnt_reg_n_0_[10]\
    );
\cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(11),
      Q => \cnt_reg_n_0_[11]\
    );
\cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(12),
      Q => \cnt_reg_n_0_[12]\
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
      O(3) => \cnt_reg[12]_i_2_n_4\,
      O(2) => \cnt_reg[12]_i_2_n_5\,
      O(1) => \cnt_reg[12]_i_2_n_6\,
      O(0) => \cnt_reg[12]_i_2_n_7\,
      S(3) => \cnt_reg_n_0_[12]\,
      S(2) => \cnt_reg_n_0_[11]\,
      S(1) => \cnt_reg_n_0_[10]\,
      S(0) => \cnt_reg_n_0_[9]\
    );
\cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(13),
      Q => \cnt_reg_n_0_[13]\
    );
\cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(14),
      Q => \cnt_reg_n_0_[14]\
    );
\cnt_reg[14]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[12]_i_2_n_0\,
      CO(3 downto 1) => \NLW_cnt_reg[14]_i_3_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \cnt_reg[14]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_cnt_reg[14]_i_3_O_UNCONNECTED\(3 downto 2),
      O(1) => \cnt_reg[14]_i_3_n_6\,
      O(0) => \cnt_reg[14]_i_3_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \cnt_reg_n_0_[14]\,
      S(0) => \cnt_reg_n_0_[13]\
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(1),
      Q => \cnt_reg_n_0_[1]\
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(2),
      Q => \cnt_reg_n_0_[2]\
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(3),
      Q => \cnt_reg_n_0_[3]\
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(4),
      Q => \cnt_reg_n_0_[4]\
    );
\cnt_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_reg[4]_i_2_n_0\,
      CO(2) => \cnt_reg[4]_i_2_n_1\,
      CO(1) => \cnt_reg[4]_i_2_n_2\,
      CO(0) => \cnt_reg[4]_i_2_n_3\,
      CYINIT => \cnt_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => \cnt_reg[4]_i_2_n_4\,
      O(2) => \cnt_reg[4]_i_2_n_5\,
      O(1) => \cnt_reg[4]_i_2_n_6\,
      O(0) => \cnt_reg[4]_i_2_n_7\,
      S(3) => \cnt_reg_n_0_[4]\,
      S(2) => \cnt_reg_n_0_[3]\,
      S(1) => \cnt_reg_n_0_[2]\,
      S(0) => \cnt_reg_n_0_[1]\
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(5),
      Q => \cnt_reg_n_0_[5]\
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(6),
      Q => \cnt_reg_n_0_[6]\
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(7),
      Q => \cnt_reg_n_0_[7]\
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(8),
      Q => \cnt_reg_n_0_[8]\
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
      O(3) => \cnt_reg[8]_i_2_n_4\,
      O(2) => \cnt_reg[8]_i_2_n_5\,
      O(1) => \cnt_reg[8]_i_2_n_6\,
      O(0) => \cnt_reg[8]_i_2_n_7\,
      S(3) => \cnt_reg_n_0_[8]\,
      S(2) => \cnt_reg_n_0_[7]\,
      S(1) => \cnt_reg_n_0_[6]\,
      S(0) => \cnt_reg_n_0_[5]\
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => p_0_in(9),
      Q => \cnt_reg_n_0_[9]\
    );
flag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF0000FFFF"
    )
        port map (
      I0 => \num_reg_n_0_[0]\,
      I1 => \num_reg_n_0_[2]\,
      I2 => \num_reg_n_0_[1]\,
      I3 => \num_reg_n_0_[3]\,
      I4 => empty,
      I5 => flag,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => flag_i_1_n_0,
      Q => flag
    );
\num[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => TXD_0,
      I1 => \num_reg_n_0_[0]\,
      O => \num[0]_i_1_n_0\
    );
\num[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => TXD_0,
      I1 => \num_reg_n_0_[1]\,
      I2 => \num_reg_n_0_[0]\,
      O => \num[1]_i_1_n_0\
    );
\num[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1000"
    )
        port map (
      I0 => \num_reg_n_0_[0]\,
      I1 => \num_reg_n_0_[2]\,
      I2 => \num_reg_n_0_[1]\,
      I3 => \num_reg_n_0_[3]\,
      I4 => TXD_0,
      O => num
    );
\num[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2888"
    )
        port map (
      I0 => TXD_0,
      I1 => \num_reg_n_0_[2]\,
      I2 => \num_reg_n_0_[0]\,
      I3 => \num_reg_n_0_[1]\,
      O => \num[2]_i_2_n_0\
    );
\num[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80EF00"
    )
        port map (
      I0 => \num_reg_n_0_[0]\,
      I1 => \num_reg_n_0_[2]\,
      I2 => \num_reg_n_0_[1]\,
      I3 => \num_reg_n_0_[3]\,
      I4 => TXD_0,
      O => \num[3]_i_1_n_0\
    );
\num_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num,
      CLR => TXD_i_2_n_0,
      D => \num[0]_i_1_n_0\,
      Q => \num_reg_n_0_[0]\
    );
\num_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num,
      CLR => TXD_i_2_n_0,
      D => \num[1]_i_1_n_0\,
      Q => \num_reg_n_0_[1]\
    );
\num_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => num,
      CLR => TXD_i_2_n_0,
      D => \num[2]_i_2_n_0\,
      Q => \num_reg_n_0_[2]\
    );
\num_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => clk,
      CE => '1',
      CLR => TXD_i_2_n_0,
      D => \num[3]_i_1_n_0\,
      Q => \num_reg_n_0_[3]\
    );
rd_en_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => rd_en_INST_0_i_1_n_0,
      I1 => rd_en_INST_0_i_2_n_0,
      I2 => \num_reg_n_0_[1]\,
      I3 => \num_reg_n_0_[0]\,
      I4 => \num_reg_n_0_[2]\,
      O => rd_en
    );
rd_en_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \cnt_reg_n_0_[9]\,
      I1 => \cnt_reg_n_0_[10]\,
      I2 => \cnt_reg_n_0_[1]\,
      I3 => \cnt_reg_n_0_[2]\,
      I4 => rd_en_INST_0_i_3_n_0,
      O => rd_en_INST_0_i_1_n_0
    );
rd_en_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \cnt_reg_n_0_[5]\,
      I1 => \cnt_reg_n_0_[8]\,
      I2 => \cnt_reg_n_0_[7]\,
      I3 => \cnt_reg_n_0_[4]\,
      I4 => \num_reg_n_0_[3]\,
      I5 => rd_en_INST_0_i_4_n_0,
      O => rd_en_INST_0_i_2_n_0
    );
rd_en_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_reg_n_0_[12]\,
      I1 => \cnt_reg_n_0_[11]\,
      I2 => \cnt_reg_n_0_[14]\,
      I3 => \cnt_reg_n_0_[13]\,
      O => rd_en_INST_0_i_3_n_0
    );
rd_en_INST_0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \cnt_reg_n_0_[6]\,
      I1 => \cnt_reg_n_0_[3]\,
      I2 => \cnt_reg_n_0_[0]\,
      O => rd_en_INST_0_i_4_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mainDesign_uart_tx_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    empty : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rd_en : out STD_LOGIC;
    TXD : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mainDesign_uart_tx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of mainDesign_uart_tx_0_0 : entity is "mainDesign_uart_tx_0_0,uart_tx,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of mainDesign_uart_tx_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of mainDesign_uart_tx_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of mainDesign_uart_tx_0_0 : entity is "uart_tx,Vivado 2024.1";
end mainDesign_uart_tx_0_0;

architecture STRUCTURE of mainDesign_uart_tx_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.mainDesign_uart_tx_0_0_uart_tx
     port map (
      TXD => TXD,
      clk => clk,
      data(7 downto 0) => data(7 downto 0),
      empty => empty,
      rd_en => rd_en,
      rst_n => rst_n
    );
end STRUCTURE;
