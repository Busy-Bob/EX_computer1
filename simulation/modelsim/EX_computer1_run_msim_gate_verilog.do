transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {EX_computer1.vo}

vlog -vlog01compat -work work +incdir+D:/altera/13.0/EX_computer1/simulation/modelsim {D:/altera/13.0/EX_computer1/simulation/modelsim/instrconunit.vt}

vsim -t 1ps -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  instrconunit_vlg_tst

add wave *
view structure
view signals
run 1 ns
