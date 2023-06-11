function binfrac = dec2binfrac(decfrac, nbits)

    // Valores iniciales
    remainder = decfrac;
    binfrac ='';

    // Continuamos el proceso hasta que no queden más bits
    for i=1:nbits
        intpart = fix(remainder*2);
        //disp(intpart);
        binfrac = binfrac + string(intpart);
        remainder = remainder*2 - intpart;
    end

endfunction

function bin = dec2bin_con_punto(decimal, bitsfrac)
    entero = fix(decimal);
    bin_entero = dec2bin(entero);
    fraccion = decimal-entero;
    bin_fraccion = dec2binfrac(fraccion, bitsfrac);
    bin = bin_entero + '.' + bin_fraccion;
endfunction

// Ejemplo de uso
millon = 1e6;
decimal = 1024*1e5/(125e6);
disp(decimal);
bits = 20;
binario = dec2bin_con_punto(decimal, bits);
disp(binario);
