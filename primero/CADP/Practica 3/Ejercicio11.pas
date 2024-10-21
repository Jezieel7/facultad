program Ejercicio11;
procedure pairOdd(num: integer; var sumPair: integer; var sumOdd: integer);
var
    aux: integer;
begin
    aux:= 0;
    while(num<>0) do begin //mientras el dígito no este descompuesto totalmente (sea distinto de 0)
        aux:= num mod 10; //la variable aux toma el valor de la PARTE FRACCIONARIA de la division por 10 del dígito a descomponer
        if((aux mod 2)=0)then begin {Evalúa si al hacerle una división por 2 a el número,
        este tiene resto o no, el hecho de no tener resto(parte fraccionaria), nos indica que estamos ante un número par}
            sumPair:= sumPair + 1
        end
        else begin //caso contrario, (el número tiene resto), indica que estamos ante un número impar
            sumOdd:= sumOdd + 1;
        end;
        num:= num div 10; //se realiza la división por 10 al número y nos quedamos con la parte entera, para no contemplar al número previamente operado, en la próxima vuelta
    end;
end;
var
    num, sumPair, sumOdd: integer;
begin
    sumPair:= 0;
    sumOdd:= 0;
    num:= 0;
    readln(num); //lectura del primer número, para poder entrar al while
    while(num <> 12345) do begin
        pairOdd(num, sumPair, sumOdd);
        writeln('El número fue el: ', num, ', la cantidad de dígitos pares que tenía: ', sumPair, ', y la cantidad de dígitos impares que tenía: ', sumOdd);
        sumPair:= 0;
        sumOdd:= 0;
        readln(num);
    end;
end.

Opción 11 B
Program sumaParImpar;
Function Par(Num, SumP: Integer): Integer;
Begin
  If (Num MOD 2 = 0) Then Par := SumP + Num Else Par := SumP;
End;
Function Impar(Num, SumI: Integer): Integer;
Begin
  If (Num MOD 2 = 1) Then Impar := SumI + Num Else Impar := SumI;
End;
Procedure Suma(Num: Integer; Var SumP, SumI: Integer);
Var
  Dig: Integer;
Begin
  While (Num <> 0) Do
    Begin
      Dig := Num MOD 10;
      SumP := Par(Dig, SumP);
      SumI := Impar(Dig, SumI);
      Num := Num DIV 10;
    End;
End;
Var Numero: LongInt; SumaPar, SumaImpar: Integer;
Begin
  Write('Escriba un numero: ');
  ReadLn(Numero);
  While (Numero <> 123456) Do
    Begin
      SumaPar := 0;
      SumaImpar := 0;
      Suma(Numero, SumaPar, SumaImpar);
      WriteLn('La suma de los digitos pares del numero ', Numero, ' es: ', SumaPar);
      WriteLn('La suma de los digitos impares del numero ', Numero, ' es: ', SumaImpar);
      Write('Escriba un numero: ');
      ReadLn(Numero);
    End;
End.
