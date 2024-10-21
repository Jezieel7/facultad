program ejercicio13;
const
    cantUsuarios= 3600;
type
    usuarios=record
        email: string;
        rol: integer;
        revista: string;
        cantDiasUA: integer;
    end;
    
    listaUsuarios= ^nodo;
    
    nodo=record
        usuario: usuarios;
        sig: listaUsuarios;
    end;
    
    cantPorRol= array[1..4] of integer;

procedure cargarUsuario(var u: usuarios);
begin
    with u do begin
        writeln('Introduzca email del usuario');
        readln(email);
        writeln('Introduzca rol del usuario');
        readln(rol);
        writeln('Introduzca revista del usuario');
        readln(revista);
        writeln('Introduzca cantidad de dias desde el último acceso del usuario');
        readln(cantDiasUA);
    end;
end;

procedure cargarLista(var l: listaUsuarios; u: usuarios);
var
    aux, act, ant: listaUsuarios;
begin
    new(aux); aux^.usuario:= u; aux^.sig:= nil;
    if(l = nil)then begin
        l:= aux;
    end
    else begin
        act:= l; ant:= l;
        while((act <> nil) and (act^.usuario.cantDiasUA < aux^.usuario.cantDiasUA)) do begin
            ant:= act; act:= act^.sig;
        end;
    end;
    if(act = l) then begin
        aux^.sig:= l;
        l:= aux;
    end
    else begin
        ant^.sig:= aux;
        aux^.sig:= act;
    end;
end;

procedure inicializarArray(r: cantPorRol);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        r[i]:= 0;
    end;
end;

procedure procesarCosas(l: listaUsuarios; var r: cantPorRol; var usuarioUno: string; var usuarioDos: string);
var
    aux1, aux2: integer;
begin
    aux1:= 0; aux2:= 0;
    while(l <> nil) do begin
        r[l^.usuario.rol]:= r[l^.usuario.rol] + 1;
        if(l^.usuario.revista = 'Económica') then begin
            writeln('El siguiente usuario pertenece a la revista Económica: ');
            writeln(l^.usuario.email);
            writeln(l^.usuario.cantDiasUA);
        end;
        if(l^.usuario.cantDiasUA > aux1)then begin
            aux2:= aux1;
            usuarioDos:= usuarioUno;
            aux1:= l^.usuario.cantDiasUA;
            usuarioUno:= l^.usuario.email;
        end
else if(l^.usuario.cantDiasUA > aux2)then begin
            aux2:= l^.usuario.cantDiasUA;
            usuarioUno:= l^.usuario.email;
        end;
        l:= l^.sig;
    end;
end;

procedure imprimirArray(r: cantPorRol);
var
    i: integer;
begin
    for i:= 1 to 4 do begin
        writeln(r[i]);
    end;
end;

var
    listado: listaUsuarios;
    u: usuarios;
    i: integer;
    r: cantPorRol;
    usuarioUno, usuarioDos: string;
begin
    listado:= nil;
    inicializarArray(r);
    for i:= 1 to cantUsuarios do begin
        cargarUsuario(u);
        cargarLista(listado, u);
    end;
    ProcesarCosas(listado, r, usuarioUno, usuarioDos);
    imprimirArray(r);
    writeln('los emails de los dos usuarios que hace más tiempo que no ingresan al portal ', usuarioUno, ' , ', usuarioDos);
end.
