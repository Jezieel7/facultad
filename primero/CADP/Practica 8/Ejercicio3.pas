program REMISERIA;
type
    viaje=record
        nroViaje: integer;
        codAuto: integer;
        dirOri: string;
        dirDes: string;
        kmRecorridos: real;
    end;
    
    lista= ^nodo;
    
    nodo=record
        viajes: viaje;
        sig: lista;
    end;

procedure cargarViaje(var v: viaje);
begin
    with v do begin
        writeln('Introduzca código de auto');
        readln(codAuto);
        if(codAuto <> -1)then begin
            writeln('Introduzca número de viaje');
            readln(nroViaje);
            writeln('Introduzca dirección de origen');
            readln(dirOri);
            writeln('Introduzca dirección de destino');
            readln(dirDes);
            writeln('Introduzca KM recorridos');
            readln(kmRecorridos);
        end;
    end;
end;

procedure insertarCodAuto(var l: lista; v: viaje);
var
    aux, act, ant: lista;
begin
    new(aux); aux^.viajes:= v; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.viajes.codAuto < aux^.viajes.codAuto))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= l^.sig;
    end
    else begin
        aux^.sig:= act; ant^.sig:= aux;
    end;
end;

procedure insertarNroViaje(var l: lista; v: viaje);
var
    aux, act, ant: lista;
begin
    new(aux); aux^.viajes:= v; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.viajes.nroViaje < aux^.viajes.nroViaje))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= l^.sig;
    end
    else begin
        aux^.sig:= act; ant^.sig:= aux;
    end;
end;

procedure cargarLista(var l: lista);
var
    v: viaje;
begin
    cargarViaje(v);
    while(v.codAuto <> -1)do begin
        insertarCodAuto(l, v);
        cargarViaje(v);
    end;
end;

procedure actualizarMaximos(auxKm: real; var auxKm2: real; var auxKm3: real; var cod1: integer; var cod2: integer; auxCod: integer);
begin
    if(auxKm > auxKm2)then begin
        auxKm3:= auxKm2;
        cod2:= cod1;
        auxKm2:= auxKm;
        cod1:= auxCod;
    end
    else if(auxKm > auxKm3)then begin
        auxKm3:= auxKm;
        cod2:= auxcod;
    end;
end;

procedure informar(l: lista; var cod1: integer; var cod2: integer; var lista2: lista);
var
    auxKm1, auxKm2, auxKm3: real;
    auxCod: integer;
begin
    auxKm1:= 0; auxKm2:= 0; auxKm3:= 0; auxCod:= 0;
    while(l <> nil)do begin
        auxCod:= l^.viajes.codAuto;
        while(l^.viajes.codAuto = auxCod)do begin
            auxKm1:= auxKm1 + l^.viajes.kmRecorridos;
            if(l^.viajes.kmRecorridos > 5)then begin
                insertarNroViaje(lista2, l^.viajes); //genera la lista nueva
            end;
            l:= l^.sig;
        end;
        actualizarMaximos(auxKm1, auxKm2, auxKm3, cod1, cod2, auxCod);
    end;
end;

var
    l, lista2: lista;
    cod1, cod2: integer;
begin
    l:= nil; lista2:= nil;
    cod1:= 0; cod2:= 0;
    cargarLista(l);
    informar(l, cod1, cod2, lista2);
    writeln('Los dos códigos de autos que más km recorrieron fueron ', cod1, ' y ', cod2);
end.

Ejercicio 4
program MATERNIDAD;
const
    semanas: 42;
    type
        arrayPeso= array[1..semanas]of real;
        paciente=record
            nombre: string;
            apellid: string;
            peso: arrayPeso;
            dimLo: integer;
        end;
        lista= ^nodo;
        nodo=record
            pacientes: paciente;
            sig: lista;
        end;
procedure cargarLista(l: lista); //se dispone
procedure cargarPaciente//Se dispone
procedure agregarFinal(var l:lista; c: paciente); //se dispone

function mayorPeso(a: arrayPeso; dimLo: integer): integer;
var
    i: integer; auxMax: real; auxSemana: integer;
begin
    auxMax:= -999;
    for i:=1 to dimLo do begin
        if(a[i] > auxMax)then begin //actualiza la semana con mayor aumento de peso.
            auxMax:= a[i];
            auxSemana:= i;
        end;
    end;
    mayorPeso:= auxSemana;
end;

procedure aumentoTotal(a: arrayPeso; dimLo: integer): real;
var
    i: integer; pesoInicio: real; totalPeso: real;
begin
    pesoInicio:= a[1];
    for i:= 1 to dimLo do begin
        totalPeso:= totalPeso + (a[i].pesoInicio); //aumento total de peso de cada embarazada
    end;
    aumentoTotal:= totalPeso;
end;

procedure informar(l: lista);
begin
    while(l <> nil)do begin
        writeln("la embarazada de nombre: ", l^.pacientes.nombre, ' y de apellido: ', l^.pacientes.apellido, ' tuvo un aumento de peso total de: ', aumentoTotal(l^.pacientes.peso, l^.pacientes.dimLo));
        writeln("y la semana en la que más aumentó de peso fue la semana ", mayorPeso(l^.pacientes.peso, l^.pacientes.dimLo));
        l:= l^.sig;
    end;
end;

var
    l: lista;
begin
    cargarLista(l); //se dispone
    informar(l);
end;
