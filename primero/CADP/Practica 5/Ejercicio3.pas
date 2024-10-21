program exercise3;

const
    dimF= 150;
type
    vec = array[1..dimF] of integer;
    
procedure printFirstToLast(v: vec; dimL: integer); //imprime el vector desde su primer hasta su último elemento
var
    i, values: integer;
begin
    for i:= 1 to dimL do begin
        values:= v[i];
        writeln(values);
    end;
end;

procedure printLastToFirst(v: vec; dimL: integer); //imprime el vector desde su último hasta su primer elemento
var
    i, values: integer;
begin
    for i:= dimL downto 1 do begin
        values:= v[i];
        writeln(values);
    end;
end;

procedure printMiddle(v: vec; dimL: integer);
{imprime el vector desde la mitad (dimL DIV 2) hacia la primeraposición,
y desde la mitad más uno hacia la última posición.}
var
    toFirst, i, values: integer;
begin
    toFirst:= dimL DIV 2;
    for i:= toFirst downto 1 do begin
        values:= v[i];
        writeln(values);
    end;
    for i:= (toFirst+1) to dimL do begin
        values:= v[i];
        writeln(values);
    end;
end;

procedure printFromWhereverYouWant(v: vec; posX: integer; posY: integer); //imprime el vector desde una posición x a la posicion y, y viceversa
var
    i, values: integer;
begin
    if(posX < posY)then begin
        for i:= posX to posY do begin
            values:= v[i];
            writeln(values);
        end;
    end
    else begin
        for i:= posX downto posY do begin
            values:= v[i];
            writeln(values);
        end;
    end;
end;

{e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a,
b y c.}
procedure printFirstToLast2(v: vec; dimL: integer);
var
    x: integer;
begin
    x:= 1;
    printFromWhereverYouWant(v, x, dimL);
end;

procedure printLastToFirst2(v: vec; dimL: integer);
var
    y: integer;
begin
    y:= 1;
    printFromWhereverYouWant(v, dimL, y);
end;

procedure printMiddle2(v: vec; dimL: integer);
var
    toFirst, x: integer;
begin
    x:= 1;
    toFirst:= dimL DIV 2;
    printFromWhereverYouWant(v, toFirst, x);
    toFirst:= toFirst + 1;
    printFromWhereverYouWant(v, toFirst, dimL);
end;
