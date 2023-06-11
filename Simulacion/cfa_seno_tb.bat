ghdl -a ..\Fuentes\cfa_seno.vhd cfa_seno_tb.vhd 
ghdl -s ..\Fuentes\cfa_seno.vhd cfa_seno_tb.vhd
ghdl -e cfa_seno_tb
ghdl -r cfa_seno_tb --vcd=cfa_seno_tb.vcd --stop-time=1200ns
gtkwave cfa_seno_tb.vcd