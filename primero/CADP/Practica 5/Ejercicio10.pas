program excercise10;
const
    numPhoto= 200;
type
    photo= record
    title: string;
    author: string;
    numLike: integer;
    numClick: integer;
    numComment: integer;
    end;
    
    vectorPhoto= array[1..numPhoto] of photo;
    
procedure readPhoto(var p: photo);
begin
    with p do begin
        writeln('Introduzca título de la foto');
        readln(title);
        writeln('Introduzca autor de la foto');
        readln(author);
        writeln('Introduzca el número de likes');
        readln(numLike);
        writeln('Introduzca el número de clicks');
        readln(numClick);
        writeln('Introduzca el número de comentarios');
        readln(numComment);
    end;
end;

procedure loadVector(var vecP: vectorPhoto);
var
    i: integer;
begin
    for i:= 1 to numPhoto do begin
        readPhoto(vecP[i]); //por cada posición del vector, llama al procedimiento leer foto
    end;
end;

function mostViewed(vecP: vectorPhoto; var maxClick: integer; var mostViewedTitle: string; i: integer): string;
begin
    if(maxClick < vecP[i].numClick)then begin
        maxClick:= vecP[i].numClick;
        mostViewedTitle:= vecP[i].title;
    end;
    mostViewed:= mostViewedTitle;
end;

function numLikesAV(vecP: vectorPhoto; var maxlikes: integer; i: integer): integer;
begin
    if(vecP[i].author = 'Art Vandelay') then begin
        maxlikes:= maxLikes + vecP[i].numLike;
    end;
    numLikesAV:= maxlikes;
end;

function numComments(vecP: vectorPhoto; maxComments: integer; i: integer): integer;
begin
    maxComments:= maxComments + vecP[i].numComment;
    numComments:= maxComments;
end;

procedure processAll(vecP: vectorPhoto; var numLikesAVFunction: integer; var mostViewedFunction: string; var numCommentsFunction: integer);
var
    i, maxClick, maxlikes, maxComments: integer;
    mostViewedTitle: string;
begin
    maxClick:= -1; maxlikes:= 0; maxComments:= 0;
    for i:= 1 to numPhoto do begin //por cada posición del vector
        mostViewedFunction:= mostViewed(vecP, maxClick, mostViewedTitle, i); //actualiza − Título de la foto más vista (la que posee mayor cantidad de clics)
        numLikesAVFunction:= numLikesAV(vecP, maxlikes, i); //actualiza − Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
        numComments(vecP, maxComments, i); //actualiza − Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
    end;
end;

var
    vecPhoto: vectorPhoto;
    numLikesAVFunction, numCommentsFunction: integer;
    mostViewedFunction: string;
begin
    numLikesAVFunction:= 0; numCommentsFunction:= 0;
    loadVector(vecPhoto); //carga la información en el vector
    processAll(vecPhoto, numLikesAVFunction, mostViewedFunction, numCommentsFunction); //procesa los datos requeridos
    writeln('El título de la foto mas vista es ', mostViewedFunction);
    writeln('La cantidad total de MG que recibieron las fotos de Art Vandelay es de ', numLikesAVFunction);
    writeln('La cantidad total de comentarios que recibieron las fotos es de ', numCommentsFunction);
end.
