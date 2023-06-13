-- Archivo: seno_vio.vhd
-- Autor:   Guillermo Caporaletti
-- Resumen: Entidad con VIO de Vivado para probar el NCO senoidal .
--          Trabajo Final del curso de CLP, CESE, FIUBA, Co18.
-- Fecha:   Junio 2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seno_VIO_ILA is
    port (
        vio_reloj_i        : in  std_logic
    );
end entity seno_VIO_ILA;

architecture seno_VIO_ILA_arq of seno_VIO_ILA is

component seno is 
    port (
        s_reloj_i       : in  std_logic;
        s_reset_i       : in  std_logic;
        s_habilitar_i   : in  std_logic;
        s_incremento_i  : in  std_logic_vector(24 downto 0);
        s_seno_o        : out std_logic_vector(11 downto 0)
    );
end component;

COMPONENT vio_0
    PORT (
        clk             : IN  STD_LOGIC;
        probe_in0       : IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe_out0      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1      : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out2      : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
    );
END COMPONENT;

COMPONENT ila_0
    PORT (
        clk             : IN  STD_LOGIC;
        probe0          : IN  STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END COMPONENT;

signal punta_reset      : std_logic;
signal punta_habilitar  : std_logic;
signal punta_incremento : std_logic_vector(24 downto 0);
signal punta_seno       : std_logic_vector(11 downto 0);

begin
   
seno_inst: seno
    port map (
        s_reloj_i       => vio_reloj_i,
        s_reset_i       => punta_reset,
        s_habilitar_i   => punta_habilitar,
        s_incremento_i  => punta_incremento,
        s_seno_o        => punta_seno
    );
        
VIO_inst: vio_0
    PORT MAP (
        clk             => vio_reloj_i,
        probe_in0       => punta_seno,
        probe_out0(0)   => punta_reset,
        probe_out1(0)   => punta_habilitar,
        probe_out2      => punta_incremento
    );
    
ILA_inst: ila_0
    PORT MAP (
        clk             => vio_reloj_i,
        probe0          => punta_seno
    );

end architecture seno_VIO_ILA_arq;
