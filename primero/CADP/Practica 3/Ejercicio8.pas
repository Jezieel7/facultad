program Ejercicio8a;
function largest(numA: integer; numB: integer): boolean;
begin
    largest:= ((numB) = (numA*2));
end;

program Ejercicio8b;
function largest(numA: integer; numB: integer): boolean;
begin
    largest:= ((numB) = (numA*2));
end;
var
    numA, numB, cant, cantDoubleEven: integer;
begin
    cant:= 0; cantDoubleEven:= 0;
    repeat
        readln(numA);
        readln(numB);
        cant:= cant + 1;
        if(largest(numA, numB))then
            cantDoubleEven:= cantDoubleEven + 1;
    until((numA = 0) and (numB = 0));
    writeln('la cantidad de pares leídos fue de: ', cant,', la cantidad de pares en las que numB es el doble de numA: ', cantDoubleEven);
end.
