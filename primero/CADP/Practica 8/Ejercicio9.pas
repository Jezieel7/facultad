program CINE;
const
    generos= 8;
type
    arrayGeneros= array[1..generos] of real;
    
    pelicula=record
        cod: integer;
        titulo: string;
        codGenero: integer;
        puntaje: real;
    end;
    
    critico=record
        dni: integer;
        apellido: string;
        nombre: string;
        codPelicula: integer;
        puntaje: real;
    end;
    
    lista= ^nodo;
    
    nodo=record
        peliculas: pelicula;
        sig: lista;
    end;
    
procedure inicializarVector(v: arrayGeneros);
var
    i: integer;
begin
    for i:= 1 to generos do begin
        v[i]:= 0;
    end;
end;

procedure cargarCritico(c: critico);
begin
    with c do begin
        writeln('...');
        readln(dni);
        writeln('...');
        readln(codPelicula);
        if(codPelicula <> -1)then begin
            writeln('...');
            readln(apellido);
            writeln('...');
            readln(nombre);
            writeln('...');
            readln(codPelicula);
            writeln('...');
            readln(puntaje);
        end;
    end;
end;

function cpi(cod: integer): boolean;
var
    aux: integer; par: integer; impar: integer;
begin
    par:= 0; impar:= 0;
    while(cod <> 0)do begin
        aux:= cod mod 10;
        if((aux mod 2)= 0)then begin
            par:= par + 1;
        end
        else begin
            impar:= impar + 1;
        end;
        cod:= cod div 10;
    end;
    cpi:= (par = impar);
end;

procedure buscarPelicula(l: lista; codigo: integer; var peliculaActual: pelicula);
var
    act: lista;
begin
    act:= l;
    while(act<>nil)do begin
        if(act^.peliculas.cod = codigo)then begin
            peliculaActual:= act^.peliculas;
        end
        else begin
            act:= act^.sig;
        end;
    end;
end;

procedure actualizarPuntaje(var l: lista; codigo: integer; promPuntaje: real);
var
    act: lista;
begin
    act:= l;
    while(act<>nil)do begin
        if(act^.peliculas.cod = codigo)then begin
            act^.peliculas.puntaje:= promPuntaje;
        end
        else begin
            act:= act^.sig;
        end;
    end;
end;

procedure actualizar(var l: lista; var genero: integer);
var
    cantCriticos: integer; generos: arrayGeneros; c: critico; codAux: integer; promPuntaje: real; puntajes: real; peliculaActual: pelicula;
begin
    puntajes:= 0; cantCriticos:= 0;
    inicializarVector(generos);
    cargarCritico(c);
    while(c.codPelicula <> -1)do begin
        codAux:= c.codPelicula;
        while(c.codPelicula = codAux)do begin
            cantCriticos:= cantCriticos + 1;
            puntajes:= puntajes + c.puntaje;
            if(cpi(c.dni))then begin
                writeln(c.apellido);
                writeln(c.nombre);
            end;
            buscarPelicula(l, c.codPelicula, peliculaActual);
            generos[peliculaActual.codGenero]:= generos[peliculaActual.codGenero] + c.puntaje;
            cargarCritico(c);
        end;
        promPuntaje:= puntajes/cantCriticos;
        actualizarPuntaje(l, peliculaActual.cod, promPuntaje);
    end;
end;

procedure eliminar(var l: lista; v: integer);
var
    ant, act: lista;
begin
    ant:= l; act:= l;
    while((act <> nil) and (act^.peliculas.cod <> v))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act <> nil)then begin
        if(act = l)then begin
            l:= l^.sig;
        end
        else begin
            ant^.sig:= act^.sig;
        end;
        dispose(act);
    end;
end;

var
    l: lista; mayorGeneros: integer; valor: integer;
begin
    l:= nil;
    cargarLista(l);
    actualizar(l, mayorGeneros);
    writeln(mayorGeneros);
    readln(valor);
    eliminar(l, valor);
end.
