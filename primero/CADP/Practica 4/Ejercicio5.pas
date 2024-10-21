program Ejercicio5;
type
    candidate= record
        location: string;
        lastName: string;
        cantVote: integer;
        voter: integer;
    end;
    
procedure readCand(var c: candidate);
begin
    with c do begin
        writeln('Introduzca localidad del intendente');
        readln(location);
        writeln('Introduzca apellido del intendente');
        readln(lastName);
        writeln('Introduzca cantidad de votos del intendente');
        readln(cantVote);
        writeln('Introduzca cantidad de votantes de la localidad');
        readln(voter);
    end;
end;

procedure maxVote(candidateVote: integer;candidatelastName: string; var maxCantVote: integer; var lastNameCand: string);
begin
    if(candidateVote > maxCantVote)then begin
        maxCantVote:= candidateVote;
        lastNameCand:= candidatelastName;
    end;
end;

procedure maxPercentage(candidateVote: integer;candidatelastName: string; candidateVoter: integer; var maxPer: real; var lastNameCandPer: string);
begin
    if(((candidateVote*100)/candidateVoter) > maxPer)then begin
        maxPer:= (candidateVote*100)/candidateVoter;
        lastNameCandPer:= candidatelastName;
    end;
end;

var
    cand: candidate;
    maxCantVote: integer;
    maxPer: real;
    lastNameCand: string;
    lastNameCandPer: string;
begin
    maxCantVote:= 0;
    maxPer:= 0;
    lastNameCand:= '';
    lastNameCandPer:= '';
    repeat
        readCand(cand);
        maxVote(cand.cantVote, cand.lastName, maxCantVote, lastNameCand);
        maxPercentage(cand.cantVote,cand.lastName, cand.voter, maxPer, lastNameCandPer)
    until (cand.location = 'Zárate');
    writeln('El intendente que recibió mas votos fue: ', lastNameCand);
    writeln('El intendente con mayor porcentaje de votos fue: ', lastNameCandPer);
end.
