-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sat Apr 12 01:11:35 2025
-- Host        : LAPTOP-KQ544FO5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/Vivado
--               projects/weak_simulator/weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_uart_tx_0_0/mainDesign_uart_tx_0_0_stub.vhdl}
-- Design      : mainDesign_uart_tx_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mainDesign_uart_tx_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    empty : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rd_en : out STD_LOGIC;
    TXD : out STD_LOGIC
  );

end mainDesign_uart_tx_0_0;

architecture stub of mainDesign_uart_tx_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,empty,data[7:0],rd_en,TXD";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "uart_tx,Vivado 2024.1";
begin
end;
