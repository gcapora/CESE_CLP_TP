-- Archivo: seno.vhd
-- Autor:   Guillermo Caporaletti
-- Resumen: NCO senoidal.
--          Trabajo Final del curso de CLP, CESE, FIUBA, Co18.
-- Fecha:   Junio 2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seno is

    generic (
        BITS_DATO        : positive := 12;  -- Bits del valor-dato de salida
        BITS_MUESTRAS    : positive := 10;  -- Bits necesario para las N muestras
        BITS_INCREMENTO  : positive := 25;  -- Bits del incremento J
        BITS_CONTADOR    : positive := 30   -- Bits del contador del AF
    );
    
    port (
        s_reloj_i        : in  std_logic;
        s_reset_i        : in  std_logic;
        s_habilitar_i    : in  std_logic;
        s_incremento_i   : in  std_logic_vector(BITS_INCREMENTO - 1 downto 0);
        s_seno_o         : out std_logic_vector(BITS_DATO - 1 downto 0)
    );
   
end entity seno;

architecture seno_arq of seno is
    
    signal fase : std_logic_vector(BITS_MUESTRAS - 1 downto 0);
    
begin
   
    AF: entity work.acumulador
        generic map(
            N_BITS_MUESTRAS   => BITS_MUESTRAS,
            J_BITS_INCREMENTO => BITS_INCREMENTO,
            C_BITS_CONTADOR   => BITS_CONTADOR
        ) 
        port map(
            reloj_i     =>  s_reloj_i,
            reset_i     =>  s_reset_i,
            habilitar_i =>  s_habilitar_i,
            incremento_i=>  s_incremento_i,
            fase_o      =>  fase
        );

    CFA: entity work.cfa_seno
        generic map(
            Q_BITS_DATO => BITS_DATO
        )    
        port map(
            reset_i =>  s_reset_i,
            fase_i  =>  fase,
            seno_o  =>  s_seno_o
        );

end architecture seno_arq;
