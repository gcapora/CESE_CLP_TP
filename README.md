# Oscilador senoidal controlado numéricamente (NCO senoidal)
Por Guillermo F. Caporaletti, <gfcaporaletti@fi.uba.ar>, 2023. 
Curso de Circuitos Lógicos Programables de CESE-FIUBA.

## Carpetas y archivos

- Documentos: Incluye informe teórico-práctico y presentación sobre este proyecto.
- Fuentes: Tiene todos los archivos fuente del oscilador. 
 - senial1.hvd      Tiene una versión anterior, pero lo dejamos para comparar.
 - cfa_seno.vhd     Implementa una TdB (o LUT) con 1024 valores de una señal senoidal.
 - acumulador.vhd   Tiene como entrada el reloj y el incremento, y devuelve un valor de fase (entre 0 y 1023).
 - seno.vhd         Es la entidad fundamental del NCO.
 - seno_vio_ila.vhd Incluye a seno.vhd y agrega núcleos IP para visualizar remotamente el resultado en hardware.
- Herramientas: Implementa una función dec2bin con punto fraccional en Scilab.
- Simulacion: Incluye las simulaciones para GTKwave.
- Vivado_ILA: Proyecto que integra a seno_vio_ila.vhd en la placa Arty Z7-10.