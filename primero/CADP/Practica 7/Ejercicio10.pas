program excercise10;
type
    lista= ^clientes;
    
    clientes=record
        dni: integer;
        numero: integer;
        sig: lista;
    end;

procedure recibirCliente(var l: lista; var ult: lista; dni: integer; var numero: integer);
var
    nue: lista;
begin
    new(nue); nue^.dni:= dni; nue^.numero:= numero; nue^.sig:= nil;
    if(l = nil) then begin
        l:= nue; ult:= nue;
    end
    else begin
        ult^.sig:= nue;
        ult:= nue;
    end;
end;

procedure atenderCliente(var l: lista);
var
    act, ant: lista;
begin
    act:= l; ant := nil;
    writeln('El cliente atendido es el de dni ', l^.dni, ' y numero ', l^.numero);
    if (act <> nil) then begin
        if (act = l) then begin
            l:= l^.sig;
        end
        else begin
            ant^.sig:= act^.sig;
        end;
        dispose (act);
    end;
end;

procedure imprimirLista(l: lista);
begin
    while(l <> nil) do begin
        writeln(l^.dni);
        writeln(l^.numero);
        l:= l^.sig;
    end;
end;

var
    listado, ult: lista;
    dni, numero: integer;
begin
    listado:= nil; ult:= nil; numero:= 0;
    readln(dni);
    while(dni <> 0)do begin
        numero:= numero + 1;
        recibirCliente(listado, ult, dni, numero);
        readln(dni);
    end;
    while(listado <> nil) do begin
        atenderCliente(listado);
    end;
end.
