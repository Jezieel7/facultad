program excercise14;
const
    numPlaces= 100;
    numYears= 50;

type
    vPlaces= array[1..numPlaces] of real;
    vYears= array[1..numYears] of vPlaces;

procedure loadVector(var vecYears: vYears);
var
    i, j, temp: integer;
begin
    for i:= 1 to numYears do begin
        for j:= 1 to numPlaces do begin
            readln(temp);
            vecYears[i][j]:= temp; 
        end;
    end;
end;

function yearHighTemp(var vecYears: vYears): integer;
var
    i, j, highTempYear: integer;
    yearsTemp, promYear, highTemp: real;
begin
    yearsTemp:= -999; promYear:= -999; highTemp:= -999; highTempYear:= 0;
    for i:= 1 to numYears do begin //recorre por año
        for j:= 1 to numPlaces do begin //recorre por lugares
            yearsTemp:= yearsTemp + vecYears[i][j];
        end;
        promYear:= yearsTemp / numPlaces;
        if(promYear > highTemp)then begin
            highTemp:= promYear;
            highTempYear:= i;
        end;
    end;
    yearHighTemp:= highTempYear;
end;

function yearHighTempPlace(var vecYears: vYears): integer;
var
    i, j, highTempYearPlace: integer;
    highTempPlace, auxHighTempPlace: real;
begin
    highTempPlace:= -999; auxHighTempPlace:= -999; highTempYearPlace:= -999;
    for i:= 1 to numYears do begin // recorre por año
        for j:= 1 to numPlaces do begin //recorre por lugares
            highTempPlace:= vecYears[i][j];
            if(highTempPlace > auxHighTempPlace)then begin
                auxHighTempPlace:= highTempPlace;
                highTempYearPlace:= i;
            end;
        end;
    end;
    yearHighTempPlace:= highTempYearPlace;
end;

var
    vecYears: vYears;
begin
    loadVector(vecYears);
    writeln('El año con mayor temperatura promedio a nivel mundial fue: ', yearHighTemp(vecYears));
    writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años: ', yearHighTempPlace(vecYears));
end.
