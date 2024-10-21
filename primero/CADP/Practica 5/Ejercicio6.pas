program exercise6;
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

procedure elementoMinimoMaximo(v: vec; dimL: integer; var min: integer; var posMin: integer;var max: integer; var posMax: integer);
var
    i, values, posMinAux, posMaxAux: integer;
begin
    for i:= 1 to dimL do begin //recorre todo el vector
        values:= v[i];
        if(min > values)then begin //implementa el algoritmo de mínimo visto en ejercicios anteriores
            min:= values;
            posMinAux:= i;
        end;
        if(max < values)then begin //implementa el algoritmo de máximo visto en ejercicios anteriores
            max:= values;
            posMaxAux:= i;
        end;
    end;
    posMin:= posMinAux; //la variable posMin va a tener la posición donde se encuentra el elemento mínimo
    posMax:= posMaxAux; //la variable posMax va a tener la posición donde se encuentra el elemento máximo
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
    elementoMinimoMaximo(vector, dimL, min, posMin, max, posMax);
    intercambio(max, min, vector);
    writeln('El elemento máximo ', max, ' que se encontraba en la posición ',posMax,' fue intercambiado con el elemento mínimo ', min, ' que se encontraba en la posición ', posMin);
end.
