program Ejercico2;
var
    num, i, res: integer;
begin
    res := -32768;
    for i:= 1 to 10 do begin
        readln(numBefore);
        if(num > res)then begin
            res:= num;
        end;
    end;
    writeln('El mayor número leído fue el: ', res);
end.


{program Ejercico2a;
var
    numBefore, res, pos, otherRes: integer;
begin
    res:= -32767;
    for i:= 1 to 10 do begin
        readln(numBefore);
        if(numBefore > res)then begin
            res:= numBefore;
            otherRes:= i;
        end;
    end;
    writeln('El mayor número leído fue el: ', res, ', en la posición ', otherRes);
end.}
