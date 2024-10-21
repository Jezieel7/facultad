program Registros;
type
    str20= string[20];
    alumno= record
        codigo: integer;
        nombre: str20;
        promedio: real;
    end;
    
procedure leer(var alu: alumno);
begin
    writeln('Ingrese el codigo del alumno: ');
    readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: ');
        readln(alu.nombre);
        write('Ingrese el promedio del alumno: ');
        readln(alu.promedio);
    end;
end;

procedure bestProm(alu : alumno; var maxProm: real; var nameMaxProm: string);
begin
    if(alu.promedio > maxProm) then begin
        maxProm:= alu.promedio;
        nameMaxProm:= alu.nombre;
    end;
end;

var
    a: alumno;
    cantA: integer;
    maxProm: real;
    nameMaxProm: string;
begin
    cantA:= 0;
    leer(a);
    while(a.codigo<>0) do begin
        bestProm(a, maxProm, nameMaxProm);
        cantA:= cantA + 1;
        leer(a);
    end;
    WriteLn('La cantidad de alumnos leidos es: ', CantA);
    writeln('El nombre del chabone que tiene mayor promedio es: ', nameMaxProm);
end.
