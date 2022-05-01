{
El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
* 
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.   
}
program ejercicio11;
const
	dimF = 200;

type
	fotoPublicada = record
		titulo:string;
		autor:string;
		cantMeGusta:integer;
		cantClics:integer;
		cantComentarios:integer;
	end;
	
arrFotos = array [1..dimF] of fotoPublicada;

	
procedure leerFotoPublicada (var foto:fotoPublicada);
begin
	writeln('Ingrese el titulo de la foto');
	readln(foto.titulo);
	writeln('Ingrese el autor de la foto');
	readln(foto.autor);
	writeln('Ingrese la cantidad de me gusta de la foto');
	readln(foto.cantMeGusta);
	writeln('Ingrese la cantidad de clics de la foto');
	readln(foto.cantClics);
	writeln('Ingrese la cantidad de comentarios en la foto');
	readln(foto.cantComentarios);
end;

procedure cargarArray (var arr:arrFotos ; var foto:fotoPublicada);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		leerFotoPublicada(foto);
		arr[i] := foto;
	end;
end;

procedure obtenerFotoMasVista (arr:arrFotos ; var max:integer ; var maxTitulo:string);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		if (arr[i].cantClics > max) then begin
			maxTitulo:= arr[i].titulo;
			max:= arr[i].cantClics;
		end;
	end;	
end;

function cantMegusta (arr:arrFotos):integer;
var
	i, totalMeGusta:integer;
begin
	totalMeGusta:=0;
	for i:=1 to dimF do begin
		if (arr[i].autor = 'Art Vandelay') then
			totalMeGusta:= totalMeGusta + arr[i].cantMegusta;
	end;
	cantMegusta:= totalMeGusta;
end;

var
arr:arrFotos;
foto:fotoPublicada;
max, i:integer;
maxTitulo:string;

BEGIN
	max:= -1;
	maxTitulo:= '';
	cargarArray(arr, foto);
	obtenerFotoMasVista(arr, max, maxTitulo);
	writeln('La foto mas vista (con mayor cantidad de clics) es: ', maxTitulo, 'con ', max, ' clics');
	writeln('La cantidad de me gusta en las fotos del artista Art Vandelay son: ', cantMeGusta(arr));
	for i:=1 to dimF do begin
		writeln('La foto numero ', i, ' tiene ', arr[i].cantComentarios, ' comentarios.');
	end;
END.

