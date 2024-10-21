program Ejercicio8;
type
    
    teacher= record
		DNI: integer;
		name: string;
		lastName: string;
		email: string;
    end;
    
    project= record
		code: integer;
		title: string;
		coorTeacher: teacher;
		numStundent: integer;
		schoolName: string;
		location: string;
    end;
    
    procedure readTeacher(var t: teacher);
    begin
        with t do begin
            writeln('Introduzca DNI del docente coordinador');
            readln(DNI);
            writeln('Introduzca nombre del docente coordinador');
            readln(name);
            writeln('Introduzca apellido del docente coordinador');
            readln(lastName);
            writeln('Introduzca email del docente coordinador');
            readln(email);
        end;
    end;
    
    procedure readProject(var p: project);
    begin
        with p do begin
            writeln('Introduzca código del proyecto');
            readln(code);
            if(code <> -1) then begin
                writeln('Introduzca localidad de la escuela que presenta el proyecto');
                readln(location);
                writeln('Introduzca título del proyecto');
                readln(title);
                writeln('A continuación, introduzca los datos del docente coordinador');
                readTeacher(coorTeacher);
                writeln('Introduzca la cantidad de alumnos del proyecto');
                readln(numStundent);
                writeln('Introduzca nombre del establecimiento educativo');
                readln(schoolName);
            end;
        end;
    end;
    
    procedure updateMax(highNumStu1: integer; highNumStuName1: string; var highNumStu2: integer; var highNumStuName2: string; var highNumStu3:integer; var highNumStuName3: string);
    begin
        if(highNumStu1 > highNumStu2) then begin
            highNumStu3:= highNumStu2;
            highNumStuName3:= highNumStuName2;
            highNumStu2:= highNumStu1;
            highNumStuName2:= highNumStuName1;
        end
        else if(highNumStu1 > highNumStu3) then begin
            highNumStu3:= highNumStu1;
            highNumStuName3:= highNumStuName1;
        end;
    end;
    
    function even(code: integer): boolean;
    begin
        even:= ((code / 2) = 0);
    end;
var
    pro: project;
    numSchool, numSchoPerLoc, highNumStu1, highNumStu2, highNumStu3: integer;
    currentLocation, currentScho, highNumStuName2, highNumStuName3: string;
begin
    numSchool:= 0; numSchoPerLoc:= 0; highNumStu1:= 0; highNumStu2:= 0;
    readProject(pro);
    while(pro.code <> -1) do begin
        currentLocation:= pro.location;
        numSchoPerLoc:= 0;
        while((pro.code <> -1) and (pro.location = currentLocation)) do begin
            numSchoPerLoc:= numSchoPerLoc + 1;
            numSchool:= numSchool + 1;
            currentScho:= pro.schoolName;
            while((pro.code <> -1) and (pro.location = currentLocation) and (pro.schoolName = currentScho))do begin
                highNumStu1:= highNumStu1 + pro.numStundent;
                if((pro.location = 'Daireaux') and (even(pro.code))) then begin
                    writeln('Titulo del proyecto de la localidad Daireaux: ', pro.title);
                end;
                readProject(pro);
            end;
            updateMax(highNumStu1, pro.schoolName, highNumStu2, highNumStuName2, highNumStu3, highNumStuName3);
        end;
        writeln('La cantidad de escuelas de la localidad de ', currentLocation, ', es de ', numSchoPerLoc);
    end;
    writeln('La cantidad total de escuelas que participaron es de: ', numSchool);
    writeln('Las escuelas con la mayor cantidad de alumnos participantes son, ', highNumStuName2, 'y ', highNumStuName3);
end.
