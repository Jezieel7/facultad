program Ejercicio6;
type
    micropro=record
    brand: string;
    line: string;
    cantCore: integer;
    clockSpeed: real;
    tranSize: integer;
    end;
    
procedure readProcessor(var p: micropro);
begin
    with p do begin
        writeln('Ingrese cantidad de núcleos del procesador');
        readln(cantCore);
        if(cantcore > 0) then begin
            writeln('Ingrese marca del procesador');
            readln(brand);
            writeln('Ingrese línea del procesador');
            readln(line);
            writeln('Ingrese velocidad de reloj (en Ghz) del procesador');
            readln(clockSpeed);
            writeln('Ingrese tamaño de los transistores (en nm) del procesador');
            readln(tranSize);
        end;
    end;
end;

function averageSupProcessor(var cantCore: integer; var transistorSize: integer): boolean;
begin
    averageSupProcessor:= (cantCore > 2) and (transistorSize >= 22);
end;

function averageProcessor(var cantCore: integer; var clockSpeed: real ): boolean;
begin
    averageProcessor:= (cantCore > 1) and (clockSpeed >= 2.00);
end;

function highTrans(var transistorSize: integer): boolean;
begin
    highTrans:= transistorSize = 14;
end;

var
    processor: micropro;
    currentBrand: string;
    cantMulti: integer;
    numTrans: integer;
    highNumTrans1: integer;
    highNumTrans2: integer;
    highNumTransBrand1: string;
    highNumTransBrand2: string;
begin
    cantMulti:= 0;
    numTrans:= 0;
    highNumTrans1:= 0;
    highNumTrans2:= 0;
    highNumTransBrand1:= '';
    highNumTransBrand2:= '';
    readProcessor(processor);
    while(processor.cantCore > 0) do begin //mientras la cantidad de cores del procesador sean mayores a 0
        currentBrand:= processor.brand;
        while(processor.cantCore > 0) and (currentBrand = processor.brand) do begin
        {mientras la cantidad de cores del procesador sean mayores a 0,
        y la marca siga siendo la misma}
            if((processor.brand = 'Intel') or (processor.brand = 'AMD')) then begin //tanto si es intel como amd
                if(averageProcessor(processor.cantCore, processor.clockSpeed))then begin //si el módulo da true
                    cantMulti:= cantMulti + 1; //aumenta en 1 el valor de la variable
                end;
            end;
            if(highTrans(processor.tranSize))then begin //si el módulo da true
                numTrans:= numTrans + 1; //aumenta en 1 el valor de la variable
            end;
            if(averageSupProcessor(processor.cantCore, processor.tranSize)) then begin //si el módulo da true imprime
                writeln('El procesador ingresado tiene más de 2 cores con transistores de a lo sumo 22');
                writeln('marca: ', processor.brand, ', línea: ', processor.line);
            end;
            readProcessor(processor); //lee nuevamente otro procesador
        end;
        {Una vez que salió del segundo while, actualizo las dos marcas con mayor cantidad de procesadores con transistores de 14nm}
        if(numTrans > highNumTrans1)then begin
            highNumTrans2:= highNumTrans1;
            highNumTransBrand2:= highNumTransBrand1;
            highNumTrans1:= numTrans;
            highNumTransBrand1:= currentBrand;
        end
        else if(numTrans > highNumTrans2)then begin
            highNumTrans2:= numTrans;
            highNumTransBrand2:= currentBrand;
        end;
    end;
    writeln('La cantidad de procesadores multicore de Intel o AMD, cuyos relojes alcanzan velocidades de al menos 2 Ghz es de: ', cantMulti);
    writeln('las dos marcas con mayor cantidad de procesadores con transistores de 14 nm son: ', highNumTransBrand1, ', y ', highNumTransBrand2);
end.
