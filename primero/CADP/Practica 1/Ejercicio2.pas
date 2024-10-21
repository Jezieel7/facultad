program Ejercicio2;
var
    num1, aPositivo, aux: real;
begin
    aPositivo:= 0;
    readln(num1);
    aux:= num1;
    if(num1>=0)then begin
        writeln('│', num1:2:2 ,'│')
    end
    else begin 
        while(aux<0) do begin
            aux:=aux+1; 
            aPositivo:= aPositivo + 1; 
        end;
        writeln('│', aPositivo:2:2 ,'│');
    end;
end.
