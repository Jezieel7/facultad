program Ejercicio4;
type
    client= record
        code: integer;
        cantLine: integer;
    end;
    
    line= record
        nroPhone: integer;
        cantMinute: integer;
        cantMb: integer;
    end;
    
procedure readLine(var l: line);
begin
    With l do begin
        writeln('Introduzca número de teléfono de la línea');
        readln(nroPhone);
        writeln('Introduzca cantidad de minutos de la linea');
        readln(cantMinute);
        writeln('Introduzca cantidad de MB consumidor por la línea en el mes');
        readln(cantMb);
    end;
end;

procedure readClient(var c: client; var totalMin: integer; var totalMB: integer; var clientPay: real);
var
    i: integer;
    clientLine: line;
begin
    With c do begin
        writeln('Introduzca código del cliente');
        readln(code);
        writeln('Introduzca línea/líneas del cliente');
        readln(cantLine);
    end;
    for i:= 1 to c.cantLine do begin
        readLine(clientLine);
        totalMin:= totalMin + clientLine.cantMinute;
        totalMB:= totalMB + clientLine.cantMb;
    end;
    clientPay:= (totalMin * 3.40) + (totalMB * 1.35);
end;

var
    cli: client;
    i, totalMin, totalMB: integer;
    clientPay: real;
begin
    clientPay:= 0;
    for i:= 1 to 9300 do begin
        readClient(cli, totalMin, totalMB, clientPay);
        writeln('El cliente debe pagar: ', clientPay:2:2);
        clientPay:= 0;
        totalMin:= 0;
        totalMB:= 0;
    end;
end.
