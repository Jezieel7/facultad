program PRODUCTORA;
const
    cantEventos= 100;
type
    subTipo= 1..5;
    
    evento=record
        nombre: string;
        tipo: subTipo;
        lugar: string;
        cantPersonas: integer;
        costo: real;
    end;
    
    subNum= 1..100;
    
    arrayEventos=array[subNum] of evento;
    
    venta=record
        cod: integer;
        num: subNum;
        dniL: integer;
        cantE: integer;
    end;
    
    lista= ^nodo;
    
    nodo=record
        ventas: venta;
        sig: lista;
    end;
    
procedure cargarVenta(var v: venta);
begin
    with v do begin
        readln(cod);
        if(cod <> -1)then begin
            readln(num);
            readln(dniC);
            readln(cantE);
        end;
    end;
end;

procedure insertar(var l: lista; v: venta);
var
    aux, act, ant: lista;
begin
    new(aux); aux^.ventas:= v; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.ventas.num < aux^.ventas.num))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= l^.sig;
    end
    else begin
        aux^.sig:= act; ant^.sig:= aux;
    end;
end;

procedure cargarVentas(var l: lista);
var
    v: venta;
begin
    cargarVenta(v);
    while(v.cod <> -1)do begin
        insertar(l, v);
        cargarVenta(v);
    end;
end;

function par(dni: integer; lugar: string): booleam;
var
    aux, pares, impar: integer;
begin
    pares:= 0; impar:= 0;
    if(lugar = 3)then beign
        while(dni <> 0)do begin
            aux:= dni mod 10;
            if((aux mod 2)= 0)then begin
                pares:= pares + 1;
            end
            else begin
                impar:= impar + 1;
            end;
            dni:= dni div 10;
        end;
    end
    else begin
        par:= false;
    end;
    par:= (pares > impares);
end;

procedure actualizarMinimos(total: real; nombre, lugar: string; var rec1:real; var nombre1, lugar1: string; var rec2: real; var nombre2, lugar2: string);
begin
    if(total < rec1)then begin
        nombre2:= nombre1;
        lugar2:= lugar1;
        rec2:= rec1;
        nombre1:= nombre;
        lugar1:= lugar;
        rec1:= total;
    end
    else if(total < rec2)then begin
        nombre2:= nombre;
        lugar2:= lugar;
        rec2:= total;
    end;
end;

procedure informar(l: lista; var nombre1, nombre2, lugar1, lugar2: string; var cantEntradas: integer; var alcanzo: boolean; v: arrayEventos);
var
    recaudacionAux: real; codEvento: integer; cantAux: integer; rec1, rec2: integer; total: real;
begin
    cantAux:= 0; rec1:= 9999; rec2:= 9999;
    while(l <> nil)do begin
        codEvento: l^.eventos.num; recaudacionAux:= v[l^.ventas.num].monto;
        while((l <> nil) and (l^.ventas.num = codEvento))do begin
            cantAux:= cantAux + l^.ventas.cantE;
            if(par(l^.ventas.dniC, v[l^.ventas.num].tipo))then beign
                cantEntradas:= cantEntradas + 1;
            end;
            l:= l^.sig;
        end;
        if(v[codEvento] = 50)then begin
            if(cantAux= v[codEvento].cantPersonas)then begin
                alcanzo:= true;
            end;
        end;
        total:= cantAux*recaudacionAux;
        actualizarMinimos(total, v[codEvento].nombre, v[codEvento].lugar, rec1, nombre1, lugar1, rec2, nombre2, lugar2);

var
    l: lista;
    nombre1, nombre2, lugar1, lugar2: string;
    cantEntradas: integer;
    alcanzo: boolean;
    v: arrayEventos;
begin
    cantEntradas:= 0; l:= nil; alcanzo:= false;
    inicializarVector(v);
    cargarVector(v);
    cargarVentas(l);
    informar(l, nombre1, nombre2, lugar1, lugar2, cantEntradas, alcanzo, v);
    writeln("El nombre y lugar del evento que recaudó menos ", nombre1, " ", lugar1);
    writeln("El nombre y lugar del segundo evento que recaudó menos ", nombre2, " ", lugar2);
    writeln("la cantidad de entradas vendidas con todo lo que pide el punto es de: ", cantEntradas);
    if(alcanzo)then begin
        writeln("el evento 50, alcanzó la cantidad máxima de personas");
    end;
end;

