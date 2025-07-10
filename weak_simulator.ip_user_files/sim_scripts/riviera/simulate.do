transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+testfixture  -L xpm -L xil_defaultlib -L fifo_generator_v13_2_10 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.testfixture xil_defaultlib.glbl

do {testfixture.udo}

run 1000ns

endsim

quit -force
