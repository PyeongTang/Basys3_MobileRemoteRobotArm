vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../basys3_24_2.srcs/sources_1/ip/xadc_wiz_0_1/xadc_wiz_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

