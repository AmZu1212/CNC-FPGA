onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xpm -L xlconstant_v1_1_9 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.CNC_Top_wrapper xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {CNC_Top_wrapper.udo}

run 1000ns

quit -force
