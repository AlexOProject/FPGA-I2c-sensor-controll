onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+design_senzor  -L xil_defaultlib -L secureip -O5 xil_defaultlib.design_senzor

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {design_senzor.udo}

run 1000ns

endsim

quit -force
