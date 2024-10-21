program Ejercicio6;
var
    montoDolares, valorDolar, transaccion, comisionBanco: real;
begin
    read(valorDolar);
    read(montoDolares);
    read(comisionBanco);
    transaccion:= (montoDolares*ValorDolar)+((montoDolares*ValorDolar)*(comisionBanco/100));
    writeln('la transacción será de: ', transaccion:2:2, ' pesos argentinos');
end.
