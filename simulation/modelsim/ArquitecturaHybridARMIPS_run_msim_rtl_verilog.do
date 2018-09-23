transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/ProyectosQuartus/ArquitecturaHybridARMIPS {D:/ProyectosQuartus/ArquitecturaHybridARMIPS/Memory.sv}
vlog -sv -work work +incdir+D:/ProyectosQuartus/ArquitecturaHybridARMIPS {D:/ProyectosQuartus/ArquitecturaHybridARMIPS/Fetch.sv}
vlog -sv -work work +incdir+D:/ProyectosQuartus/ArquitecturaHybridARMIPS {D:/ProyectosQuartus/ArquitecturaHybridARMIPS/Sumador.sv}
vlog -sv -work work +incdir+D:/ProyectosQuartus/ArquitecturaHybridARMIPS {D:/ProyectosQuartus/ArquitecturaHybridARMIPS/FetchTB.sv}

