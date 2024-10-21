program Ejercicio6;
var
    promedioAlumno: real;
    nroLegajo, cantAlumnos, cantAlumnosProm, cantAlumnosDes,cantAlumnosDesLegajo, totalAlumnosDes: integer;
begin
    cantAlumnos:= 0; cantAlumnosProm:= 0; cantAlumnosDes:= 0; cantAlumnosDesLegajo:= 0;
    writeln('Ingrese número de legajo y promedio del alumno');
    readln(nroLegajo, promedioAlumno);
    while(nroLegajo <> -1) do begin
        cantAlumnos:= cantAlumnos + 1;
        if(promedioAlumno > 6.5) then begin
            cantAlumnosProm:= cantAlumnosProm + 1;
        end;
        if((promedioAlumno > 8.5) and (nrolegajo < 2500)) then begin
            cantAlumnosDesLegajo:= cantAlumnosDesLegajo + 1;
        end
        else if((promedioAlumno > 8.5)) then begin
            cantAlumnosDes:= cantAlumnosDes + 1;
        end;
		writeln('Ingrese número de legajo y promedio del alumno');
		readln(nroLegajo, promedioAlumno);
    end;
    totalAlumnosDes:= cantAlumnosDes + cantAlumnosDesLegajo;
    writeln('Se leyeron ', cantAlumnos, ' alumnos');
    writeln('La cantidad de alumnos con promedio superior a 6.5 fue de: ', cantAlumnosProm);
    writeln('El porcentaje de alumnos destacados fue del: ', ((cantAlumnosDesLegajo*100)/ totalAlumnosDes):2:2, '%');
end.
