program JugamosConListas9;
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
    while((act <> nil) and (v > act^.num))do begin
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

function estaOrdenada(l: lista): boolean;
var
    b: boolean;
    ant: lista;
begin
    b:= true; ant:= l;
    while((l <> nil) and (b)) do begin
        if(l^.num < ant^.num) then begin
            b:= false;
        end;
        ant:= l;
        l:= l^.sig;
    end;
    estaOrdenada:= b;
end;

procedure eliminar(var l: lista; v: integer);
var
    act, ant: lista;
begin
    act:= l; ant:= l;
    while((act <> nil) and (act^.num <> v)) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil)then begin
        if(act = l) then begin
            l:= l^.sig;
            dispose(act);
            writeln('El elemento se encontraba al principio de la lista');
        end
        else begin
            ant^.sig:= act^.sig;
            dispose(act);
        end;
    end;
end;

procedure sublista(l: lista; a: integer; b: integer; var nueList: lista);
begin
    while(l <> nil) do begin
        if((l^.num > a) and (l^.num < b)) then begin
            armarNodo(nueList, l^.num);
        end;
        l:= l^.sig;
    end;
end;
procedure imprimirLista(l: lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;
end;

var
    pri, nueList : lista;
    valorA, valorB : integer;
begin
    pri := nil; nueList:= nil;
    writeln('Ingrese un numero');
    readln(valorA);
    while (valorA <> 0) do begin
        armarNodo(pri, valorA);
        writeln('Ingrese un numero');
        readln(valorA);
    end;
    imprimirLista(pri);
    writeln(estaOrdenada(pri));
    readln(valorA);
    eliminar(pri, valorA);
    imprimirLista(pri);
    writeln('Ingrese 2 valores');
    readln(valorA);
    readln(valorB);
    sublista(pri, valorA, valorB, nueList);
    imprimirLista(nueList);
end.
