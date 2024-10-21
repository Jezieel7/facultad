program Ejercico6;
var
    code, i, cantProduct, cheapPriceCode1, cheapPriceCode2: integer;
    price, cheapPrice1, cheapPrice2 : real;
begin
    cheapPrice1:= 32768;
    cheapPrice2:= 32768;
    for i:= 1 to 200 do begin
        writeln('Ingrese un código de producto');
        readln(code);
        writeln('Ingrese el precio del producto');
        readln(price);
        if(price < cheapPrice1)then begin
            cheapPrice2:= cheapPrice1;
            cheapPriceCode2:= cheapPriceCode1;
            cheapPrice1:= price;
            cheapPriceCode1:= code;
        end;
        if((price > 16) and ((code mod 2) = 0))then begin
            cantProduct:= cantProduct + 1;
        end;
    end;
    writeln('Los códigos de los dos productos más baratos son: ', cheapPriceCode1,', ', cheapPriceCode2);
    writeln('La cantidad de productos de más de 16 pesos con código par es de: ', cantProduct);
end.
