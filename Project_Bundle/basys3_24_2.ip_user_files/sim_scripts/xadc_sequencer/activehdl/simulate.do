onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+xadc_sequencer -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.xadc_sequencer xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {xadc_sequencer.udo}

run -all

endsim

quit -force
