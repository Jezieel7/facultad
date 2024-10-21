program Ejercicio9;
procedure readProduct(var code: integer; var price: real; var clothes: string);
begin
    writeln('Introduzca código de producto');
    readln(code);
    writeln('Introduzca precio del producto');
    readln(price);
    writeln('Introduzca tipo de producto');
    readln(clothes);
end;

procedure cheapProduct(price: real; var cheapProductPrice: real; code: integer; var cheapProductCode: integer);
begin
    if (price < cheapProductPrice) then begin
        cheapProductPrice:= price;
        cheapProductCode:= code;
    end;
end;

procedure veryExpensiveTrousers(price: real; var expensiveTrousers: real; code: integer; var expensiveTrousersCode: integer);
begin
    if (price > expensiveTrousers) then begin
        expensiveTrousers:= price;
        expensiveTrousersCode:= code;
    end;
end;

var
    i, code, cheapProductCode, expensiveTrousersCode: integer;
    price, cheapProductPrice, expensiveTrousers: real;
    clothes: string;
begin
    cheapProductPrice:= 999999;
    expensiveTrousers:= -999999;
    for i:= 1 to 100 do begin
        readProduct(code, price, clothes);
        cheapProduct(price, cheapProductPrice, code, cheapProductCode);
        if(clothes = 'pantalón') then begin
            veryExpensiveTrousers(price, expensiveTrousers, code, expensiveTrousersCode);
        end;
    end;
    writeln('El código del producto más barato es: ', cheapProductCode);
    if(expensiveTrousers <> -999999)then begin
        writeln('El código del producto de tipo “pantalón” más caro es: ', expensiveTrousersCode);
    end;
end.
