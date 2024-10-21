program Ejercicio7;
type
    reseCenter=record
    nameCenter: string;
    university: string;
    cantRese: integer;
    trainees: integer;
    end;
    
procedure readReseCenter(var r: reseCenter);
begin
    with r do begin
        writeln('Ingrese cantidad de investigadores en el centro de investigación');
        readln(cantRese);
        if(cantRese > 0)then begin
            writeln('Ingrese nombre del centro de investigación');
            readln(nameCenter);
            writeln('Ingrese universidad a la que pertenece el centro de investigación');
            readln(university);
            writeln('Ingrese cantidad de becarios en el centro de investigación');
            readln(trainees);
        end;
    end;
end;

procedure bestCantReseUni(cant: integer;var maxCantRese: integer; currentCenter: string; var maxCantReseName: string);
begin
    if(cant > maxCantRese)then begin
        maxCantRese:= cant;
        maxCantReseName:= currentCenter;
    end;
end;

procedure bestCantTrainees(cant: integer;var highNumTra1: integer; var highNumTraName1: string; var highNumTra2: integer; var highNumTraName2: string; nameCenter: string);
begin
    if(cant > highNumTra1) then begin
        highNumTra2:= highNumTra1;
        highNumTraName2:= highNumTraName1;
        highNumTra1:= cant;
        highNumTraName1:= nameCenter;
    end
end;

var
    center: reseCenter;
    currentCenter, maxCantReseName, highNumTraName1, highNumTraName2: string;
    cantCenter, maxCantRese, maxCant1, maxCant2, highNumTra1, highNumTra2: integer;
begin
    currentCenter:= ''; maxCantReseName:= ''; highNumTraName1:= ''; highNumTraName2:= '';
    cantCenter:= 0; maxCantRese:= 0; maxCant1:= 0; maxCant2:= 0; highNumTra1:= 0; highNumTra2:= 0;
    readReseCenter(center);
    while (center.cantRese > 0) do begin
        currentCenter:= center.university;
        cantCenter:= 0;
        while((center.cantRese > 0) and (currentCenter = center.university)) do begin
            cantCenter:= cantCenter + 1;
            maxCant1:= maxCant1 + center.cantRese;
            maxCant2:= maxCant2 + center.trainees;
            bestCantTrainees(maxCant2, highNumTra1, highNumTraName1, highNumTra2, highNumTraName2, center.nameCenter);
            readReseCenter(center);
            maxCant2:= 0;
        end;
        bestCantReseUni(maxCant1, maxCantRese, currentCenter, maxCantReseName);
        writeln('La cantidad de centros de investigación que tiene la ', currentCenter, ' es de: ', cantCenter);
        maxCant1:= 0;
    end;
    writeln('La universidad con mayor cantidad de investigadores en sus centros es: ', maxCantReseName);
    writeln('Los dos centros con mayor cantidad de becarios son ', highNumTraName1, ', y ', highNumTraName2);
end.
