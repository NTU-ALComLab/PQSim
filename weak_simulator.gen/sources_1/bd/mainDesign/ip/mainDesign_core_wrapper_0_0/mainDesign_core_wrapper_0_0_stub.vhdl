-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Apr 12 01:14:06 2025
-- Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/Vivado
--               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_core_wrapper_0_0/mainDesign_core_wrapper_0_0_stub.vhdl}
-- Design      : mainDesign_core_wrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mainDesign_core_wrapper_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i_rd_en : in STD_LOGIC;
    i_empty : in STD_LOGIC;
    o_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_empty : out STD_LOGIC;
    o_rd_en : out STD_LOGIC
  );

end mainDesign_core_wrapper_0_0;

architecture stub of mainDesign_core_wrapper_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,i_data[7:0],i_rd_en,i_empty,o_data[7:0],o_empty,o_rd_en";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "core_wrapper,Vivado 2024.1";
begin
end;
