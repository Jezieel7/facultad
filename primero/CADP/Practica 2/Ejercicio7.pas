program Ejercico7;
var
    pilotName, lastTotalTimeName1, lastTotalTimeName2, firstTotalTimeName1, firstTotalTimeName2: string;
    totalTime, lastTotalTime1, lastTotalTime2, firstTotalTime1, firstTotalTime2: real;
    i: integer;
begin
    firstTotalTime1:= 32768;
    firstTotalTime2:= 32768;
    lastTotalTime1:= -32767;
    lastTotalTime2:= -32767;
    for i:= 1 to 100 do begin
        writeln('Nombre de piloto');
        readln(pilotName);
        writeln('Tiempo total de finalización de carrera');
        readln(totalTime);
        if(totalTime < firstTotalTime1) then begin
            firstTotalTime2:= firstTotalTime1;
            firstTotalTimeName2:= firstTotalTimeName1;
            firstTotalTime1:= totalTime;
            firstTotalTimeName1:= pilotName;
        end
        else if (totalTime < firstTotalTime2) then begin
            firstTotalTime2:= totalTime;
            firstTotalTimeName2:= pilotName;
        end;
        
        if(totalTime > lastTotalTime1) then begin
            lastTotalTime2:= lastTotalTime1;
            lastTotalTimeName2:= lastTotalTimeName1;
            lastTotalTime1:= totalTime;
            lastTotalTimeName1:= pilotName;
        end
        else if(totalTime>lastTotalTime2) then begin
            lastTotalTime2:= totalTime;
            lastTotalTimeName2:= pilotName;
        end;
    end;
    writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ', firstTotalTimeName1, ', ', firstTotalTimeName2);
    writeln('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos son: ', lastTotalTimeName2, ', ', lastTotalTimeName1);
end.
