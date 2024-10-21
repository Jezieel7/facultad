program CASTING;
type	
    vector= array[1..5] of integer;
    
    actor=record
        dni: integer;
        apellido: string;
        nombre: string;
        edad: integer;
        codActuacion: integer;
    end;
    
    lista= ^nodo;
    
    nodo=record
        actores: actor;
        sig: lista;
    end;
    
procedure cargarActor(var a: actor);
begin
    with a do begin
        writeln('Introduzca DNI del actor');
        readln(dni);
        writeln('Introduzca apellido del actor');
        readln(apellido);
        writeln('Introduzca nombre del actor');
        readln(nombre);
        writeln('Introduzca edad del actor');
        readln(edad);
        writeln('Introduzca codigo de genero de actuacion que prefiere el actor');
        readln(codActuacion);
    end;
end;

procedure insertar(var l: lista; a: actor);
var
    aux, ant, act: lista;
begin
    new(aux); aux^.actores:= a; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.actores.dni < aux^.actores.dni))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= aux;
    end
    else begin
        ant^.sig:= aux;
        aux^.sig:= act;
    end;
end;

procedure cargarLista(var l: lista);
var
    a: actor;
begin
    repeat
        cargarActor(a);
        insertar(l, a);
    until(a.dni = 33555444);
end;

function par(d: integer): boolean;
begin
    par:= ((d mod 2)= 0);
end;

function masPares(d: integer): boolean;
var
    aux: integer; pares: integer; impares: integer;
begin
    pares:= 0; impares:= 0;
    while(d <> 0) do begin
        aux:= (d mod 10);
        if(par(aux))then begin
            pares:= pares + 1;
        end
        else begin
            impares:= impares + 1;
        end;
        d:= d div 10;
    end;
    masPares:= (pares > impares);
end;

procedure darCodigo(c: integer; var vectorCodigo: vector);
begin
    vectorCodigo[c]:= vectorCodigo[1] + 1;
end;

procedure mayoresCodigos(var cod: integer; var cod2: integer; v: vector);
var
    i: integer;
begin
    for i:= 1 to 5 do begin
        if(v[i] > cod)then begin
            cod2:= cod;
            cod:= v[i];
        end;
        else
        	if(v[i] > cod2)then begin
            	cod2:= v[i];
        	end;
        end;
end;

procedure informar(l: lista; var cantPersonas: integer; var cod: integer; var cod2: integer);
var
    v: vector;
begin
    while(l <> nil)do begin
        if(masPares(l^.actores.dni))then begin
            cantPersonas:= cantPersonas + 1;
        end;
        darCodigo(l^.actores.codActuacion, v);
    end;
end;

procedure eliminar(var l: lista; dni: integer);
var
    act, ant: lista;
begin
    act:= l;
    while((l <> nil) and (act^.actores.dni <> dni))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act <> nil)then begin
        if(act = l)then begin
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
    cod, cod2: integer; cantPersonas: integer; dni: integer;
begin
    l:= nil;
    cargarLista(l);
    informar(l, cantPersonas, cod, cod2);
    writeln('La cantidad de personas cuyo dni contiene mas digitos pares que impares es de ', cantPersonas);
    writeln('Los dos codigos de genero mas elegidos ', cod, ' y ', cod2);
    writeln('Introduzca el dni que desea eliminar');
    readln(dni);
    eliminar(l, dni);
end.
