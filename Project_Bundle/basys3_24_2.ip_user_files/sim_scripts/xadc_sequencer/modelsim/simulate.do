onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.xadc_sequencer xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {xadc_sequencer.udo}

run -all

quit -force
