program AUTOMOTRIZ;
type
    poliza= array[1..6] of real;
    
    subrango= 1..6;
    
    cliente=record
        codCliente: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        codPoliza: subrango;
        montoBasico: real;
    end;
    lista=^nodo;
    
    nodo=record
        clientes: cliente;
        sig: lista;
    end;

procedure cargarCliente(var c: cliente);
begin
    with c do begin
        writeln('Introduzca código de cliente');
        readln(codCliente);
        if(codCliente <> 1122) then begin
            writeln('Introduzca dni del cliente');
            readln(dni);
            writeln('Introduzca código de cliente');
            readln(codCliente);
            writeln('Introduzca apellido del cliente');
            readln(apellido);
            writeln('Introduzca nombre del cliente');
            readln(nombre);
            writeln('Introduzca código de poliza del cliente');
            readln(codPoliza);
            writeln('Introduzca monto básico del cliente');
            readln(montoBasico);
        end;
    end;
end;

procedure insertar(var l: lista; c: cliente);
var
    aux, act, ant: lista;
begin
    new(aux); aux^.clientes:= c; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.clientes.codCliente < aux^.clientes.codCliente))do begin
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
    c: cliente;
begin
    repeat
        cargarCliente(c);
        insertar(l, c);
    until(c.codCLiente = 1122);
end;

function informarNueve(dni: integer): boolean;
var
    c: integer;
    aux: integer;
begin
    c:= 0;
    while(dni <> 0)do begin
        aux:= dni mod 10;
        if(aux = 9)then begin
            c:= c + 1;
        end;
        dni:= dni div 10;
    end;
    informarNueve:= (c >= 2);
end;

procedure informar(l: lista);
var
    p: poliza; montoCompleto: real;
begin
    while(l <> nil)do begin
        writeln(l^.clientes.dni);
        writeln(l^.clientes.nombre);
        writeln(l^.clientes.apellido);
        montoCompleto:= l^.clientes.montoBasico + p[l^.clientes.codPoliza];
        writeln(montoCompleto);
        if(informarNueve(l^.clientes.dni))then begin
            writeln(l^.clientes.apellido);
            writeln(l^.clientes.nombre);
        end;
        l:= l^.sig;
    end;
end;

procedure eliminar(var l: lista; codCliente: integer);
var
    act, ant: lista;
begin
    act:= l; ant:= l;
    while((act <> nil) and (act^.clientes.codCliente <> codCliente))do begin
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
    l: lista; codCliente: integer;
begin
    l:= nil;
    cargarLista(l);
    informar(l);
    readln(codCliente);
    eliminar(l, codCliente);
end.
