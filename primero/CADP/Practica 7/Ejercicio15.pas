program Ejercicio15;
type
    corredor=record
        nombreApellido: string;
        distanciaKM: real;
        tiempo: real;
        pais: string;
        ciudadIni: string;
        ciudadFin: string;
    end;
    
    listaCorredores= ^nodo;
    
    nodo=record
        corredores: corredor;
        sig: listaCorredores;
    end;
    
procedure cargarCorredor(var c: corredor);
begin
    with c do begin
        writeln('Ingrese el nombre y apellido del corredor');
        readln(nombreApellido);
        writeln('Ingrese la distancia recorrida en KM del corredor');
        readln(distanciaKM);
        writeln('Ingrese el tiempo que estuvo corriendo');
        readln(tiempo);
        writeln('Ingrese el pais desde el que partió');
        readln(pais);
        writeln('Ingrese la ciudad en la que inicio');
        readln(ciudadIni);
        writeln('Ingrese la ciudad donde finalizó');
        readln(ciudadFin);
    end;
end;

procedure insertar(var l: listaCorredores; var c: corredor);
var
    aux, ant, act: listaCorredores;
begin
    new(aux); aux^.corredores:= c; aux^.sig:= nil;
    act:= l; ant:= l;
    while((act <> nil) and (act^.corredores.pais < aux^.corredores.pais))do begin
        ant:= act; act:= act^.sig;
    end;
    if(act = ant)then begin
        l:= aux;
    end
    else begin
        ant^.sig:= aux;
        aux^.sig:= act;
    end;
end;

procedure cargarLista(var l: listaCorredores);
var
    c: corredor;
begin
    cargarCorredor(c);
    while(c.nombreApellido <> '123')do begin
        insertar(l, c);
        cargarCorredor(c);
    end;
end;

procedure totales(var tC: integer; var tD: real; var tT: real; distancia: real; tiempo: real);
begin
    tC:= tC + 1;
    tD:= tD + distancia;
    tT:= tT + tiempo;
end;

procedure totalCiudad(var cantCorredores: integer; var cantKM: real; KM: real);
begin
    cantCorredores:= cantCorredores + 1; //suma corredor de la misma ciudad a la variable del inciso B
    cantKM:= cantKM + KM; // suma distancia recorrida de corredores de la misma ciudad inciso B
end;

procedure maxCiudad(var maxCantCorredores: integer; cantCorredores: integer; var maxCantKM: real; cantKM: real; var maxNombreC: string; nombreC: string);
begin
    if(cantCorredores > maxCantCorredores)then begin 
        maxCantCorredores:= cantCorredores; //maxCantCorredores siempre tendra el valor de la ciudad que mas corredores tiene inciso B
        maxNombreC:= nombreC; // maxNombreC siempre tendra el nombre de la ciudad que mas corredores tiene inciso B
        maxCantKM:= cantKM; // maxCantKM siempre tendra el total de KM de la ciudad que mas corredores tiene inciso B
    end;
end;

procedure totalBrasil(var Corredor: integer; var distancia: real; distanciaKM: real);
begin
    Corredor:= Corredor + 1; // suma total corredores de Brasil inciso C
    distancia:= distancia + distanciaKM; // suma total KM inciso C
end;

function ciudadIniFin(ciudadInicio: string; ciudadFin: string): boolean;
begin
    ciudadIniFin:= (ciudadInicio <> ciudadFin); //Si la ciudad de inicio y fin es distinta da true ._. inciso D
end;

procedure totalBoston(var tiempo: real; t: real; var distancia: real; d: real);
begin
    tiempo:= tiempo + t; //suma los tiempos de los de Boston inciso E
    distancia:= distancia + d; // suma la distancia de los corredores de Boston inciso E
end;

procedure informar(l:listaCorredores; var totalCorredor: integer; var totalDistancia: real; var totalTiempo: real; var mayorCiudad: string; var totalKMCiudad: real; var promBrasil: real; var cantDCiudad: integer; var promBoston: real);
var
    auxC, auxC2: integer; //aux de la ciudad que mas corredores tiene y contadora auxiliar de la cantidad de corredores por ciudad inciso B
    auxNombreC: string; // auxiliar de Nombre de ciudad inciso B
    auxTotalKMCiudad: real; //contabiliza el total de KM de los corredores de la ciudad inciso B
    KMCiudad: real;
    auxPais: string; //Para saber si el pais es Brasil inciso C
    distanciaBrasil: real; // contabiliza el total de KM de los corredores de Brasil inciso C
    BrasilBool: boolean; // Para que el promedio no se ejecute mas de una vez inciso C
    cantCBrasil: integer; //Para contabilizar los corredores de Brasil inciso C
    minBoston: real; // los min corriendo por los de Boston inciso E
    kmBoston: real; // los KM recorridos por los de Boston inciso E
    BostonBool: boolean; // Para que el paso no se ejecute mas de una vez inciso E
