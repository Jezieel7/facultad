program Ejercicio17;

procedure perEcoPlant(ha: integer; typeZone: integer; price: real; var perEco: real);
begin
    if(typeZone = 1)then begin
        perEco:= ha * 6 * price;
    end
    else if(typeZone = 2)then begin
        perEco:= ha * 2.6 * price;
    end
    else if(typeZone = 3)then begin
        perEco:= ha * 1.4 * price;
    end;
end;

procedure goodPerEco(location: string; perEco: real; var sumTreFeb: integer);
begin
    if((location = 'Tres de Febrero') and (perEco > 10000))then begin
        sumTreFeb:= sumTreFeb + 1;
    end;
end;

procedure bestPer(location: string; var bestLocation: string; perEco: real; var bestEco: real);
begin
    if(perEco > bestEco)then begin
        bestEco:= perEco;
        bestLocation:= location;
    end;
end;

procedure worstPer(location: string; var worstLocation: string; perEco: real; var worstEco: real);
begin
    if(perEco < worstEco)then begin
        worstEco:= perEco;
        worstLocation:= location;
    end;
end;

const
    price= 320;
var
    location, bestLocation, worstLocation: string;
    ha, typeZone, sumTreFeb: integer;
    perEco, bestEco, worstEco: real;
begin
    ha:= 0;
    typeZone:= 0;
    perEco:= 0;
    sumTreFeb:= 0;
    bestLocation:= '';
    bestEco:= -1;
    worstLocation:= '';
    worstEco:= 90000;
    repeat
        writeln('Introduzca localidad de la plantación');
        readln(location);
        writeln('Introduzca cantidad de hectáreas de la plantación');
        readln(ha);
        writeln('Introduzca tipo de zona de la plantación');
        readln(typeZone);
        perEcoPlant(ha, typeZone, price, perEco);
        writeln('El rendimiento económico de la plantación es: ', perEco:2:2);
        goodPerEco(location, perEco, sumTreFeb);
        bestPer(location,bestLocation,perEco,bestEco);
        worstPer(location,worstLocation,perEco,worstEco);
    until((location = 'Saladillo') and (ha = 900));
    writeln('La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000 es de: ', sumTreFeb);
    writeln('La localidad del campo con mayor rendimiento económico esperado es: ', bestLocation);
    writeln('La localidad del campo con menor rendimiento económico esperado es: ', worstLocation);
end.
