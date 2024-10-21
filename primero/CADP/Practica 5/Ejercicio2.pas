program Vectores;
const
    cant_datos = 150;
    
type
    vdatos = array[1..cant_datos] of real;
    
procedure cargarVector(var v:vdatos; var dimL : integer);
var
    numReal: real;
begin
    readln(numReal);
    while((dimL < cant_datos) and (numReal <> 0))do begin
        v[dimL]:= numReal;
        dimL:= dimL + 1;
        readln(numReal);
    end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i: integer;
begin
    for i:= 1 to dimL do begin
        v[i]:= v[i] + n;
        suma:= suma + v[i];
    end;
end;

var
    datos : vdatos;
    i, dim : integer;
    num, sumaTotal : real;
begin
    dim := 1;
    sumaTotal := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, sumaTotal);
    writeln('La suma de los valores es: ', sumaTotal:2:2);
    writeln('Se procesaron: ',dim, ' números')
end.
