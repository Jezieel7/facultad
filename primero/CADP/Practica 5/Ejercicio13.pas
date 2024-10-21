program excercise13;
const
    numGalaxy= 53;
    numType= 4;
type
    galaxy= record
    name: string;
    gType: string;
    mass: real;
    distance: real;
    end;
    
    vGalaxy= array[1..numGalaxy] of galaxy;
    vType= array[1..numType] of integer;
    
procedure readGalaxy(var g: galaxy);
begin
    with g do begin
        writeln('Introduzca el nombre de la galaxia');
        readln(name);
        writeln('Introduzca el tipo de galaxia');
        readln(gType);
        writeln('Introduzca la masa de la galaxia');
        readln(mass);
        writeln('Introduzca la distancia desde la tierra a la galaxia');
        readln(distance);
    end;
end;

procedure loadVector(var vecGalaxy: vGalaxy);
var
    g: galaxy;
    i: integer;
begin
    for i:= 1 to numGalaxy do begin
        readGalaxy(g);
        vecGalaxy[i]:= g;
    end;
end;

procedure numGPerType(vecGalaxy: vGalaxy; var vecType: vType);
var
    i: integer;
begin
    for i:= 1 to numGalaxy do begin
        case vecGalaxy[i].gType of
            'elíptica': vecType[1]:= vecType[1] + 1;
            'espiral':  vecType[2]:= vecType[2] + 1;
            'lenticular': vecType[3]:= vecType[3] + 1;
            'irregular': vecType[4]:= vecType[4] + 1;
        else
            writeln('error');
        end;
    end;
end;

procedure massAccu(vecGalaxy: vGalaxy; var totalMass: real; var percentage: real);
var
    i: integer;
    auxMass: real;
begin
    auxMass:= 0;
    for i:= 1 to numGalaxy do begin
        if(vecGalaxy[i].name = 'Vía Láctea')then begin
            totalMass:= totalMass + vecGalaxy[i].mass;
            auxMass:= auxMass + vecGalaxy[i].mass;
        end
        else if(vecGalaxy[i].name = 'Andrómeda')then begin
            totalMass:= totalMass + vecGalaxy[i].mass;
            auxMass:= auxMass + vecGalaxy[i].mass;
        end
        else if(vecGalaxy[i].name = 'Triángulo')then begin
            totalMass:= totalMass + vecGalaxy[i].mass;
            auxMass:= auxMass + vecGalaxy[i].mass;
        end
        else begin
            auxMass:= auxMass + vecGalaxy[i].mass;
        end;
    end;
    percentage:= ((totalMass/auxMass)*100);
end;

function numNotIrregular(vecGalaxy: vGalaxy): integer;
var
    i, g: integer;
begin
    g:= 0;
    for i:= 1 to numGalaxy do begin
        if(vecGalaxy[i].gType <> 'irregular')then begin
            if(vecGalaxy[i].distance < 1000)then begin
                g:= g + 1;
            end;
        end;
    end;
    numNotIrregular:= g;
end;

procedure maxMinMass(vecGalaxy: vGalaxy; var maxMassGalaxy1: real; var maxNameGalaxy1: string; var maxMassGalaxy2: real; var maxNameGalaxy2: string; var minMassGalaxy1: real; var minNameGalaxy1: string; var minMassGalaxy2: real; var minNameGalaxy2: string);
var
    i: integer;
begin
    for i:= 1 to numGalaxy do begin
        if(vecGalaxy[i].mass > maxMassGalaxy1)then begin
            maxMassGalaxy2:= maxMassGalaxy1;
            maxNameGalaxy2:= maxNameGalaxy1;
            maxMassGalaxy1:= vecGalaxy[i].mass;
            maxNameGalaxy1:= vecGalaxy[i].name;
        end;
        if(vecGalaxy[i].mass > maxMassGalaxy2)then begin
            maxMassGalaxy2:= vecGalaxy[i].mass;
            maxNameGalaxy2:= vecGalaxy[i].name;
        end;
        if(vecGalaxy[i].mass < minMassGalaxy1)then begin
            minMassGalaxy2:= minMassGalaxy1;
            minNameGalaxy2:= minNameGalaxy1;
            minMassGalaxy1:= vecGalaxy[i].mass;
            minNameGalaxy1:= vecGalaxy[i].name;
        end;
        if(vecGalaxy[i].mass < minMassGalaxy2)then begin
            minMassGalaxy2:= vecGalaxy[i].mass;
            minNameGalaxy2:= vecGalaxy[i].name;
        end;
    end;
end;

var
    vecGalaxy: vGalaxy;
    vecType: vType;
    totalMass, percentage, maxMassGalaxy1, maxMassGalaxy2, minMassGalaxy1, minMassGalaxy2: real;
    maxNameGalaxy1, maxNameGalaxy2, minNameGalaxy1, minNameGalaxy2: string;
begin
    totalMass:= 0; percentage:= 0; maxMassGalaxy1:= -999; maxMassGalaxy2:= -999; minMassGalaxy1:= 9999; maxMassGalaxy2:= 9999;
    loadVector(vecGalaxy);
    numGPerType(vecGalaxy, vecType);
    massAccu(vecGalaxy, totalMass, percentage);
    maxMinMass(vecGalaxy, maxMassGalaxy1, maxNameGalaxy1, maxMassGalaxy2, maxNameGalaxy2, minMassGalaxy1, minNameGalaxy1, minMassGalaxy2, minNameGalaxy2);
    writeln('La cantidad de galaxias elípticas es de: ', vectype[1]);
    writeln('La cantidad de galaxias espirales es de: ', vectype[2]);
    writeln('La cantidad de galaxias lenticulares es de: ', vectype[3]);
    writeln('La cantidad de galaxias irregulares es de: ', vectype[4]);
    writeln('La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) es de: ', totalMass);
    writeln('El porcentaje que esto representa respecto a la masa de todas las galaxias es de: ', percentage);
    writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es de: ', numNotIrregular(vecGalaxy));
    writeln('El nombre de las dos galaxias con mayor masa es: ', maxNameGalaxy1, ', ', maxNameGalaxy2);
    writeln('El nombre de las dos galaxias con menor masa es: ', minNameGalaxy1, ', ', minNameGalaxy2);
end.
