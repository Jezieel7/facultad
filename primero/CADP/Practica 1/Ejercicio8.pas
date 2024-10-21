program Ejercicio8;
var
    char1, char2, char3: char;
    boolChar1, boolChar2,boolChar3: boolean;
begin
    readln(char1);
    readln(char2);
    readln(char3);
    case char1 of
        'a','e', 'i', 'o', 'u': boolChar1:= true;
    else
        boolChar1:= false;
    end;
        
    case char2 of
        'a','e', 'i', 'o', 'u': boolChar2:= true;
    else
        boolChar2:= false;
    end;
    
    case char3 of
        'a','e', 'i', 'o', 'u': boolChar3:= true;
    else
        boolChar1:= false;
    end;
    if((boolChar1 = true) and (boolChar2 = true) and (boolChar3 = true)) then
        writeln('Los tres eran letras vocales.')
    else
        writeln('Al menos uno de ellos no era vocal.');
end.
