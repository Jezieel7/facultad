program Ejercicio12;
function sum(numX: integer; numY: integer): integer;
var
    i, aux: integer;
begin
    aux:= 0;
    if(numX <> numY)then begin //si los números son distintos
        for i:= numX to numY do begin //se sumará desde el primer número hasta el último número
            aux:= aux + i; //la variable i tomará todos los valores que necesitamos
        end;
    end
    else begin //caso contrario, no hay que hacer recorridos, porque son el mismo número
        aux:= numX + numY; //simplemente se suman
    end;
    sum:= aux; //la función devuelve el valor almacenado en la variable que hacía las sumas
end;
function prod(numX: integer; numY: integer): integer;
var
    i, aux: integer;
begin
    aux:= 1;
    if(numX <> numY)then begin //si los números son distintos
        for i:= numX to numY do begin//se multiplicará desde el primer número hasta el último número
            aux:= aux * i; //la variable i tomará todos los valores que necesitamos
        end;
    end
    else begin //caso contrario, no hay que hacer recorridos, porque son el mismo número
        aux:= numX * numY; //simplemente se multiplican
    end;
    prod:= aux; //la función devuelve el valor almacenado en la variable que hacía las multiplicaciones
end;
{Realice un programa que lea 10 pares de números (X,Y) e informe, para cada par de números, la suma y el
producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:

“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)}
var
    i, numX, numY, sumXY, prodXY: integer;
begin
    sumXY:=0;
    prodXY:= 1;
    for i:= 0 to 9 do begin
        writeln('Introduzca dos números');
        readln(numX, numY); //lectura de los dos números
        sumXY:= sum(numX, numY); //la suma recibe el resultado de lo que devuelve la función sum
        prodXY:= prod(numX, numY);//el producto recibe el resultado de lo que devuelve la función prod
        writeln('La suma: ', sumXY, ', el producto: ', prodXY);
    end;
end.
