program Ejercicio5;
var
  caramelos, clientes, caramelosVendidos: integer;
  valorCaramelo: real;
begin
  valorCaramelo:= 1.60;
  read(caramelos);
  read(clientes);
  caramelosVendidos:= caramelos div clientes;
  writeln('la cantidad de caramelos que recibirá cada cliente es: ', caramelosVendidos);
  writeln('la cantidad de caramelos que se quedará el kiosquero es: ', caramelos mod clientes);
  writeln('el kiosquero deberá cobrar: ', (valorCaramelo * caramelosVendidos):2:2);
end.
