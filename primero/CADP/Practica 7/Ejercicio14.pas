program ejercicio14;
const
    precio1= 30.05;
    precio2= 40.50;
    precio3= 10;
    precio4= 15;
type
    tabla= array[1..4] of real;
    medios= array[1..5] of integer;
    alumnos= array[1..1300] of integer; //no Lo use
    
    viaje=record
        codAlumno: integer;
        diaMes: integer;
        facultadPertenece: string;
        medioTransporte: medios;
    end;
    
    listaViajes= ^nodo;
    
    nodo=record
        viaje: viaje;
        sig: listaViajes;
    end;
    
procedure inicializarMedios(r: medios);
var
    i: integer;
begin
    for i:= 1 to 5 do begin
        r[i]:= 0;
    end;
end;

procedure inicializarTabla(var t: tabla);
begin
    t[1]:= precio1;
    t[2]:= precio2;
    t[3]:= precio3;
    t[4]:= precio4;
end;

procedure cargarViaje(var v: viaje);
var
    aux: integer;
begin
    with v do begin
        writeln('Introduzca codigo del alumno');
        readln(codAlumno);
        writeln('Introduzca dia del mes');
        readln(diaMes);
        writeln('Introduzca facultad a la que pertenece');
        readln(facultadPertenece);
        inicializarMedios(medioTransporte);
        writeln('Introduzca el medio de transporte');
        readln(aux);
        while(aux <> 6) do begin
            medioTransporte[aux]:= medioTransporte[aux] + 1;
            writeln('Introduzca el medio de transporte');
            readln(aux);
        end;
    end;
end;

procedure insertar(var l: listaViajes; v: viaje);
var
    aux, act, ant: listaViajes;
begin
    new(aux); aux^.viaje:= v; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.viaje.codAlumno < aux^.viaje.codAlumno)) do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant) then begin
        l:= aux;
    end
    else begin
        ant^.sig:= aux;
        aux^.sig:= act;
    end;
end;

procedure cargarLista(var l: listaViajes);
var
    v: viaje;
begin
    cargarViaje(v);
    while(v.codAlumno <> -1)do begin
        insertar(l, v);
        cargarViaje(v);
    end;
end;

function cantTransportes(transportes: medios): integer;
var
    cant, i: integer;
begin
    cant:= 0;
    for i:= 1 to 5 do begin
        cant:= cant + transportes[i];
    end;
    cantTransportes:= cant;
end;

function masViajes(l: listaViajes): integer;
var
    seisViajes, cantAlumnos, codAlumno: integer;
begin
    cantAlumnos:= 0;
    while(l <> nil)do begin
        seisViajes:= 0;
        codAlumno:= l^.viaje.codAlumno;
        seisViajes:= cantTransportes(l^.viaje.medioTransporte);
        if(seisViajes > 6)then begin
            cantAlumnos:= cantAlumnos + 1;
        end;
        while(l^.viaje.codAlumno = codAlumno)do begin
            l:= l^.sig;
        end;
    end;
    masViajes:= cantAlumnos;
end;

function costoTransporte(transportes: medios; t: tabla): real;
var
    costo: real;
    i: integer;
begin
    costo:= 0;
    for i:= 1 to 4 do begin
        if(transportes[i] >= 1)then begin
            costo:= costo + (transportes[i] * t[i]);
        end;
    end;
    costoTransporte:= costo;
end;

function gastarMas(l: listaViajes; t: tabla): integer;
var
    cantAlumnos, codAlumno: integer;
    coste: real;
begin
    cantAlumnos:= 0;
    while(l <> nil)do begin
        coste:= 0;
        codAlumno:= l^.viaje.codAlumno;
        coste:= costoTransporte(l^.viaje.medioTransporte, t);
        while(l^.viaje.codAlumno = codAlumno)do begin
            l:= l^.sig;
        end;
        if(coste > 80)then begin
            cantAlumnos:= cantAlumnos + 1;
        end;
        coste:= 0;
    end;
    gastarMas:= cantAlumnos;
end;

procedure mayorMayor(transportes: medios; aux: integer; aux2: integer);
var
    i: integer;
begin
    for i:= 1 to 5 do begin
        if(transportes[i] > aux)then begin
            aux2:= aux;
            aux:= transportes[i];
        end;
        if(transportes[i] > aux2)then begin
            aux2:= transportes[i];
        end;
    end;
end;

procedure masUsados(l: listaViajes; var masUsado: integer; var masUsado2: integer);
var
    codAlumno, i: integer;
    m: medios;
begin
    inicializarMedios(m);
    while(l <> nil)do begin
        codAlumno:= l^.viaje.codAlumno;
        for i:= 1 to 5 do begin
            m[i]:= m[i] + l^.viaje.medioTransporte[i];
        end;
        while(l^.viaje.codAlumno = codAlumno)do begin
            l:= l^.sig;
        end;
    end;
    mayorMayor(m, masUsado, masUsado2);
end;

function cleta(l: listaViajes): integer;
var
    i, cantAlumnos, codAlumno: integer;
begin
    cantAlumnos:= 0;
    while(l <> nil)do begin
        codAlumno:= l^.viaje.codAlumno;
        if((l^.viaje.medioTransporte[1] >= 1) or (l^.viaje.medioTransporte[2] >= 1) or (l^.viaje.medioTransporte[3] >= 1) or (l^.viaje.medioTransporte[4] >= 1) and (l^.viaje.medioTransporte[5] >= 1)) then begin
            cantAlumnos:= cantAlumnos + 1;
        end;
        while(l^.viaje.codAlumno = codAlumno)do begin
            l:= l^.sig;
        end;
    end;
    cleta:= cantAlumnos;
end;

var
    l: listaViajes;
    t: tabla;
    masUsado, masUsado2: integer;
begin
    masUsado:= 0; masUsado2:= 0;
    inicializarTabla(t);
    l:= nil;
    cargarLista(l);
    masUsados(l, masUsado, masUsado2);
    writeln('La cantidad de alumnos que realizan más de 6 viajes por día', masViajes(l));
    writeln('La cantidad de alumnos que gastan en transporte más de $80 por día', gastarMas(l, t));
    writeln('Los dos medios de transporte más utilizados ', masUsado, ', ', masUsado2);
    writeln('La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte ', cleta(l));
end.
