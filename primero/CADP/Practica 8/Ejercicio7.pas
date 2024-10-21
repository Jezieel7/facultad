program LaFacu;
const
    cantMaterias= 24;
type
    arrayNotas= array[1..cantMaterias] of real;
    alumno=record
        numero: integer;
        apellido: string;
        nombres: string;
        direccionCorreoE: string;
        anoIngreso: integer;
        anoEgreso: integer;
        notas: arrayNotas;
    end;
    
    lista= ^nodo;
    
    nodo=record
        alumnos: alumno;
        sig: lista;
    end;
    
procedure cargarVector(var a: arrayNotas);
var
    i: integer; v: real;
begin
    for i:= 1 to cantMaterias do begin
        readln(v);
        a[i]:= v;
    end;
end;

procedure ordenarVector(var v: arrayNotas);
var
    i, j, p: integer;
begin
    for i:= 1 to (cantMaterias - 1)do begin
        p:= i;
        for j:= 1 to cantMaterias do begin
            if(v[i] < v[p])then begin
                p:= j;
            end;
        end;
    end;
end;

procedure cargarAlumno(var a: alumno);
begin
    with a do begin
        writeln('Introduzca número del alumno');
        readln(numero);
        if(numero <> -1)then begin
            writeln('Introduzca apellido del alumno');
            readln(apellido);
            writeln('Introduzca nombres del alumno');
            readln(nombres);
            writeln('Introduzca dirección de correo electrónico del alumno');
            readln(direccionCorreoE);
            writeln('Introduzca año de ingreso del alumno');
            readln(anoIngreso);
            writeln('Introduzca año de egreso del alumno');
            readln(anoEgreso);
            writeln('Introduzca las notas del alumno');
            cargarVector(notas);
            ordenarVector(notas);
        end;
    end;
end;

procedure insertar(var l: lista; a: alumno);
var
    aux, act, ant: lista;
begin
    new(aux); aux^.alumnos:= a; aux^.sig:= nil;
    act:= l;
    while((act <> nil) and (act^.alumnos.anoIngreso < aux^.alumnos.anoIngreso))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= aux;
    end
    else begin
        ant^.sig:= aux; aux^.sig:= act;
    end;
end;

procedure cargarLista(var l: lista);
var
    a: alumno;
begin
    cargarAlumno(a);
    while(a.numero <> -1)do begin
        insertar(l, a);
        cargarAlumno(a);
    end;
end;

procedure sacarProm(v: arrayNotas; var prom: real);
var
    i: integer; aux: real;
begin
    aux:= 0;
    for i:= 1 to cantMaterias do begin
        aux:= aux + v[i];
    end;
    prom:= aux/cantMaterias;
end;

function impares(anoIngreso: integer; numero: integer): Boolean;
var
    aux: integer; bool: Boolean;
begin
    bool:= true;
    if(anoIngreso = 2012)then begin
        while((numero <> 0) and (bool))do begin
            aux:= numero mod 10;
            if((aux mod 2) <> 0)then begin
                numero:= numero div 10;
            end
            else begin
                bool:= false;
            end;
        end;
        impares:= bool;
    end
    else begin
        impares:= false;
    end;
end;

procedure actualizarMaximo(anoIngreso: integer; anoEgreso: integer; nombre: string; apellido: string; correoE: string; var apellido1: string; var nombre1: string; var correoE1: string; var apellido2: string; var nombre2: string; var correoE2: string; var ano1: integer; var ano2: integer);
var
    aux: integer;
begin
    aux:= anoEgreso - anoINgreso;
    if(aux < ano1)then begin
        ano2:= ano1;
        apellido2:= apellido1; nombre2:= nombre1; correoE2:= correoE1;
        apellido1:= apellido; nombre1:= nombre; correoE1:= correoE;
    end
    else if(aux < ano2)then begin
        ano2:= aux;
        apellido2:= apellido; nombre2:= nombre; correoE2:= correoE;
    end;
end;

procedure informar(l: lista; var cantAlumnos: integer; var apellido1: string; var nombre1: string; var correoE1: string; var apellido2: string; var nombre2: string; var correoE2: string);
var
    prom: real;
    ano1: integer; ano2: integer;
begin
    ano1:= -1; ano2:= -1;
    while(l <> nil)do begin
        sacarProm(l^.alumnos.notas, prom); //inciso a
        writeln('El promedio del alumno con el número ', l^.alumnos.numero, ' es de ', prom);
        if(impares(l^.alumnos.anoIngreso, l^.alumnos.numero))then begin
            cantAlumnos:= cantAlumnos + 1; //inciso b
        end;
        actualizarMaximo(l^.alumnos.anoIngreso, l^.alumnos.anoEgreso, l^.alumnos.nombres, l^.alumnos.apellido, l^.alumnos.direccionCorreoE, apellido1, nombre1, correoE1, apellido2, nombre2, correoE2, ano1, ano2);
        //inciso c
        l:= l^.sig;
    end;
end;

procedure eliminar(var l: lista; numero: integer);
var
   ant, act: lista;
begin
    ant:= l; act:= l;
    while((act <> nil) and (act^.alumnos.numero < numero))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act <> nil)then begin
        if(act = ant)then begin
            l:= l^.sig;
        end
        else begin
            ant^.sig:= act^.sig;
            l:= l^.sig;
        end;
        dispose(act);
    end;
end;

var
    l: lista; 
    apellido1, nombre1, nombre2, apellido2, correoE1, correoE2: string;
    cantAlumnos: integer; valor: integer;
begin
    cantAlumnos:= 0;
    cargarLista(l); //inciso 1
    informar(l, cantAlumnos, apellido1, nombre1, correoE1, apellido2, nombre2, correoE2); //inciso 2
    writeln('Los dos que se recibieron más rápido ', apellido1, ' ', nombre1, ' ', correoE1, ' y ', apellido2, ' ', nombre2, ' ', correoE2);
    writeln(cantAlumnos);
    readln(valor);
    eliminar(l, valor); //inciso 3
end.
