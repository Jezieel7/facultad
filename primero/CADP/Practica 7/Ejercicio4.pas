function maximo(l: lista): integer;
var
    auxMax: integer;
begin
    auxMax:= -9999;
    while(l <> nil)do begin
        if(l^.num > auxMax)then begin
            auxMax:= l^.num;
        end;
        l:= l^.sig;
    end;
    maximo:= auxMax;
end;

b)
function minimo(l: lista): integer;
var
    auxMin: integer;
begin
    auxMin:= 9999;
    while(l <> nil)do begin
        if(l^.num < auxMin)then begin
            auxMin:= l^.num;
        end;
        l:= l^.sig;
    end;
    minimo:= auxMin;
end;

c)
function multiplos(l: lista; v: integer): integer;
var
    cant: integer;
begin
    cant:= 0;
    while(l <> nil)do begin
        if((l^.num mod v) = 0)then begin
            cant:= cant + 1;
        end;
        l:= l^.sig;
    end;
    multiplos:= cant;
end;
