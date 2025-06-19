onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib CNC_Top_wrapper_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {CNC_Top_wrapper.udo}

run 1000ns

quit -force
