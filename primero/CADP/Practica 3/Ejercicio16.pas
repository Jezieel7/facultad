program Ejercicio16;

function exceptCash(a: char): boolean;
begin
    exceptCash:= (a <> '$');
end;

var
    A: char;
    B: char;
    cumpleA: boolean;
    cumpleB: boolean;
    sumArroba: integer;
    sumA: integer;
    sumB: integer;
begin
    sumArroba:= 0;
    sumA:= 0;
    sumB:= 0;
    writeln('Ingrese caracter distinto de "$"');
    readln(A);
    cumpleA:= exceptCash(A);
    if((A <> '%') and (cumpleA = true))then begin
        while((A <> '%') and (cumpleA = true)) do begin
            cumpleA:= exceptCash(A);
            sumA:= sumA + 1;
            writeln('Ingrese letra vocal y "%" para terminar la secuencia A');
            readln(A);
        end;
        if(A = '%')then begin
            writeln('Fanalizó la secuencia A, inicializa la secuencia B');
            cumpleB:= cumpleA;
            writeln('Ingrese una secuencia con la misma cantidad de caracteres que aparecieron en A');
            writeln('y en la que aparezca a lo sumo 3 veces el carácter ‘@’');
            writeln('Para finalizar use "*"');
            readln(B);
            if(B <> '*') then begin
                while(B <> '*')do begin
                    sumB:= sumB + 1;
                    if(B = '@')then begin
                        sumArroba:= sumArroba + 1;
                    end;
                    writeln('Ingrese secuencia B');
                    readln(B);
                end;
                if(sumB <> sumA)then begin
                    writeln('La cantidad de caracteres de la secuencia B no es la misma que la de la secuencia A');
                end;
                if(sumArroba < 3)then begin
                    writeln('Se ingresaron menos de tres caracteres "@"');
                end;
            end
            else begin
                writeln('El patrón no se cumplió, ingresó "*"');
            end;
        end
        else begin
            writeln('El patrón no se cumplió, se ingresó "%"');
        end;
    end
    else begin
        writeln('El patrón no se cumplió, Se ingresó "%" en el inicio');
    end;
end.
