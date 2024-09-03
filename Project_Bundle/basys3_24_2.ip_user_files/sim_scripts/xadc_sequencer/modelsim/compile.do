vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../basys3_24_2.srcs/sources_1/ip/xadc_sequencer/xadc_sequencer.v" \


vlog -work xil_defaultlib \
"glbl.v"

