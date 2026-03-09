transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+CNC_Top  -L xil_defaultlib -L xpm -L xlconstant_v1_1_9 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.CNC_Top xil_defaultlib.glbl

do {CNC_Top.udo}

run 1000ns

endsim

quit -force
