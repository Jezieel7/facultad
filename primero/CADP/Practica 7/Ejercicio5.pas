program Excercise5;
type
    electroSpectrum = 1..7;
    
    spacecraft=record
        name: string;
        durationMision: integer;
        constructionCost: real;
        maintenanceCost: real;
        electro: integer;
    end;
    
    listSpacecraft= ^node;
    
    node=record
        element: spacecraft;
        next: listSpacecraft;
    end;
    
    spectrum = array[electroSpectrum] of integer;
    
procedure loadSpacecraft(var values: spacecraft);
begin
    with values do begin
        writeln('Introduzca nombre de la sonda');
        readln(name);
        writeln('Introduzca la duración estimada de la misión');
        readln(durationMision);
        writeln('Introduzca el costo de construcción');
        readln(constructionCost);
        writeln('Introduzca el costo de mantenimiento mensual');
        readln(maintenanceCost);
        writeln('Introduzca el rango del espectro electromagnético sobre el que realizará estudios');
        readln(electro);
    end;
end;
procedure loadList(var l: listSpacecraft; value: spacecraft);
var
    aux: listSpacecraft;
begin
    new(aux); aux^.element:= value; aux^.next:= l;
    l:= aux;
end;

procedure initialize(var v: spectrum);
var
    i: integer;
begin
    for i:= 0 to 7 do begin
        v[i]:= 0;
    end;
end;

procedure writeVector(v: spectrum);
var
    i: integer;
begin
    for i:= 1 to 7 do begin
        writeln('la cantidad de sondas que realizarán estudios en el rango, ', i,' del espectro electromagnético fue de ',  v[i]);
    end;
end;

procedure information(l: listSpacecraft; var arraySpectrum: spectrum; var maxCostSpacecraftName: string; var promDuration: real; var promCost: real);
var
    antMaxCost, auxMaxCost, cantDuration, cantCost: real;
    maxName: string;
    cantSpacecraft: integer;
begin
    auxMaxCost:= -99999;
    cantSpacecraft:= 0;
    cantDuration:= 0;
    cantCost:= 0;
    while(l <> nil)do begin
        antMaxCost:= l^.element.maintenanceCost * l^.element.durationMision + (l^.element.constructionCost);
        if(antMaxCost > auxMaxCost)then begin
            auxMaxCost:= antMaxCost;
            maxName:= l^.element.name;
        end;
        arraySpectrum[l^.element.electro]:= arraySpectrum[l^.element.electro] + 1;
        cantSpacecraft:= cantSpacecraft + 1;
        cantDuration:= cantDuration + l^.element.durationMision;
        cantCost:= cantCost + l^.element.constructionCost;
        l:= l^.next;
    end;
    maxCostSpacecraftName:= maxName;
    promDuration:= (cantDuration / cantSpacecraft);
    promCost:= (cantCost / cantSpacecraft);
end;

procedure cantSDMaxCost(l: listSpacecraft; promDuration: real; var cant: integer; promCost: real);
begin
    while(l <> nil)do begin
        if(l^.element.durationMision > promDuration)then begin
            cant:= cant + 1;
        end;
        if(l^.element.constructionCost > promCost)then begin
            writeln('La sonda ', l^.element.name, ' supera el costo promedio de construcción');
        end;
        l:= l^.next;
    end;
end;

var
    sc: listSpacecraft;
    values: spacecraft;
    arrSpectrum: spectrum;
    maxCostSpacecraftName: string;
    promDuration, promCost: real;
    cant: integer;
begin
    promDuration:= 0;
    promCost:= 0;
    cant:= 0;
    sc:= nil;
    maxCostSpacecraftName:= '';
    initialize(arrSpectrum);
    repeat
        loadSpacecraft(values);
        loadList(sc, values);
    until(values.name = 'GAIA');
    information(sc, arrSpectrum, maxCostSpacecraftName, promDuration, promCost);
    writeln('El nombre de la sonda más costosa es: ', maxCostSpacecraftName);
    writeVector(arrSpectrum);
    cantSDMaxCost(sc, promDuration, cant, promCost);
    writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas es de ', cant);
end.
