transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_utils_v3_0_13
vlib activehdl/c_reg_fd_v12_0_9
vlib activehdl/xbip_dsp48_wrapper_v3_0_6
vlib activehdl/xbip_pipe_v3_0_9
vlib activehdl/xbip_dsp48_addsub_v3_0_9
vlib activehdl/xbip_addsub_v3_0_9
vlib activehdl/c_addsub_v12_0_18
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_13 activehdl/xbip_utils_v3_0_13
vmap c_reg_fd_v12_0_9 activehdl/c_reg_fd_v12_0_9
vmap xbip_dsp48_wrapper_v3_0_6 activehdl/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_9 activehdl/xbip_pipe_v3_0_9
vmap xbip_dsp48_addsub_v3_0_9 activehdl/xbip_dsp48_addsub_v3_0_9
vmap xbip_addsub_v3_0_9 activehdl/xbip_addsub_v3_0_9
vmap c_addsub_v12_0_18 activehdl/c_addsub_v12_0_18
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_13 -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_9 -93  \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -93  \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_9 -93  \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_18 -93  \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../CLK.gen/sources_1/ip/c_addsub_0/sim/c_addsub_0.vhd" \


