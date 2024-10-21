program excercise11;
const
    numTravel= 200;
    
type
    travel= record
    dayMonth: integer;
    money: real;
    distance: real;
    end;
    
    vectorTravel= array [1..numTravel] of travel;
    
procedure readTravel(var t: travel);
begin
    with t do begin
        writeln('Introduzca la distancia recorrida (en KM)');
        readln(distance);
        if(distance <> 0) then begin
            writeln('Introduzca día del mes del viaje');
            readln(dayMonth);
            writeln('Introduzca el dinero transportado');
            readln(money);
        end;
    end;
end;

procedure loadVector(var vecTravel: vectorTravel; var dimL: integer);
var
    t: travel;
begin
    readTravel(t);
    while((dimL < numTravel) and (vecTravel[dimL].distance <> 0)) do begin
        dimL:= dimL + 1;
        vecTravel[dimL]:= t;
        readTravel(t);
    end;
end;

procedure money(vecTravel: vectorTravel; dimL: integer; var promMoney: real; var maxDistance: real; var maxMoney: real; var maxDay: integer);
var
    i: integer;
    auxMoney: real;
begin
    auxMoney:= -1;
    for i:= 1 to dimL do begin //por cada elemento del vector
        auxMoney:= auxMoney + vecTravel[i].money; //monto máximo transportado para poder hacer el promedio
        if(maxMoney < vecTravel[i].money)then begin //algoritmo de máximo
            maxMoney:= vecTravel[i].money;
            maxDistance:= vecTravel[i].distance;
            maxDay:= vecTravel[i].dayMonth;
        end;
    end;
    promMoney:= auxMoney/dimL; //El monto promedio transportado de los viajes realizados
end;

procedure removeTravels(var vecTravel: vectorTravel; var dimL: integer);
var
    i, j: integer;
begin
    for i:= 1 to dimL do begin
        if(vecTravel[i].distance = 100) then begin
            for j:= i to (dimL - 1) do begin
                vecTravel[j]:= vecTravel[j+1]
            end;
            dimL:= dimL - 1;
        end;
    end;
end;

var
    dimL, maxDay: integer;
    vecTravel: vectorTravel;
    promMoney, maxDistance, maxMoney: real;
begin
    dimL:= 0; promMoney:= -1; maxDistance:= -1; maxMoney:= -1;
    loadVector(vecTravel, dimL); //inciso A
    money(vecTravel, dimL, promMoney, maxDistance, maxMoney, maxDay); //inciso B
    writeln('El monto promedio transportado de los viajes realizados es de', promMoney:2:2);
    writeln('La distancia recorrida y el día del mes en que se realizó el viaje que transportó más dinero ', maxDistance:2:2, ', el dia ', maxDay);
    removeTravels(vecTravel, dimL); //inciso C
end.
