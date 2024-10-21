Program OBSERVATORIO;
const
    canCat= 7;
type
    arrayCat= array[1..canCat] of integer;
    
    categoriaSubrango= 1..7;
    
    objeto=record
        codigo: integer;
        categoria: categoriaSubrango;
        nombre: string;
        distancia: real;
        nombreDes: string;
        anoDes: integer;
    end;
    
    lista= ^nodo;
    
    nodo=record
        objetos: objeto;
        sig: lista;
    end;
    
procedure cargarObjeto(var o: objeto);
begin
    with o do begin
        writeln('Introduzca código de objeto');
        readln(codigo);
        if(codigo <> -1)then begin
            writeln('Introduzca la cetegoría del objeto');
            readln(categoria);
            writeln('Introduzca el nombre del objeto');
            readln(nombre);
            writeln('Introduzca la distancia');
            readln(distancia);
            writeln('Introduzca el nombre del descubridor');
            readln(nombreDes);
            writeln('Introduzca el año de descubrimiento');
            readln(anoDes);
        end;
    end;
end;

procedure inicializarVector(var a: arrayCat);
var
    i: integer;
begin
    for i:= 1 to canCat do begin
        a[i]:= 0;
    end;
end;

procedure agregarFinal(var l: lista; o: objeto);
var
    aux: lista; act: lista;
begin
    new(aux); aux^.objetos:= o; aux^.sig:= nil;
    if(l = nil)then begin
        l:= aux;
    end
    else begin
        act:= l;
        while(act <> nil) do begin
            act:= act^.sig;
        end;
        act^.sig:= aux;
    end;
end;

procedure cargarLista(var l: lista);
var
    o: objeto;
begin
    cargarObjeto(o);
    while(o.codigo <> -1)do begin
        agregarFinal(l, o);
        cargarObjeto(o);
    end;
end;

procedure actualizarMaximos(auxDistancia: real; var auxDistancia2: real; var cod1: integer; var auxDistancia3: real; var cod2: integer; codigo: integer);
begin
    if(auxDistancia > auxDistancia2)then begin
        auxDistancia3:= auxDistancia2;
        cod2:= cod1;
    end
    else if(auxDistancia > auxDistancia3)then begin
        auxDistancia3:= auxDistancia;
        cod2:= codigo;
    end;
end;

function GG1600(nombre: string; ano: integer): Boolean;
begin
    GG1600:= ((nombre = 'Galileo Galilei') and (ano = 1600));
end;

function masPares(codigo: integer): Boolean;
var
    aux: integer; pares: integer; impares: integer;
begin
    pares:= 0; impares:= 0;
    while(codigo <> 0)do begin
        aux:= codigo mod 10;
        if((aux mod 2)= 0)then begin
            pares:= pares + 1;
        end
        else begin
            impares:= impares + 1;
        end;
        codigo:= codigo div 10;
    end;
    masPares:= (pares > impares);
end;

procedure imprimirArray(a: arrayCat);
var
    i: integer;
begin
    for i:= 1 to canCat do begin
        writeln('La cantidad de objetos de la categoria', i, 'es de', a[i]);
    end;
end;

procedure informar(l:lista; var cod1: integer; var cod2: integer; var cantPlanetas: integer; var cantCat: arrayCat);
var
    auxDistancia: real; auxDistancia2: real; auxDistancia3: real;
begin
    auxDistancia:= 0; auxDistancia2:= 0; auxDistancia3:= 0;
    while(l <> nil)do begin
        auxDistancia:= l^.objetos.distancia;
        actualizarMaximos(auxDistancia, auxDistancia2, cod1, auxDistancia3, cod2, l^.objetos.codigo); //Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
        if(GG1600(l^.objetos.nombreDes, l^.objetos.anoDes))then begin
            cantPlanetas:= cantPlanetas + 1; //La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
        end;
        cantCat[l^.objetos.categoria]:= cantCat[l^.objetos.categoria] + 1; // actualiza la cantidad de objetos observados por cada categoría.
        if(maspares(l^.objetos.codigo))then begin
            writeln(l^.objetos.nombre); //Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
        end;
        l:= l^.sig;
    end;
end;

var
    l: lista;
    cod1, cod2, cantPlanetas: integer;
    cantCat: arrayCat;
begin
    l:= nil;
    cod1:= 0; cod2:= 0; cantPlanetas:= 0;
    inicializarVector(cantCat);
    cargarLista(l); //inciso A
    informar(l, cod1, cod2, cantPlanetas, cantCat); //inciso B
    writeln('Los códigos de los dos objetos más lejanos a la Tierra son: ', cod1, ' y ', cod2);
    writeln('La cantidad de planetas descubiertos por Galileo ', cantPlanetas);
    writeln('La cantidad de objetos observados por categoria');
    imprimirArray(cantCat); //imprime la cantidad de objetos observados por cada categoría.
end.
