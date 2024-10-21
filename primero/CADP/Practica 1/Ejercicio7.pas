program Ejercicio7;
const
	cod = 32767;
var
    codigo: integer;
    precioAnterior, precioNuevo: real;
begin
    repeat
        writeln('Ingrese código, precio anterior y el nuevo precio del producto');
        readln(codigo, precioAnterior, precioNuevo);
        if((precioAnterior+(precioAnterior*0.10))<precioNuevo) then begin
            writeln('El aumento de precio del producto ', codigo, ' es superior al 10%')
        end
        else begin
            writeln('El aumento de precio del producto ', codigo, ' no supera el 10%');
        end;
    until (codigo = cod);
end.
