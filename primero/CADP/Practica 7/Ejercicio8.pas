program JugamosConListas8;
type	
    lista = ^nodo;
    nodo = record
		num : integer;
		sig : lista;
    end;
    
procedure armarNodo(var l: lista; v: integer);
var
    nue, act, ant: lista;
begin
    new(nue); nue^.num:= v; act:= l; ant:= l;
    while((act <> nil) and (v < act^.num))do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= nue;
    end
    else begin
        ant^.sig:= nue;
        nue^.sig:= act;
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
