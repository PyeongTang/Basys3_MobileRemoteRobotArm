vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../basys3_24_2.srcs/sources_1/ip/xadc_sequencer/xadc_sequencer.v" \


vlog -work xil_defaultlib \
"glbl.v"

