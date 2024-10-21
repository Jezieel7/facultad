program exercise8;
const
    maxEmp= 300;
type
    wages= array[1..maxEmp] of real;
    
procedure loadVector(var v: wages; var dimL: integer);
var
    salary: real;
begin
    salary:= 0;
    writeln('Introduzca un salario');
    readln(salary);
    while((dimL < maxEmp) and (salary <> 0)) do begin
        dimL:= dimL + 1;
        v[dimL]:= salary;
        writeln('Introduzca un salario');
        readln(salary);
    end;
end;

procedure increaseSalary(x: real; var v: wages; dimL: integer);
var
    i: integer;
begin
    for i:= 1 to dimL do begin
        v[i]:= v[i] + (v[i] * (x/100));
    end;
end;

function prom(v:wages; dimL: integer ): real;
var
    sum: real;
    i: integer;
begin
    sum:= 0;
    for i:= 1 to dimL do begin
        sum:= sum + v[i];
    end;
    prom:= sum/dimL;
end;


var
    wage: wages;
    dimL: integer;
    increase: real;
begin
    dimL:= 0;
    increase:= 0;
    loadVector(wage, dimL);
    writeln('Introduzca el incremento de los salarios');
    readln(increase);
    increaseSalary(increase, wage, dimL);
    writeln('El promedio de salarios es de ', prom(wage, dimL):2:2);
end.
