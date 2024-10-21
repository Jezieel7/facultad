program Ejercico3;
var
    nombre: nameP;
    note: integer;
    cantStudentA, cantStudentS: integer;
begin
    repeat
        writeln('Ingrese el nombre del alumno');
        readln(nombre);
        writeln('Ingrese la nota del alumno');
        readln(note);
        if((note > 10) or (note < 1)) then begin
            repeat
                writeln('Ingrese una nota válida');
                readln(note);
            until((note <= 10) and (note >= 1));
        end;
        if(note >= 8 )then begin
            cantStudentA:= cantStudentA + 1;
        end;
        if(note = 7 )then begin
            cantStudentS:= cantStudentS + 1;
        end;
    until(nombre = 'Zidane Zinedine');
    writeln('La cantidad de alumnos aprobados (nota 8 o mayor) fue de: ', cantStudentA);
    writeln('La cantidad de alumnos con nota igual a 7 fue de: ', cantStudentS);
end.
