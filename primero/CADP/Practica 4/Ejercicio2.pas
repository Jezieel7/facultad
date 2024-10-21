program ejercicio2;
type
    date= record
        year: integer;
        month: integer;
        day: integer;
    end;
    
procedure readMarr(var marr: date);
begin
    With marr do begin
        writeln('Ingrese el año del casamiento');
        read(year);
        if (year <> 2018) then begin
            writeln('Ingrese el mes del casamiento');
            read(month);
            writeln('Ingrese el día del casamiento');
            read(day);
        end;
    end;
end;

function summer(var dateMonth: integer): boolean;
begin
    summer:= (dateMonth = 1) or (dateMonth = 2) or (dateMonth = 3);
end;

function firstDays(var dateDay: integer): boolean;
begin
    firstDays:= (dateDay < 11);
end;

var
    marriage : date;
    cantMonth, cantDays: integer;
begin
    cantMonth := 0;
    cantDays := 0;
    readMarr(marriage);
    while(marriage.year <> 2018) do begin
        if(summer(marriage.month)) then begin
            cantMonth := cantMonth + 1;
        end;
        if(firstDays(marriage.day)) then begin
            cantDays := cantDays + 1;
        end;
        readMarr(marriage);
    end;
    writeln('la cantidad de casamientos realizados durante los meses de verano fue de: ', cantMonth, ' casamientos.');
    writeln('la cantidad de casamientos realizados durante los primeros días de cada mes fue de: ', cantDays, ' casamientos.');
end.
