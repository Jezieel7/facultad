program Ejercicio9;
var
    character: char;
    num2, num1: integer;
begin
    writeln('Ingrese un carácter "+" o "-"');
    readln(character);
    if ((character = '+')) then begin
        writeln('Ingrese la secuencia de números');
        readln(num1);
        num2:= num1;
        while(num1 <> 0) do begin
            readln(num1);
            num2:= num2 + num1;
        end;
        writeln(num2);
    end
    else if (character = '-') then begin
        writeln('Ingrese la secuencia de números');
        readln(num1);
        num2:= num1;
        while(num1 <> 0) do begin
            readln(num1);
            num2:= num2 - num1;
        end;
        writeln(num2);
    end
    else begin
        writeln('Solo se admite "+" o "-"');
    end;
end.
