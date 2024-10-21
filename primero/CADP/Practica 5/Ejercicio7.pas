program exercise7;
const
    maxNum= 300;
type
    rangeDigit= 0..9;
    vec= array[1..maxNum] of integer;
    vdigit= array[rangeDigit] of integer;

procedure initialize(var v: vdigit);
var
    i: integer;
begin
    for i:= 0 to 9 do begin
        v[i]:= 0;
    end;
end;

procedure loadVector(var v: vec; var dimL: integer);
var
    num: integer;
begin
    num:= 0;
    writeln('Introduzca un número');
    readln(num);
    while((dimL < maxNum) and (num <> -1)) do begin
        dimL:= dimL + 1;
        v[dimL]:= num;
        writeln('Introduzca un número');
        readln(num);
    end;
end;

procedure repetitive(v: vec; dimL: integer; var digit: vdigit);
var
    i, values: integer;
    resto: rangeDigit;
begin
    values:= 0;
    for i:= 1 to dimL do begin
        values:= v[i];
        while values <> 0 do begin
            resto:= values mod 10;
            digit[resto]:= digit[resto] + 1;
            values:= values div 10;
        end;
    end;
end;

procedure reportRepetitive(v: vdigit);
var
    i: integer;
begin
    for i:= 0 to 9 do begin
        writeln('Número ', i, ': ', v[i], ' veces');
    end;
end;

function moreRead(v:vdigit): integer;
var
    max, i, values, maxI: integer;
begin
    max:= -1;
    for i:= 0 to 9 do begin
        values:= v[i];
        if(max < values)then begin
            max:= values;
            maxI:= i;
        end;
    end;
    moreRead:= maxI;
end;

procedure withoutRep(v: vdigit);
var
    i, values: integer;
begin
    for i:= 0 to 9 do begin
        values:= v[i];
        if(values = 0)then begin
            writeln('El número ', i, ' no tuvo ocurrencias');
        end;
    end;
end;

var
    vector: vec;
    dimL: integer;
    digit: vdigit;
begin
    initialize(digit); //se llama al módulo que inicializa al vector contador
    dimL:= 0; //se inicializa la variable que va a tener la dimensión lógica
    loadVector(vector, dimL); //se llama al módulo que carga el vector
    repetitive(vector, dimL, digit); //se llama al módulo que cuenta la cantidad de ocurrencias de cada número
    reportRepetitive(digit); //se llama al módulo que muestra la cantidad de ocurrencias de cada dígito procesado
    writeln('El dígito más leído fue el: ', moreRead(digit)); 
    withoutRep(digit); //se muestra el número que no tuvo ocurrencias
end.
