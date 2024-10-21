program exercise4;
const
    dimF= 100;
type
    vec = array[1..dimF] of integer;

function posicion(v: vec; x: integer): integer;
var
    dimL, values: integer;
    bool: boolean;
begin
    dimL:= 1;
    bool:= false;
    while((dimL < dimF) and (bool = false)) do begin // mientras la dimensión lógica no supere a la dimensión física y no se encuentre el elemento
        values:= v[dimL]; // values toma el valor del vector en la posición que este en ese momento dimL
        if(x = values)then begin // si el valor buscado y el que tiene en ese momento el vector coinciden
            bool:= true; // se encontró el elemento
        end
        else begin
            dimL:= dimL + 1; // pasa a la siguiente posición
        end;
    end;
    if(bool)then begin //una vez sale del while, la función devuelve el lugar donde se encontró el elemento
        posicion:= dimL;
    end
    else
        posicion:= -1; //sino, devuelve -1
end;

procedure intercambio(x: integer; y: integer; var v: vec);
var
    exchange, i : integer;
begin
    exchange:= v[y]; //se utiliza una variable auxilar para no perder el valor de una de las variables y realizar el cambio
    v[y]:= v[x]; //se intercambia el elemento y con el x
    v[x]:= v[exchange]; //se intercambia el elemento x con el anterior valor de y
end;

function sumaVector(v: vec): integer;
var
    sum, i: integer;
begin
    sum:= 0;
    for i:= 1 to dimF do begin //recorre todo el vector
        sum:= sum + v[i]; //suma el valor de todos los elementos
    end;
    sumaVector:= sum; //la función devuelve la suma
end;

function promedio(v:vec): real;
var
    sum: integer;
begin
    for i:= 1 to dimF do begin //recorre todo el vector
        sum:= sum + v[i]; //suma el valor de todos los elementos
    end;
    promedio:= sum/dimF; //divide la suma por la cantidad de elementos del vector para obtener el promedio
end;

function elementoMaximo(v:vec): integer;
var
    i, max, values, pos: integer;
begin
    max:= -2;
    for i:= 1 to dimF do begin //recorre todo el vector
        values:= v[i];
        if(max < values)then begin //si el máximo actual es menor al elemento actual
            max:= values; //se actualiza el máximo
            pos:= i; //se actualiza la posición, con la posición del nuevo máximo
        end;
    end;
    elementoMaximo:= pos; //devuelve la posición donde se encuentra el elemento máximo
end;

function elementoMinimo(v:vec): integer;
var
    i, min, values, pos: integer;
begin
    min:= 9999;
    for i:= 1 to dimF do begin //recorre todo el vector
        values:= v[i];
        if(min > values)then begin //si el mínimo actual es mayor al elemento actual
            min:= values; //se actualiza el mínimo
            pos:= i; //se actualiza la posición, con la posición del nuevo mínimo
        end;
    end;
    elementoMinimo:= pos; //devuelve la posición donde se encuentra el elemento mínimo
end;
