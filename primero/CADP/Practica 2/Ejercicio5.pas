program Ejercico5;
var
    num, less, higher, sum: integer;
begin
    less:= 32767;
    higher:= -32768;
    repeat
        readln(num);
        if(num < less)then begin
            less:= num;
        end;
        if(num > higher)then begin
            higher:= num;
        end;
        sum:= sum + num;
    until(num = 100);
    writeln('El número mínimo leído fue el: ', less);
    writeln('El número máximo leído fue el: ', higher);
    writeln('La suma total de los números leídos es de: ', sum);
end.
