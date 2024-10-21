program excercise7;
type
    alumn=record
        dni: integer;
        lastName: string;
        name: string;
        qualification: real;
    end;
    
    listAdmission= ^admission;
    
    admission=record
        element: alumn;
        next: ^admission;
    end;
    
    arrayTurn= array[1..5] of listAdmission;
    
procedure loadAlumn(var a: alumn);
begin
    with a do begin
        writeln('Introduzca el dni del alumno');
        readln(dni);
        if(dni <> 0)then begin
            writeln('Introduzca el apellido del alumno');
            readln(lastName);
            writeln('Introduzca el nombre del alumno');
            readln(name);
            writeln('Introduzca la calificación del alumno');
            readln(qualification);
        end;
    end;
end;

procedure loadList(var l: listAdmission; a: alumn);
var
    aux: listAdmission;
begin
    new(aux); aux^.element:= a; aux^.next:= l;
    l:= aux;
end;

procedure distribution(admissions: listAdmission; arrTurn: arrayTurn);
var
    bool1, bool2, bool3: boolean;
    aux: listAdmission;
begin
    bool1:= true; bool2:= true; bool3:= false;
    while(admissions <> nil)do begin
        if(admissions^.element.qualification >= 8)then begin
            if(bool1)then begin
                new(aux); aux^.element:= admissions^.element; aux^.next:= nil;
                arrTurn[1]:= aux;
                bool4:= false;
            end;
            if(not bool1)then begin
                new(aux); aux^.element:= admissions^.element; aux^.next:= nil;
                arrTurn[4]:= aux;
                bool1:= true;
            end;
        end;
        if((admissions^.element.qualification <= 8) and (admissions^.element.qualification >= 5))then begin
            if((bool2) and (not bool3))then begin
                new(aux); aux^.element:= admissions^.element; aux^.next:= nil;
                arrTurn[2]:= aux;
                bool2:= false;
                bool3:= false;
            end;
            if((not bool2) and (not bool3))then begin
                new(aux); aux^.element:= admissions^.element; aux^.next:= nil;
                arrTurn[3]:= aux;
                bool2:= true;
                bool3:= true;
            end;
            if((bool2) and (bool3))then begin
                new(aux); aux^.element:= admissions^.element; aux^.next:= nil;
                arrTurn[5]:= aux;
                bool2:= true;
                bool3:= false;
            end;
        end;
        admissions:= admissions^.next;
    end;
end;

procedure writeAlumn(a: alumn);
begin
    with a do begin
        writeln(a.dni);
        writeln(a.lastName);
        writeln(a.name);
        writeln(a.qualification);
    end;
end;

procedure printList(arrTurn: arrayTurn);

begin
    writeln('Todos los alumnos del turno 1:');
    while(arrTurn[1] <> nil) do begin
        writeAlumn(arrTurn[1]^.element);
        arrTurn[1]:= arrTurn[1]^.next;
    end;
    
    writeln('Todos los alumnos del turno 2:');
    while(arrTurn[2] <> nil) do begin
        writeAlumn(arrTurn[2]^.element);
        arrTurn[2]:= arrTurn[2]^.next;
    end;
    
    writeln('Todos los alumnos del turno 3:');
    while(arrTurn[3] <> nil) do begin
        writeAlumn(arrTurn[3]^.element);
        arrTurn[3]:= arrTurn[3]^.next;
    end;
    
    writeln('Todos los alumnos del turno 4:');
    while(arrTurn[4] <> nil) do begin
        writeAlumn(arrTurn[4]^.element);
        arrTurn[4]:= arrTurn[4]^.next;
    end;
    
    writeln('Todos los alumnos del turno 5:');
    while(arrTurn[5] <> nil) do begin
        writeAlumn(arrTurn[5]^.element);
        arrTurn[5]:= arrTurn[5]^.next;
    end;
end;

var
    a: alumn;
    admissions: listAdmission;
    arrTurn: arrayTurn;
begin
    admissions:= nil;
    loadAlumn(a);
    while(a.dni <> 0)do begin
        loadList(admissions, a);
        loadAlumn(a);
    end;
    distribution(admissions, arrTurn);
    printList(arrTurn);
end.
