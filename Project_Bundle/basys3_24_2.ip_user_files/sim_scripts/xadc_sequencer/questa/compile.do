vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../basys3_24_2.srcs/sources_1/ip/xadc_sequencer/xadc_sequencer.v" \


vlog -work xil_defaultlib \
"glbl.v"

