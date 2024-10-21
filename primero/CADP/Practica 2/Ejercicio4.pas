program Ejercicio4;
const
	numeros = 1000;
var
    num, numMin1, numMin2, i: integer;
begin
    numMin1:= 32767;
    numMin2:= 32767;
    for i:=1 to numeros do begin
        writeln('Ingrese un número');
        readln(num);
        if(num < numMin1)then begin
            numMin2:= numMin1;
            numMin1:= num;
        end
        {se utiliza un else if porque no deberían suceder las dos condiciones a la vez
        El número o es menor a numMin1 o es menor a numMin2.
        No usar el ELSE IF traería problemas}
        else if(num < numMin2)then begin
            numMin2:= num;
        end;
    end;
    writeln('Los dos números mínimos leídos son: ', numMin1, ' ', numMin2);
end.

program Ejercicio4a;
var
    num, numMin1, numMin2, i: integer;
begin
    numMin1:= 32767;
    numMin2:= 32767;
    repeat
        writeln('Ingrese un número');
        readln(num);
        if(num < numMin1)then begin
            numMin2:= numMin1;
            numMin1:= num;
        end
        else if(num < numMin2)then begin
            numMin2:= num;
        end;
    until(num = 0);
    writeln('Los dos números mínimos leídos son: ', numMin1, ' ', numMin2);
end.

program Ejercicio4b;
var
    num, numMin1, numMin2, i: integer;
begin
    numMin1:= 32767;
    numMin2:= 32767;
    num:= 32767; 
    while(num <> 0) do begin
        writeln('Ingrese un número');
        readln(num);
        if(num < numMin1)then begin
            numMin2:= numMin1;
            numMin1:= num;
        end
        else if(num < numMin2)then begin
            numMin2:= num;
        end;
    end;
    writeln('Los dos números mínimos leídos son: ', numMin1, ' ', numMin2);
end.
