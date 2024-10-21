program Ejercicio8;
const
	mes = 31;
var
    i, dayAmount: integer;
    amount, monthAmount, dayAmount: real;
begin
    monthAmount:= 0;
    dayAmount:= 0;
    for i:=1 to mes do begin
        writeln('Ingrese un monto');
        readln(amount);
        while(amount <> 0)do begin
            dayAmount:= dayAmount + 1;
            monthAmount:= monthAmount + amount;
            readln(amount);
        end;
        writeln('La cantidad de ventas durante el día ', i, ' fue de: ', dayAmount);
        dayAmount:= 0;
    end;
    writeln('El monto total acumulado en ventas de todo el mes fue de: ', monthAmount:2:2);
end.

program Ejercicio8a;
const
	mes = 31;
var
    i, daySales, bestDay: integer;
    amount, monthAmount: real;
begin
    monthAmount:= 0;
    bestDay:= 0;
    for i:=1 to mes do begin
        writeln('Ingrese un número cualquiera, distinto de cero(0), este, no será contabilizado como monto.');
        writeln('Para finalizar el contador marque cero(0)');
        readln(amount);
        while(amount<>0)do begin
            writeln('Ingrese un monto');
            readln(amount);
            daySales:= daySales + 1;
            monthAmount:= monthAmount + amount;
        end;
        if(daySales>0)then begin
            writeln('La cantidad de ventas durante el día ', i, ' fue de: ', (daySales - 1));
            end
        else begin
            writeln('La cantidad de ventas durante el día ', i, ' fue de: ', (daySales));
        end;
        if(daySales>bestDay)then begin
            bestDay:= i;
        end;
        daySales:= 0;
    end;
    writeln('El monto total acumulado en ventas de todo el mes fue de: ', monthAmount:2:2);
    writeln('El día en el que se realizó la mayor cantidad de ventas fue el día: ', bestDay);
end.
