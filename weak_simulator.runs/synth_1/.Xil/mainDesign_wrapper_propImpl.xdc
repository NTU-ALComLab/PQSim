set_property SRC_FILE_INFO {cfile:{D:/Vivado projects/constraint_file/example/Nexys-Video-Master.xdc} rfile:../../../../constraint_file/example/Nexys-Video-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R4    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L13P_T2_MRCC_34 Sch=sysclk
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E22  IOSTANDARD LVCMOS12 } [get_ports { SW_rst_n }]; #IO_L22P_T3_16 Sch=sw[0]
set_property src_info {type:XDC file:1 line:153 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AA19  IOSTANDARD LVCMOS33 } [get_ports { TXD }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=uart_rx_out
set_property src_info {type:XDC file:1 line:154 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS33 } [get_ports { RXD }]; #IO_L14P_T2_SRCC_14 Sch=uart_tx_in
