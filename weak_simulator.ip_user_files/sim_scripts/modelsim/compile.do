vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/fifo_generator_v13_2_10

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap fifo_generator_v13_2_10 modelsim_lib/msim/fifo_generator_v13_2_10

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"../../../weak_simulator.srcs/sources_1/new/define.v" \
"../../../weak_simulator.srcs/sources_1/new/Core.v" \
"../../../weak_simulator.srcs/sources_1/new/LUT_tgate.v" \
"../../../weak_simulator.srcs/sources_1/new/measureClifford.v" \
"../../../weak_simulator.srcs/sources_1/new/core_wrapper.v" \
"../../../weak_simulator.srcs/sources_1/new/uart.v" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/1443/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10  -93  \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/1443/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/1443/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"../../bd/mainDesign/ip/mainDesign_fifo_generator_0_0/sim/mainDesign_fifo_generator_0_0.v" \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/ip/mainDesign_core_wrapper_0_0/sim/mainDesign_core_wrapper_0_0.v" \
"../../bd/mainDesign/ip/mainDesign_uart_tx_0_0/sim/mainDesign_uart_tx_0_0.v" \
"../../bd/mainDesign/ip/mainDesign_uart_rx_0_0/sim/mainDesign_uart_rx_0_0.v" \
"../../bd/mainDesign/ip/mainDesign_clk_wiz_0_0/mainDesign_clk_wiz_0_0_clk_wiz.v" \
"../../bd/mainDesign/ip/mainDesign_clk_wiz_0_0/mainDesign_clk_wiz_0_0.v" \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/sim/mainDesign.v" \
"../../../weak_simulator.gen/sources_1/bd/mainDesign/hdl/mainDesign_wrapper.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv "+incdir+../../../weak_simulator.gen/sources_1/bd/mainDesign/ipshared/3242" \
"../../../weak_simulator.srcs/sim_1/new/testfixture.sv" \

vlog -work xil_defaultlib \
"glbl.v"

