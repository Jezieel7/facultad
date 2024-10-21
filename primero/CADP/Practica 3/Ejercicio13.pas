program Ejercicio13;
    procedure circle(radio: real; var diameter: real; var perimeter: real);
    begin
        diameter:= radio * 2;
        perimeter:= 2 * 3.14 * radio;
    end;
var
    radio, diameter, perimeter, distance: real;
    name: string;
    cantPlanet: integer;
begin
    radio:= 1;
    diameter:= 0;
    perimeter:= 0;
    distance:= 0;
    cantPlanet:= 0;
    while(radio <> 0) do begin
        readln(name, distance, radio);
        circle(radio, diameter, perimeter);
            if((diameter <= 12.700) and (diameter >= 6.780)) then begin
                writeln('Nombre: ', name,', distancia: ', distance:2:2);
            end;
            if(perimeter > 439.264) then begin
                cantPlanet:= cantPlanet + 1;
            end;
    end;
    writeln('La cantidad de planetas con un perímetro superior al del planeta Júpiter es de: ', cantPlanet);
end.
