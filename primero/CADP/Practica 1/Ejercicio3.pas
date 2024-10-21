program Ejercicio3;
var
    num1, num2, num3, aux: integer;
begin
    writeln('Ingrese el primer número');
    readln(num1);
    writeln('Ingrese el segundo número');
    readln(num2);
    if (num1 < num2) then begin
        aux:= num1;
        num1:= num2;
        num2:= aux;
    end;
    writeln('Ingrese el tercer número');
    readln(num3);
    if(num2 < num3) then begin
        aux:= num3;
        num3:= num2;
        num2:= aux;
    end;
    if(num1 < num2) then begin
        aux:= num2;
        num2:= num1;
        num1:= aux;
    end;
    writeln('Los numeros ordenados descendentemente: ', num1, ' ', num2, ' ', num3);
end.