begin
    auxC2:= 0; KMCiudad:= 0; //Inicializo las variables del inciso B
    distanciaBrasil:= 0; BrasilBool:= false; cantCBrasil:= 0; // Inicializo las variables del inciso C
    minBoston:= 0; kmBoston:= 0; BostonBool:= false; // Inicializo las variables del inciso E
    while(l <> nil) do begin
        auxNombreC:= l^.corredores.ciudadIni;
        auxPais:= l^.corredores.pais; 
        while((l <> nil) and (l^.corredores.pais = auxPais))do begin //para verificar que el pais sea el mismo inciso C
            if(auxPais = 'Brasil')then begin //si el pais es Brasil, entrara a un while donde se tomara la distancia de los corredores de Brasil, de esta forma si es pais no es Brasil, no valida durante toda la lista si es Brasil, sino que lo hace solo cuando cambia el pais inciso C
                while((l <> nil) and (l^.corredores.ciudadIni = auxNombreC))do begin //mientras la lista no termine y la ciudad sea la misma
                    totales(totalCorredor, totalDistancia, totalTiempo, l^.corredores.distanciaKM, l^.corredores.tiempo); // actualiza los totales del inciso A.
                    totalCiudad(auxC2, KMCiudad, l^.corredores.distanciaKM); //suma totales por ciudad inciso B
                    totalBrasil(cantCBrasil, distanciaBrasil, l^.corredores.distanciaKM); // suma totales para Brasil inciso C
                    if(ciudadIniFin(l^.corredores.ciudadIni, l^.corredores.ciudadFin))then begin
                        cantDCiudad:= cantDCiudad + 1; //suma 1 corredor, si la ciudad de inicio y de fin es la misma inciso C
                    end;
                    l:= l^.sig; //siguiente corredor
                end;
                maxCiudad(auxC, auxC2, totalKMCiudad, KMCiudad, mayorCiudad, auxNombreC); // actualiza la ciudad que mas corredores tiene inciso B
                auxC2:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
                KMCiudad:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
            end
            else begin
                if(auxNombreC = 'Boston')then begin
                    while((l <> nil) and (l^.corredores.ciudadIni = auxNombreC))do begin //mientras la lista no termine y la ciudad sea la misma
                        totales(totalCorredor, totalDistancia, totalTiempo, l^.corredores.distanciaKM, l^.corredores.tiempo); // actualiza los totales del inciso A.
                        totalCiudad(auxC2, KMCiudad, l^.corredores.distanciaKM); //suma totales por ciudad inciso B
                        if(ciudadIniFin(l^.corredores.ciudadIni, l^.corredores.ciudadFin))then begin
                            cantDCiudad:= cantDCiudad + 1; //suma 1 corredor, si la ciudad de inicio y de fin es distinta inciso C
                        end;
                        totalBoston(minBoston, l^.corredores.tiempo, kmBoston, l^.corredores.distanciaKM); // calcula E
                        l:= l^.sig; //siguiente corredor
                    end;
                    maxCiudad(auxC, auxC2, totalKMCiudad, KMCiudad, mayorCiudad, auxNombreC); // actualiza la ciudad que mas corredores tiene inciso B
                    auxC2:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
                    KMCiudad:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
                end
                else begin
                    while((l <> nil) and (l^.corredores.ciudadIni = auxNombreC))do begin //mientras la lista no termine y la ciudad sea la misma
                        totales(totalCorredor, totalDistancia, totalTiempo, l^.corredores.distanciaKM, l^.corredores.tiempo); // actualiza los totales del inciso A.
                        totalCiudad(auxC2, KMCiudad, l^.corredores.distanciaKM); //suma totales por ciudad inciso B
                        if(ciudadIniFin(l^.corredores.ciudadIni, l^.corredores.ciudadFin))then begin
                            cantDCiudad:= cantDCiudad + 1; //suma 1 corredor, si la ciudad de inicio y de fin es distinta inciso C
                        end;
                        l:= l^.sig; //siguiente corredor
                    end;
                    maxCiudad(auxC, auxC2, totalKMCiudad, KMCiudad, mayorCiudad, auxNombreC); // actualiza la ciudad que mas corredores tiene inciso B
                    auxC2:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
                    KMCiudad:= 0; //se reinicia la variable, para volver a contar la proxima ciudad inciso B
                end;
                if not(BostonBool)then begin
                    promBoston:= kmBoston / minBoston;
                    BostonBool:= true;
                end;
            end;
            if not(BrasilBool)then begin //Se ejecuta solo una vez, para tener el promedio una vez que se contabilizaron los corredores de Brasil
                promBrasil:= distanciaBrasil / cantCBrasil;
                BrasilBool:= true;
            end;
        end;
    end;
end;
var
    l: listaCorredores;
    totalCorredor: integer;
    totalDistancia: real;
    totalTiempo: real;
    mayorCiudad: string;
    totalKMCiudad: real;
    promBrasil: real;
    cantDCiudad: integer;
    promBoston: real;
begin
    totalCorredor:= 0; totalDistancia:= 0; totalTiempo:= 0; totalKMCiudad:= 0;
    promBrasil:= 0; cantDCiudad:= 0; promBoston:= 0;
    l:= nil;
    cargarLista(l);
    informar(l, totalCorredor, totalDistancia, totalTiempo, mayorCiudad, totalKMCiudad, promBrasil, cantDCiudad, promBoston);
    writeln('Inciso a', totalCorredor, ', ', totalDistancia, ', ', totalTiempo);
    writeln('Inciso b', mayorCiudad, ', ',totalKMCiudad);
    writeln('Inciso c', promBrasil);
    writeln('Inciso d', cantDCiudad);
    writeln('Inciso e', promBoston);
end.
