program excercise12;
const
    numCom= 10000;
type
    computer= record
    ubuntuVer: real;
    numPack: integer;
    numAcco: integer;
    end;
    
    vComputer= array[1..numCom] of computer;

procedure readCom(var c: computer);
begin
    with c do begin
        writeln('Introduzca la versión de Ubuntu');
        readln(ubuntuVer);
        if(ubuntuVer <> 4.10)then begin
            writeln('Introduzca la cantidad de paquetes instalados');
            readln(numPack);
            writeln('Introduzca la cantidad de cuentas que posee');
            readln(numAcco);
        end;
    end;
end;

procedure loadVector(var vecCom: vComputer; var dimL: integer);
var
    com: computer;
begin
    readCom(com);
    while ((dimL < numCom) and (vecCom[dimL].ubuntuVer <> 4.10))do begin
        dimL:= dimL + 1;
        vecCom[dimL]:= com;
        readCom(com);
    end;
end;

function numVersion(vecCom: vComputer; var numVer: integer; i: integer): integer;
begin
    if((vecCom[i].ubuntuVer = 18.04) or (vecCom[i].ubuntuVer = 16.04))then begin
        numVer:= numVer + 1;
    end;
    numVersion:= numVer;
end;

function maxPackVer(vecCom: vComputer; var maxPack: integer; var ver: real; i: integer): real;
begin
    if(maxPack < vecCom[i].numPack)then begin
        maxPack:= vecCom[i].numPack;
        ver:= vecCom[i].ubuntuVer;
    end;
    maxPackVer:= ver;
end;

procedure ProcessAll(vecCom: vComputer; dimL: integer; var numVersionFunction: integer; var promAccoFunction: real; var maxPackVerFunction: real);
var
    i, numVer, maxPack: integer;
    ver, prom: real;
begin
    numVer:= 0; maxPack:= -999; prom:= 0;
    for i:= 1 to dimL do begin
        numVersionFunction:= numVersion(vecCom, numVer, i);
        maxPackVerFunction:= maxPackVer(vecCom, maxPack, ver, i);
        prom:= prom + vecCom[i].numAcco;
    end;
    promAccoFunction:= (prom/dimL);
end;

var
    vecCom: vComputer;
    dimL, numVersionFunction: integer;
    promAccoFunction, maxPackVerFunction: real;
begin
    dimL:= 0; numVersionFunction:= 0; promAccoFunction:= 0; maxPackVerFunction:= 0;
    loadVector(vecCom, dimL); //carga el vector con la información requerida
    ProcessAll(vecCom, dimL, numVersionFunction, promAccoFunction, maxPackVerFunction); //procesa los 3 incisos
    writeln('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04: ', numVersionFunction);
    writeln('promedio de cuentas de usuario por computadora: ', promAccoFunction);
    writeln('versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados: ', maxPackVerFunction);
end.
