program BANCO;
const
    meses= 11; motivos= 7;
type
    fechas=record
        ano: integer;
        mes: integer;
        dia: integer;
    end;
    
    horas=record
        hora: integer;
        minutos: integer;
    end;
    
    transferencia=record
        nroCO: integer;
        dniTCO: integer;
        nroCD: integer;
        dniTCD: integer;
        fecha: fechas;
        hora: horas;
        monto: real;
        codMotivo: integer;
    end;
    
    arrayMotivos= array[1..motivos] of integer;
    
    lista= ^nodo;
    
    nodo=record
        transferencias: transferencia;
        sig: lista;
    end;
    
procedure insertar(var l: lista; t: transferencia);
var
    aux, ant, act: lista;
begin
    new(aux); aux^.transferencias:= t; aux^.sig:= nil;
    act:= nil; ant:= nil;
    while((act <> nil) and (act^.transferencias.nroCO < aux^.transferencias.nroCO))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= aux;
    end
    else begin
        ant^.sig:= aux; aux^.sig:= act;
    end;
end;

procedure cargarNuevaLista(l: lista; var l2: lista);
begin
    while(l <> nil)do begin
        if(l^.transferencias.nroCO <> l^.transferencias.nroCD)then begin
            insertar(l2, l^.transferencias);
        end;
        l:= l^.sig;
    end;
end;

procedure inicializarArray(a: arrayMotivos);
var
    i: integer;
begin
    for i:= 1 to motivos do begin
        a[i]:= 0;
    end;
end;

function esJunio(mes : integer): boolean;
begin
    esJunio:= (mes = 6);
end;

function cuentaDimpar(codigo: integer): boolean;
var
    aux: integer; par: integer; impar: integer;
begin
    par:= 0; impar:= 0;
    while(codigo <> 0)do begin
        aux:= codigo mod 10;
        if((aux mod 2) <> 0)then begin
            impar:= impar + 1;
        end
        else begin
            par:= par + 1;
        end;
        codigo:= codigo div 10;
    end;
    cuentaDimpar:=(impar > par);
end;

function codMax(a: arrayMotivos): integer;
var
    i: integer; aux: integer;
begin
    aux:= -99;
    for i:= 1 to motivos do begin
        if(a[i] > aux)then begin
            aux:= a[i];
        end;
    end;
    codMax:= aux;
end;

procedure informar(l: lista; var codMotivo: integer; var cantTransferencias: integer);
var
    cantMotivos: arrayMotivos; cuentaActual: integer; montoAux: real;
begin
    inicializarArray(cantMotivos);
    montoAux:= 0;
    while(l <> nil)do begin
        cuentaActual:= l^.transferencias.nroCO;
        while((l<>nil) and (l^.transferencias.nroCO = cuentaActual))do begin
            montoAux:= montoAux + l^.transferencias.monto; //inciso b
            cantMotivos[l^.transferencias.codMotivo]:= cantMotivos[l^.transferencias.codMotivo] + 1; //inciso c
            if((esJunio(l^.transferencias.fecha.mes))and(cuentaDimpar(l^.transferencias.nroCD)))then begin //inciso d
                cantTransferencias:= cantTransferencias + 1;
            end;
            l:= l^.sig;
        end;
        writeln('La cuenta ', cuentaActual, 'Tranfirió a terceros ', montoAux); //inciso b
        montoAux:= 0;
    end;
    codMotivo:= codMax(cantMotivos); //inciso c
end;

var
    l: lista; l2: lista; codMotivo: integer; cantTransferencias: integer;
begin
    l:= nil; l2:= nil; cantTransferencias:= 0;
    cargarLista(l);
    cargarNuevaLista(l, l2);// inciso a
    informar(l2, codMotivo, cantTransferencias); //inciso b, c y d
    writeln('El código de motivo que más transferencias a terceros tuvo fue el: ', codMotivo); //inciso c
    writeln('La cantidad de transferencias en junio, en las cuales el número de destino tenia más dígitos impares que pares ', cantTransferencias);//inciso d
end.
