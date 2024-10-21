program exercise9;
const 	
elements= 500;

type
    vecNames= array[1..elements] of string;

procedure loadVector(var v: vecNames; var dimL: integer);
var
    names: string;
begin
    names:= '';
    writeln('Introduzca un nombre');
    readln(names);
    while((names <> 'ZZZ') and (dimL < elements)) do begin
        dimL:= dimL + 1;
        v[dimL]:= names;
        writeln('Introduzca un nombre');
        readln(names);
    end;
end;

procedure deleteFirst(var v: vecNames; var dimL: integer; nam: string; var bool: boolean);
var
    pos, i: integer;
begin
    pos:= 1;
    while((pos <= dimL) and (not bool)) do begin // recorre el vector
        if(v[pos] = nam)then begin // si el elemento coincide con el buscado
            bool:= true;
            for i:= pos to (dimL-1) do begin // se elimina el elemento
                v[i]:= v[i+1];
            end;
            dimL:= dimL - 1; // se decrementa
        end
        else begin 
            pos:= pos + 1; //se pasa a la siguiente posición
        end;
    end;
    if(not bool) then begin //si el elemento no se encontró
        writeln('el nombre no está en el vector');
    end;
end;

procedure insertName(var v: vecNames; var DimL: integer; nam: string; var bool: boolean);
var
    i: integer;
begin
    if((dimL + 1) <= elements) then begin //si el insertar el elemento no supera la dimensión lógica, inserta el elemento en la posición 4
        for i:= dimL downto 4 do begin
            v[i+1]:= v[i]; 
            bool:= true;
        end;
        v[4]:= nam;
        dimL:= dimL + 1;
    end
    else begin
        bool:= false;
    end;
end;

procedure add(var v:vecNames; var dimL: integer; nam: string; var bool: boolean);
begin
    if((dimL+1) <= elements)then begin //si el agregar elemento no supera la dimensión lógica, agrega el elemento
        bool:= true;
        dimL:= dimL + 1;
        v[dimL]:= nam;
    end
    else begin
        bool:= false;
    end;
end;
{d. Lea un nombre y lo agregue al vector.}
var
    vNames: vecNames;
    nam: string;
    dimL: integer;
    bool: boolean;
begin
    dimL:= 0;
    bool:= false;
    loadVector(vNames, dimL); // inciso A
    readln(nam); //inciso B
    deleteFirst(vNames, dimL, nam, bool); //inciso B
    writeln(bool);
    writeln('Introduzca un nombre 1');
    readln(nam); //inciso C
    insertName(vNames, dimL, nam, bool); //inciso C
    writeln(bool);
    writeln('Introduzca un nombre 2');
    readln(nam); //inciso D
    add(vNames, dimL, nam, bool); //inciso D
    writeln(bool);
end.
