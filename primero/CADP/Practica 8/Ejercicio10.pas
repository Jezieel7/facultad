program AGRICOLA;
const
    dimF= 20;
type
    cultivo=record
        tipo: string;
        hectareas: integer;
        mesesCiclo: integer;
    end;
    
    arrayCultivos= array[1..DimF] of cultivo;
    
    empresa=record
        cod: integer;
        nombre: string;
        estatal: boolean;
        ciudad: string;
        cultivos: arrayCultivos;
        dimLo: integer;
    end;
    
    lista= ^nodo;
    
    nodo=record
        empresas: empresa;
        sig: lista;
    end;
    
procedure cargarCultivo(var c: cultivo);
begin
    with c do begin
        readln(tipo);
        readln(hectareas);
        readln(mesesCiclo);
    end;
end;

procedure cargarEmpresa(var e: empresa);
var
    dim: integer; aux: cultivo;
begin
    dim:= 0;
    with e do begin
        readln(cod);
        if(cod <> -1)then begin
            readln(nombre);
            writeln('Introduzca el dígito "1", pra indicar que es estatal');
            if(aux = 1)then begin
                estatal:= true;
            end
            else begin
                estatal:= false;
            end;
            readln(ciudad);
            cargarCultivo(aux);
            while((dim >= 20) and (aux.hectareas <> 0))do begin
                dim:= dim + 1;
                cultivos[dim]:= aux;
            end;
            dimLo:= dim;
        end;
    end;
end;

procedure insertar(var l: lista; e: empresa);
var
    aux, ant, act: lista;
begin
    new(aux); aux^.empresas:= e;
    ant:= l; act:= l;
    while((act <> nil) and (act^.empresas.cod < aux^.empresas.cod)) do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:=aux;
    end
    else begin
        ant^.sig:= aux; aux^.sig:= act;
    end;
end;

procedure cargarLista(var l: lista);
var
    e: empresa;
begin
    cargarEmpresa(e);
    while(e.cod <> -1)do begin
        insertar(l, e);
        cargarEmpresa(e);
    end;
end;

function cultivaTrigo(c: arrayCultivos; dimensionL: integer): boolean;
var
    i: integer; bool: boolean;
begin
    bool:= true;
    for i:= 1 to dimensionL do begin
        if(c[i].tipo = 'trigo')then begin
            bool:= true;
        end;
    end;
    cultivaTrigo:= bool;
end;

function cero(cod: integer): boolean;
var
    aux: integer; count: integer;
begin
    count:= 0;
    while(cod <> 0)do begin
        aux:= cod mod 10;
        if(aux = 0)then begin
            count:= count + 1;
        end;
        cod:= cod div 10;
    end;
    cero:= (count >= 2);
end;

function sanMiguel(e: empresa): boolean;
begin
    if(e.ciudad = 'San Miguel del Monte')then begin
        if((cultivaTrigo(e.cultivos, e.dimLo)) and (cero(e.cod)))then begin
            sanMiguel:= true;
        end
        else begin
            sanMiguel:= false;
        end;
    end;
end;

procedure muchasHectareas(var contadorHectareas: integer; var cantSoja: integer; dimLo: integer; e: arrayCultivos);
var
    i: integer;
begin
    for i:= 0 to dimLo do begin
        if(e[i].tipo = 'soja')then begin
            cantSoja:= cantSoja + e[i].hectareas;
        end;
        contadorHectareas:= contadorHectareas + e[i].hectareas;
    end;
end;

procedure tiempos(var tiempo1: integer; var tiempo2: integer; a: arrayCultivos; dimLo: integer; var nombre1, nombre2: string);
var
    i: integer;
begin
    for i:= 1 to dimLo do begin
        if(a[i].tipo = 'trigo')then begin
            tiempo1:= tiempo1 + a[i].mesesCiclo;
        end;
    end;
    if(tiempo1 > tiempo2)then begin
        tiempo2:= tiempo1;
        nombre2:= nombre1;
    end;
end;

procedure cultivitis(var c: arrayCultivos; dimLo: integer);
var
    i: integer;
begin
    for i:= 1 to dimLo do begin
        if(c[i].tipo = 'girasol')then begin
            if(c[i].hectareas < 5)then begin
                c[i].mesesCiclo:= c[i].mesesCiclo + 1;
            end;
        end;
    end;
end;

procedure informar(l: lista; var cantSoja: integer; var porcentaje: real; var empresaTiempo: string);
var
    contadorH: integer; tiempo1: integer; tiempo2: integer;
begin
    contadorH:= 0;
    while(l <> nil)do begin
        if(sanMiguel(l^.empresas))then begin
            writeln(l^.empresas.cod); writeln(l^.empresas.nombre);
        end;
        muchasHectareas(contadorH, cantSoja, l^.empresas.dimLo, l^.empresas.cultivos);
        tiempos(tiempo1, tiempo2, l^.empresas.cultivos, l^.empresas.dimLo, l^.empresas.nombre, empresaTiempo);
    end;
    porcentaje:= contadorH/cantSoja;
end;

procedure incrementar(var l: lista);
begin
    while(l<>nil)do begin
        if(l^.empresas.estatal = false)then begin
            cultivitis(l^.empresas.cultivos, l^.empresas.dimLo);
        end;
        l:= l^.sig;
    end;
end;

var
    l: lista; cantSoja: integer; empresaTiempo: string; porcentaje: real;
begin
    l:= nil; cantSoja:= 0;
    cargarLista(l);
    informar(l, cantSoja, porcentaje, empresaTiempo);
    writeln(cantSoja);
    writeln(porcentaje);
    writeln(empresaTiempo);
    incrementar(l);
end.
