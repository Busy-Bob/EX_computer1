onerror {quit -f}
vlib work
vlog -work work EX_computer1.vo
vlog -work work EX_computer1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.BCD_vlg_vec_tst
vcd file -direction EX_computer1.msim.vcd
vcd add -internal BCD_vlg_vec_tst/*
vcd add -internal BCD_vlg_vec_tst/i1/*
add wave /*
run -all
