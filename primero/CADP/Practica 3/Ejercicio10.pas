program Ejercicio10;
procedure numInteger(num: integer; var cantDigits: integer; var sumDigits: integer); //num es pasado por valor y no por referencia, ya que no nos interesa que el valor de la variable sea modificada fuera del módulo
var
    aux: integer;
begin
    aux:= 0;
    while(num<>0) do begin //Mientras el digito sea distinto de cero, es decir, no se haya terminado de descomponer
        aux:= num mod 10; //aux toma el valor de la PARTE FRACCIONARIA de la división por 10. (Para obtener el primer número del dígito)
        cantDigits:= cantDigits + 1; //La cantidad de dígitos se incrementa en 1
        sumDigits:= sumDigits + aux; //Se suma el número del dígito, a la variable sumDigits
        num:= num div 10; //El número a descomponer toma el valor de la PARTE ENTERA de la división por 10 de el mismo,(para obtener todos, menos el primer número del dígito, que es al que acabamos de realizarle las operaciones.)
    end;
end;
var
    num, cantDigits, sumDigits: integer;
begin
    repeat
        sumDigits:= 0; //Se actualizará la suma de los digitos en cada pasada
        readln(num); //Lectura del número a analizar
        numInteger(num, cantDigits, sumDigits); //Se llama al procedimiento que descompone el número
    until(sumDigits = 10); //Hasta qué la suma no sea exactamente igual a 10, no dejará de leer números
    writeln('La cantidad de dígitos fue de: ', cantDigits);
end.
