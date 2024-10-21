program Ejercicio1;
var
    num, i, res: integer;
begin
	for i:= 1 to 10 do begin
		readln(num);
		res:= res + num;
	end;
	writeln(res);
end.

{program Ejercico1a;
var
    num, i, res, otherRes: integer;
begin
    for i:= 1 to 10 do begin
        readln(num);
        res:= res + num;
        if(num > 5)then begin
            otherRes:=otherRes + 1;
        end;
    end;
    writeln(res);
    writeln(otherRes);
end.}
