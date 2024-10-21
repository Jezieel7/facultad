Program Ej11;
Type
    alumnado=record
        codigo: integer;
        apellido: string;
        promedio: real;
    end;
    
    ListaAlumnos= ^nodo;
    
    nodo=record
        alumno: alumnado;
        sig: ListaAlumnos;
    end;

procedure leerAlumno(var a: alumnado);
begin
    Writeln('ingrese el numero de alumno');
    readln(a.codigo);
    if (a.codigo <> 0) then begin
        Writeln('ingrese el apellido del alumno');
        readln(a.apellido);
        Writeln('ingrese el promedio del alumno');
        readln(a.promedio);
    end;
end;

procedure insertar(var l: ListaAlumnos; e: alumnado);
var
    aux, ant, act: ListaAlumnos;
begin
    new(aux);
    aux^.alumno:= e;
    aux^.sig:= nil;
    if(l = nil)then begin
        l:= aux
    end
    else begin
        act:= l;
        ant:= l;
        while (act <> nil) and (act^.alumno.promedio > aux^.alumno.promedio) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act = l) then begin
            aux^.sig:= l;
            l:= aux;
        end
        else begin
            ant^.sig:= aux;
            aux^.sig:= act;
        end;
    end;
end;

procedure imprimir(fst: ListaAlumnos);
var
    i: integer;
begin
    i:= 1; 
    While (fst <> nil) and (i <= 10) do begin
        writeln('Mejor promedio nro ',i,' es ',fst^.alumno.apellido,' de numero de alumno ',fst^.alumno.codigo);
        i:= i + 1; 
        fst:= fst^.sig;
    end;
end;

var
    alumno: alumnado;
    primero: ListaAlumnos;
begin
    primero:= nil;
    leerAlumno(alumno);
    while (alumno.codigo <> 0) do begin
        Insertar(primero, alumno);
        leerAlumno(alumno);
    end;
    imprimir(primero);
end.
