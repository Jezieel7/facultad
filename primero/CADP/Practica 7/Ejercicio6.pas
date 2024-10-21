program Excercise6;
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

function qualifies(sc: spacecraft): boolean;
begin
    qualifies:= ((sc.maintenanceCost > sc.constructionCost) and (sc.electro <> 1));
end;

procedure ScrollList(l: listSpacecraft);
var
    sc: spacecraft;
begin
    while(l <> nil)do begin
        sc:= l^.element;
        if(qualifies(sc))then begin
            writeln('La sonda cumple las condiciones');
        end
        else begin
            writeln('La sonda no cumple las condiciones');
        end;
        l:= l^.next;
    end;
end;

var
    scList: listSpacecraft;
begin
    repeat
        loadSpacecraft(sc);
        loadList(scList, sc);
    until(sc.name = 'GAIA');
    ScrollList(scList);
end.

b)
program Excercise6;
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

function qualifies(sc: spacecraft): boolean;
begin
    qualifies:= ((sc.maintenanceCost > sc.constructionCost) and (sc.electro <> 1))
end;

procedure QualifiesOrNot(l: listSpacecraft; var li: listSpacecraftQualifies; var lis: listSpacecraftQualifies);
var
    sc: spacecraft;
begin
    while(l <> nil)do begin
        sc:= l^.element;
        if(qualifies(sc))then begin
            writeln('La sonda cumple las condiciones');
            loadList(li, sc);
        end
        else begin
            writeln('La sonda no cumple las condiciones');
            loadList(lis, sc);
        end;
        l:= l^.next;
    end;
end;

var
    sc: spacecraft;
    scList, li, lis: listSpacecraft;
begin
    scList:= nil; li:= nil; lis:= nil;
    repeat
        loadSpacecraft(sc);
        loadList(scList, sc);
    until(sc.name = 'GAIA');
    QualifiesOrNot(scList, li, lis);
end.

c)
program Excercise6;
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

function qualifies(sc: spacecraft): boolean;
begin
    qualifies:= ((sc.maintenanceCost > sc.constructionCost) and (sc.electro <> 1));
end;

procedure total(l: listSpacecraft);
var
    totalCostMaintenance, totalCostConstruction: real;
begin
    totalCostMaintenance:= 0;
    totalCostConstruction:= 0;
    while(l <> nil)do begin
        totalCostMaintenance:= totalCostMaintenance + l^.element.maintenanceCost;
        totalCostConstruction:= totalCostConstruction + l^.element.constructionCost;
    end;
    writeln('El costo de mantenimiento total es de: ', totalCostMaintenance);
    writeln('El costo de mantenimiento total es de: ', totalCostConstruction);
end;

procedure QualifiesOrNot(l: listSpacecraft; var li: listSpacecraftQualifies; var lis: listSpacecraftQualifies);
var
    sc: spacecraft;
begin
    while(l <> nil)do begin
        sc:= l^.element;
        if(qualifies(sc))then begin
            writeln('La sonda cumple las condiciones');
            loadList(li, sc);
        end
        else begin
            writeln('La sonda no cumple las condiciones');
            loadList(lis, sc);
        end;
        l:= l^.next;
    end;
    total(lis);
end;

var
    sc: spacecraft;
    scList, li, lis: listSpacecraft;
begin
    scList:= nil; li:= nil; lis:= nil;
    repeat
        loadSpacecraft(sc);
        loadList(scList, sc);
    until(sc.name = 'GAIA');
    QualifiesOrNot(scList, li, lis);
end.
