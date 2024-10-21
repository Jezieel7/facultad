program Ejercicio5;
var
    num1, num2: real;
    aux: integer;
begin
    aux:= 0;
    readln(num1);
    while((num1*2<>num2) and (aux <> 10)) do begin
        aux:= aux + 1;
        readln(num2);
    end;
    if(aux = 10) then
        writeln('No se ha ingresado el doble de: ', num1:2:2);
end.
