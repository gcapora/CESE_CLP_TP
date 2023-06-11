ghdl -a ..\Fuentes\senial1.vhd senial1_tb.vhd 
ghdl -s ..\Fuentes\senial1.vhd senial1_tb.vhd 
ghdl -e senial1_tb
ghdl -r senial1_tb --vcd=senial1_tb.vcd --stop-time=6000ns
gtkwave senial1_tb.vcd