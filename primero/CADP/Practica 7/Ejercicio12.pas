program ejercicio12;
type
    lista= ^nodo;
    
    dispositivo=record
        versionAndroid: real;
        tamanoPantalla: real;
        cantMemoriaRam: integer;
    end;
    
    nodo=record
        d: dispositivo;
        sig: lista;
    end;

procedure cantDisVerAn( l: lista; var cantAltaGama: integer; var prom: real);
var
    auxVersion: real;
    aux: real;
    cantDispositivos: integer;
    cantVersion: integer;
begin
    aux:= 0; cantDispositivos:= 0; cantVersion:= 0;
    while(l <> nil)do begin
        auxVersion:= l^.d.versionAndroid;
        cantVersion:= 0;
        while((l<>nil) and (l^.d.versionAndroid = auxVersion)) do begin
            cantVersion:= cantVersion + 1;
            if((l^.d.cantMemoriaRam > 3) and (l^.d.tamanoPantalla >= 5)) then begin
                cantAltaGama:= cantAltaGama + 1;
            end;
            aux:= aux + l^.d.tamanoPantalla;
            cantDispositivos:= cantDispositivos + 1;
            l:= l^.sig;
        end;
        writeln('La cantidad de dispositivos para la version ', auxVersion, ' de android, es de ', cantVersion);
    end;
    if(cantDispositivos > 0)then begin
        prom:= aux / cantDispositivos;
    end;
end;

var
    listado: lista;
    cantVersion, cantAltaGama: integer;
    prom: real;
begin
    listado:= nil; cantAltaGama:= 0; prom:= 0;
    cargarListado(listado);
    cantDisVerAn(listado, cantAltaGama, prom);
    writeln('La cantidad de dispositivos que tienen más de 3GB de ram y tienen una pantalla de al menos 5 pulgadas es de ', cantAltaGama);
    writeln('El tamaño promedio de las pantallas de todos los dispositivos es de ', prom:2:2);
end.
