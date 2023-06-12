-- Archivo: acumulador.vhd
-- Autor:   Guillermo Caporaletti
-- Resumen: Acumulador de Fase para un NCO.
--          Trabajo Final del curso de CLP, CESE, FIUBA, Co18.
-- Fecha:   Junio 2023

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity acumulador is
    generic (
        N_BITS_MUESTRAS     : positive := 10;  -- Bits necesario para las N muestras
        J_BITS_INCREMENTO   : positive := 25;  -- Bits del incremento J
        C_BITS_CONTADOR     : positive := 30   -- Bits del contador del AF
    );
    port (
        reloj_i        : in  std_logic;
        reset_i        : in  std_logic;
        habilitar_i    : in  std_logic;
        incremento_i   : in  std_logic_vector(J_BITS_INCREMENTO - 1 downto 0);
        fase_o         : out std_logic_vector(N_BITS_MUESTRAS - 1 downto 0)
    );
end entity acumulador;

architecture acumulador_arq of acumulador is

    signal contador : unsigned(C_BITS_CONTADOR-1 downto 0); 
    constant ceros  : unsigned(C_BITS_CONTADOR-J_BITS_INCREMENTO-1 downto 0) := (others => '0');
    
begin

    process (reloj_i, reset_i, incremento_i)
    begin
        if reset_i = '1' then               -- El reset es asincrónico
            contador <= (others => '0');

        elsif rising_edge(reloj_i) then     -- El reloj es sincrónico
            if habilitar_i = '1' then       -- Habilitación para contar
                contador <= contador + (ceros & unsigned(incremento_i));
                -- Si contador desborda, vuelve a contar desde el inicio.
            end if;

        end if;
    end process;

    -- Tomo los bits N_BITS_MUESTRAS más significativos del contador y lo asigno a fase:
    fase_o <= std_logic_vector(contador(C_BITS_CONTADOR-1 downto C_BITS_CONTADOR-N_BITS_MUESTRAS));

end architecture acumulador_arq;
