program establecimientosEducativos;
type
    school= record
        CUE: integer;
        name: string;
        canTeacher: integer;
        canStudent: integer;
        location: string;
    end;
    
procedure readScho(var s: school);
begin
    With s do begin
        writeln('Introduzca CUE del establecimiento');
        readln(CUE);
        writeln('Introduzca nombre del establecimiento');
        readln(name);
        writeln('Introduzca cantidad de docentes del establecimiento');
        readln(canTeacher);
        writeln('Introduzca cantidad de alumnos del establecimiento');
        readln(canStudent);
        writeln('Introduzca localidad del establecimiento');
        readln(location);
    end;
end;

function ratioTeaStu(s: school): real;
begin
    ratioTeaStu:= (s.canStudent/s.canTeacher);
end;

procedure bestRatio(s: school; ratio: real; var maxRatio: real; var bestCUE1: integer; var bestName1: string; var bestCUE2: integer; var bestName2: string);
begin
    if(ratio < maxRatio) then begin
        maxRatio:= ratio;
        bestCUE2:= bestCUE1;
        bestName2:= bestName1;
        bestCUE1:= s.CUE;
        bestName1:= s.name;
    end;
end;

var
    scho: school;
    i: integer;
    prom, maxRatio: real;
    cantLaPlata, bestCUE1, bestCUE2 : integer;
    bestName1, bestName2: string;
begin
    bestCUE1:= 0; bestCUE2:= 0;
    bestName1:= ''; bestName2:= '';
    cantLaPlata:= 0; prom:= 99999; maxRatio:= 99999;
    for i:= 1 to 2400 do begin
        readScho(scho);
        prom:= ratioTeaStu(scho);
        bestRatio(scho, prom, maxRatio, bestCUE1, bestName1, bestCUE2, bestName2);
        if((scho.location = 'La Plata') and (prom < 23.435)) then begin
            cantLaPlata:= cantLaPlata + 1;
        end; 
        
    end;
    writeln('La cantidad de establecimientos con un promedio superior al sugerido por la UNESCO en La Plata es de: ', cantLaPlata);
    writeln('El CUE y nombre de la mejor escuela con mejor relación entre docentes y alumnos: ', bestCUE1, ', ', bestName1);
    writeln('El CUE y nombre de la segunda mejor escuela con mejor relación entre docentes y alumnos: ', bestCUE2, ', ', bestName2);
end.
