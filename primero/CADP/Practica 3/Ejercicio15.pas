program Ejercicio15;

function onlyVocal(a: char): boolean;
begin
    onlyVocal:= (a= 'a') or (a= 'e') or (a= 'i') or (a= 'o') or (a= 'u');
end;

var
    A: char;
    B: char;
    cumpleA: boolean;
    cumpleB: boolean;
begin
    writeln('Ingrese letra vocal');
    readln(A);
    cumpleA:= onlyVocal(A);
    if((A <> '$') and (cumpleA = true))then begin
        while((A <> '$') and (cumpleA = true)) do begin
            writeln('Ingrese letra vocal o "$" para terminar la secuencia A');
            readln(A);
            cumpleA:= onlyVocal(A);
        end;
        if(A = '$')then begin
            writeln('Fanalizó la secuencia A, inicializa la secuencia B');
            cumpleB:= cumpleA;
            writeln('Ingrese letra no vocal o "#" para terminar la secuencia B');
            readln(B);
            if((b <> '#') and (onlyVocal(B) = false)) then begin
                while((b <> '#') and (onlyVocal(B) = false))do begin
                    writeln('Ingrese letra no vocal o "#" para terminar la secuencia B');
                    readln(B);
                    cumpleB:= onlyVocal(B);
                end;
                if(cumpleB= true)then begin
                    writeln('El patrón no se cumplió, se ingresó una letra vocal');
                end;
            end
            else begin
                writeln('El patrón no se cumplió, se ingresó "#"');
            end;
        end
        else begin
            writeln('El patrón no se cumplió, no se ingresó una letra vocal o un "$"');
        end;
    end
    else begin
        writeln('El patrón no se cumplió, no se ingresó letra vocal en el inicio');
    end;
end.
