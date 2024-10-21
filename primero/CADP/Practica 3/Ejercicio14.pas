program Ejercicio14;
    procedure cheapest(price: real; code: integer; var cheapPrice1: real; var cheapPriceCode1: integer; var cheapPrice2: real; var cheapPriceCode2: integer);
    begin
        if(price<cheapPrice1)then begin
            cheapPrice1:= cheapPrice2;
            cheapPriceCode1:= cheapPriceCode2;
            cheapPrice2:= price;
            cheapPriceCode2:= code;
        end;
    end;
    procedure readCodePrice(var code: integer; var price: real);
    begin
        writeln('Introduzca un código y un precio de producto');
        readln(code, price);
    end;
    function pairOdd(code: integer): boolean;
    begin
        pairOdd:= ((code mod 2) = 0);
    end;
    function higherPrice(price: real): boolean;
    begin
        higherPrice:= (price > 16);
    end;
var
    code, cant, i, cheapPriceCode1, cheapPriceCode2: integer;
    price, cheapPrice1, cheapPrice2: real;
begin
    code:= 0;
    cant:= 0;
    cheapPriceCode1:= 0;
    cheapPriceCode2:= 0;
    cheapPrice1:= 32768;
    cheapPrice2:= 32768;
    for i:= 1 to 5 do begin
        readCodePrice(code, price);
        cheapest(price, code, cheapPrice1, cheapPriceCode1, cheapPrice2, cheapPriceCode2);
        if(higherPrice(price))then begin
            if(pairOdd(code))then begin
                cant:= cant +1; 
            end;
        end;
    end;
    writeln('Los códigos de los dos productos más baratos son: ', cheapPriceCode1,', ', cheapPriceCode2);
    writeln('La cantidad de productos de más de 16 pesos con código par es de: ', cant);
end.

