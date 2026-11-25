if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog nanoCPU.sv
vlog nanoTB.sv

vsim -onfinish stop -voptargs=+acc=lprn -t ps work.nanoCPU_TB

# nao abrir o codigo fonte quando a simulacao para no $finish / $stop
set PrefSource(OpenOnFinish) 0
set PrefSource(OpenOnBreak)  0

do wave.do

run -all

# se alguma janela de codigo fonte foi aberta, fecha e traz o wave para frente
catch { noview source }
view wave
wave zoom full
