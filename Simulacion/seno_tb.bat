ghdl -a ..\Fuentes\cfa_seno.vhd ..\Fuentes\acumulador.vhd ..\Fuentes\seno.vhd seno_tb.vhd
ghdl -s ..\Fuentes\cfa_seno.vhd ..\Fuentes\acumulador.vhd ..\Fuentes\seno.vhd seno_tb.vhd
ghdl -e seno_tb
ghdl -r seno_tb --vcd=seno_tb.vcd --stop-time=10us
gtkwave seno_tb.vcd
