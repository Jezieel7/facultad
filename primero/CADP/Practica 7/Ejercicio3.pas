program JugamosConListas;
type	
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
    end;
    
procedure armarNodo(var L: lista; v: integer);
var
    aux, act: lista;
begin
    new(aux); aux^.num:= v; aux^.sig:= nil;
    if (L = nil) then begin
        L:= aux
    end
    else begin
	act:= l;
        while(act^.sig <> nil) do begin
            act:= act^.sig;
    end;
    act^.sig:= aux;
    end;
end;

procedure imprimirLista( l: lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
end.

b) 
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
    num : integer;
    sig : lista;
    end;
    
procedure armarNodo(var L: lista; var ult: lista; v: integer);
var
    aux: lista;
begin
    new(aux); aux^.num:= v; aux^.sig:= nil;
    if (L = nil) then begin
        L:= aux; ult:= aux;
    end
    else begin
        ult^.sig:= aux;
        ult:= aux;
    end;
end;

procedure imprimirLista( l: lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

var
    pri, ult : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, ult, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
end.
