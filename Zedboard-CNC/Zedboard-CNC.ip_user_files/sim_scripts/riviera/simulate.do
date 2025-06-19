transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+CNC_Top_wrapper  -L xil_defaultlib -L xpm -L xlconstant_v1_1_9 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.CNC_Top_wrapper xil_defaultlib.glbl

do {CNC_Top_wrapper.udo}

run 1000ns

endsim

quit -force
