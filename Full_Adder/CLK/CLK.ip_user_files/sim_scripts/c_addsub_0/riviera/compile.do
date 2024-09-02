transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_utils_v3_0_13
vlib riviera/c_reg_fd_v12_0_9
vlib riviera/xbip_dsp48_wrapper_v3_0_6
vlib riviera/xbip_pipe_v3_0_9
vlib riviera/xbip_dsp48_addsub_v3_0_9
vlib riviera/xbip_addsub_v3_0_9
vlib riviera/c_addsub_v12_0_18
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_13 riviera/xbip_utils_v3_0_13
vmap c_reg_fd_v12_0_9 riviera/c_reg_fd_v12_0_9
vmap xbip_dsp48_wrapper_v3_0_6 riviera/xbip_dsp48_wrapper_v3_0_6
vmap xbip_pipe_v3_0_9 riviera/xbip_pipe_v3_0_9
vmap xbip_dsp48_addsub_v3_0_9 riviera/xbip_dsp48_addsub_v3_0_9
vmap xbip_addsub_v3_0_9 riviera/xbip_addsub_v3_0_9
vmap c_addsub_v12_0_18 riviera/c_addsub_v12_0_18
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_13 -93  -incr \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_9 -93  -incr \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -93  -incr \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_9 -93  -incr \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_18 -93  -incr \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../CLK.gen/sources_1/ip/c_addsub_0/sim/c_addsub_0.vhd" \


