read_verilog -container r -libname WORK hls_macc.v
set_top r:/WORK/hls_macc

read_verilog -container i -libname WORK wrappers/0/hls_macc_0_obf_golden_wrap.v
read_verilog -container i -libname WORK hdl2/hls_macc_0_obf_key_0.v
set_top i:/WORK/hls_macc

match

verify

exit

