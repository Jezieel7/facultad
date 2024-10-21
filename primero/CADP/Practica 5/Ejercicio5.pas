program exercise5;
const
    dimF= 100;
type
    vec = array[1..dimF] of integer;

procedure intercambio(x: integer; y: integer; var v: vec);
var
    exchange: integer;
begin
    exchange:= y;
    y:= x;
    x:= exchange;
end;

procedure elementoMaximo(v: vec; dimL: integer; var max: integer; var pos: integer);
var
    i, values, posAux: integer;
begin
    for i:= 1 to dimL do begin
        values:= v[i];
        if(max < values)then begin
            max:= values;
            posAux:= i;
        end;
    end;
    pos:= posAux;
end;

procedure elementoMinimo(v: vec; dimL: integer; var min: integer; var pos: integer);
var
    i, values, posAux: integer;
begin
    for i:= 1 to dimL do begin
        values:= v[i];
        if(min > values)then begin
            min:= values;
            posAux:= i;
        end;
    end;
    pos:= posAux;
end;

var
    vector: vec;
    num, dimL, max, min, posMax, posMin: integer;
begin
    dimL:= 0;
    min:= 9999;
    max:= -2;
    posMax:= 0;
    posMin:= 0;
    readln(num);
    while((dimL < dimF) and (num <> 0))do begin
        dimL:= dimL + 1;
        vector[dimL]:= num;
        readln(num);
    end;
    elementoMinimo(vector, dimL, min, posMin);
    elementoMaximo(vector, dimL, max, posMax);
    intercambio(max, min, vector);
    writeln('El elemento máximo ', max, ' que se encontraba en la posición ',posMax,' fue intercambiado con el elemento mínimo ', min, ' que se encontraba en la posición ', posMin);
end.
