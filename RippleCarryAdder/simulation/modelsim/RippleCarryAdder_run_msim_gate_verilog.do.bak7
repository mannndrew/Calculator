transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {RippleCarryAdder.vo}

vlog -vlog01compat -work work +incdir+C:/Users/mannn/Documents/Github/Calculator/RippleCarryAdder {C:/Users/mannn/Documents/Github/Calculator/RippleCarryAdder/tb_RippleCarryAdder.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  tb_RippleCarryAdder

add wave *
view structure
view signals
run -all
